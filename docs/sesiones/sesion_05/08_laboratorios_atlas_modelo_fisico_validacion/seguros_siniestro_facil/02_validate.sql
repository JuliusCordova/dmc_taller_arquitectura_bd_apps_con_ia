\set ON_ERROR_STOP on
SET search_path TO dmc_s05_seguros, public;

\echo '--- Seguros · pruebas positivas ---'

INSERT INTO party (
  party_id, document_type, document_number, full_name, created_by, updated_by
) VALUES (
  '11111111-aaaa-1111-aaaa-111111111111', 'DNI', '71000001',
  'Asegurado Sintetico Uno', 'lab_s05', 'lab_s05'
);

INSERT INTO vehicle (
  vehicle_id, plate, vin, created_by, updated_by
) VALUES (
  '22222222-aaaa-2222-aaaa-222222222222', 'ABC-123', 'VIN-SYNTH-0001',
  'lab_s05', 'lab_s05'
);

INSERT INTO policy (
  policy_id, policy_number, insured_party_id, vehicle_id,
  status_code, valid_from, valid_to, created_by, updated_by
) VALUES (
  '33333333-aaaa-3333-aaaa-333333333333', 'POL-2026-0001',
  '11111111-aaaa-1111-aaaa-111111111111',
  '22222222-aaaa-2222-aaaa-222222222222',
  'ACTIVE', DATE '2026-01-01', DATE '2026-12-31', 'lab_s05', 'lab_s05'
);

INSERT INTO claim (
  claim_id, claim_number, policy_id, vehicle_id, reported_by_party_id,
  event_at, reported_at, location_text, event_type, status_code,
  idempotency_key, created_by, updated_by
) VALUES (
  '44444444-aaaa-4444-aaaa-444444444444', 'CLM-2026-0001',
  '33333333-aaaa-3333-aaaa-333333333333',
  '22222222-aaaa-2222-aaaa-222222222222',
  '11111111-aaaa-1111-aaaa-111111111111',
  TIMESTAMPTZ '2026-08-17 18:00:00-05', TIMESTAMPTZ '2026-08-17 18:10:00-05',
  'Lima - ubicacion sintetica', 'COLLISION', 'REPORTED',
  'aaaaaaaa-bbbb-aaaa-bbbb-aaaaaaaaaaaa', 'lab_s05', 'lab_s05'
);

INSERT INTO claim_evidence (
  evidence_id, claim_id, evidence_type, original_uri, sha256,
  captured_at, source_code, created_by, updated_by
) VALUES (
  '55555555-aaaa-5555-aaaa-555555555555',
  '44444444-aaaa-4444-aaaa-444444444444',
  'PHOTO', 'gs://dmc-synthetic/seguros/original/photo-01.jpg', repeat('c', 64),
  TIMESTAMPTZ '2026-08-17 18:03:00-05', 'MOBILE_APP', 'lab_s05', 'lab_s05'
);

INSERT INTO workshop (
  workshop_id, tax_id, workshop_name, created_by, updated_by
) VALUES (
  '66666666-aaaa-6666-aaaa-666666666666', '20999999991',
  'Taller Sintetico Centro', 'lab_s05', 'lab_s05'
);

INSERT INTO repair_estimate (
  estimate_id, claim_id, workshop_id, estimate_number, version_no,
  amount, currency_code, status_code, valid_until, created_by, updated_by
) VALUES (
  '77777777-aaaa-7777-aaaa-777777777777',
  '44444444-aaaa-4444-aaaa-444444444444',
  '66666666-aaaa-6666-aaaa-666666666666',
  'EST-0001', 1, 4500.00, 'PEN', 'SUBMITTED', DATE '2026-09-01',
  'workshop_portal', 'workshop_portal'
);

INSERT INTO fraud_alert (
  alert_id, claim_id, alert_type, severity_code,
  rule_or_model_version, explanation, status_code,
  created_by, updated_by
) VALUES (
  '88888888-aaaa-8888-aaaa-888888888888',
  '44444444-aaaa-4444-aaaa-444444444444',
  'IMAGE_REUSE_SIGNAL', 'MEDIUM', 'fraud-rule-2026.08-v3',
  'Coincidencia sintetica para fines de prueba; no equivale a fraude confirmado.',
  'OPEN', 'fraud_engine', 'fraud_engine'
);

DO $$
DECLARE
  v_created_at TIMESTAMPTZ;
  v_row_version BIGINT;
BEGIN
  SELECT created_at, row_version
    INTO v_created_at, v_row_version
  FROM claim
  WHERE claim_id = '44444444-aaaa-4444-aaaa-444444444444';

  IF v_created_at IS NULL OR v_row_version <> 1 THEN
    RAISE EXCEPTION 'FAIL audit defaults';
  END IF;
  RAISE NOTICE 'PASS audit defaults on claim';
END $$;

DO $$
DECLARE
  v_hash TEXT;
  v_uri TEXT;
BEGIN
  SELECT sha256, original_uri
    INTO v_hash, v_uri
  FROM claim_evidence
  WHERE evidence_id = '55555555-aaaa-5555-aaaa-555555555555';

  IF length(v_hash) <> 64 OR v_uri IS NULL THEN
    RAISE EXCEPTION 'FAIL evidence reproducibility fields';
  END IF;
  RAISE NOTICE 'PASS evidence keeps original URI and SHA-256';
END $$;

DO $$
DECLARE
  v_version TEXT;
  v_explanation TEXT;
BEGIN
  SELECT rule_or_model_version, explanation
    INTO v_version, v_explanation
  FROM fraud_alert
  WHERE alert_id = '88888888-aaaa-8888-aaaa-888888888888';

  IF v_version IS NULL OR v_explanation IS NULL THEN
    RAISE EXCEPTION 'FAIL fraud alert reproducibility';
  END IF;
  RAISE NOTICE 'PASS fraud alert is explainable and versioned';
END $$;

\echo '--- Seguros · pruebas negativas esperadas ---'

DO $$
BEGIN
  BEGIN
    INSERT INTO claim (
      claim_number, policy_id, vehicle_id, reported_by_party_id,
      event_at, event_type, status_code, idempotency_key, created_by, updated_by
    ) VALUES (
      'CLM-NEG-FK', '99999999-aaaa-9999-aaaa-999999999999',
      '22222222-aaaa-2222-aaaa-222222222222',
      '11111111-aaaa-1111-aaaa-111111111111', now() - interval '10 minutes',
      'COLLISION', 'REPORTED', gen_random_uuid(), 'lab_s05', 'lab_s05'
    );
    RAISE EXCEPTION 'FAIL: siniestro con poliza inexistente fue aceptado';
  EXCEPTION WHEN foreign_key_violation THEN
    RAISE NOTICE 'PASS FK de poliza rechazo referencia inexistente';
  END;
END $$;

DO $$
BEGIN
  BEGIN
    INSERT INTO claim (
      claim_number, policy_id, vehicle_id, reported_by_party_id,
      event_at, event_type, status_code, idempotency_key, created_by, updated_by
    ) VALUES (
      'CLM-NEG-IDEMP', '33333333-aaaa-3333-aaaa-333333333333',
      '22222222-aaaa-2222-aaaa-222222222222',
      '11111111-aaaa-1111-aaaa-111111111111', now() - interval '10 minutes',
      'COLLISION', 'REPORTED', 'aaaaaaaa-bbbb-aaaa-bbbb-aaaaaaaaaaaa',
      'lab_s05', 'lab_s05'
    );
    RAISE EXCEPTION 'FAIL: idempotency_key duplicado fue aceptado';
  EXCEPTION WHEN unique_violation THEN
    RAISE NOTICE 'PASS UNIQUE de idempotency_key evito reporte duplicado';
  END;
END $$;

DO $$
BEGIN
  BEGIN
    INSERT INTO claim_evidence (
      claim_id, evidence_type, original_uri, sha256, source_code, created_by, updated_by
    ) VALUES (
      '44444444-aaaa-4444-aaaa-444444444444', 'PHOTO',
      'gs://dmc-synthetic/seguros/original/photo-duplicate.jpg', repeat('c', 64),
      'MOBILE_APP', 'lab_s05', 'lab_s05'
    );
    RAISE EXCEPTION 'FAIL: evidencia duplicada fue aceptada';
  EXCEPTION WHEN unique_violation THEN
    RAISE NOTICE 'PASS hash unico por siniestro evito evidencia duplicada';
  END;
END $$;

DO $$
BEGIN
  BEGIN
    INSERT INTO repair_estimate (
      claim_id, workshop_id, estimate_number, version_no,
      amount, currency_code, status_code, created_by, updated_by
    ) VALUES (
      '44444444-aaaa-4444-aaaa-444444444444',
      '66666666-aaaa-6666-aaaa-666666666666', 'EST-NEG-AMOUNT', 1,
      0, 'PEN', 'SUBMITTED', 'lab_s05', 'lab_s05'
    );
    RAISE EXCEPTION 'FAIL: presupuesto no positivo fue aceptado';
  EXCEPTION WHEN check_violation THEN
    RAISE NOTICE 'PASS ck_estimate_amount rechazo monto no positivo';
  END;
END $$;

DO $$
BEGIN
  BEGIN
    INSERT INTO fraud_alert (
      claim_id, alert_type, severity_code, rule_or_model_version,
      explanation, status_code, created_by, updated_by
    ) VALUES (
      '44444444-aaaa-4444-aaaa-444444444444', 'TEST', 'EXTREME',
      'test-v1', 'Prueba sintetica', 'OPEN', 'lab_s05', 'lab_s05'
    );
    RAISE EXCEPTION 'FAIL: severidad invalida fue aceptada';
  EXCEPTION WHEN check_violation THEN
    RAISE NOTICE 'PASS ck_alert_severity rechazo dominio invalido';
  END;
END $$;

\echo 'PASS · Seguros · todas las pruebas previstas fueron ejecutadas.'
