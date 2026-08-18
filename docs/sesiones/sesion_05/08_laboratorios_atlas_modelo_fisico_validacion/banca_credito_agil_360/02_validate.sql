\set ON_ERROR_STOP on
SET search_path TO dmc_s05_banca, public;

\echo '--- Banca · pruebas positivas ---'

INSERT INTO customer (
  customer_id, customer_number, document_type, document_number,
  full_name, email, recurring_income, created_by, updated_by
) VALUES (
  '11111111-1111-1111-1111-111111111111', 'CUST-0001', 'DNI', '70000001',
  'Cliente Sintetico Uno', 'cliente1@example.test', TRUE, 'lab_s05', 'lab_s05'
);

INSERT INTO loan_application (
  application_id, application_number, customer_id, channel_code,
  requested_amount, requested_term_months, status_code, idempotency_key,
  submitted_at, created_by, updated_by
) VALUES (
  '22222222-2222-2222-2222-222222222222', 'APP-2026-0001',
  '11111111-1111-1111-1111-111111111111', 'MOBILE',
  12000.00, 24, 'IN_EVALUATION',
  'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', now(), 'lab_s05', 'lab_s05'
);

INSERT INTO application_document (
  document_id, application_id, document_type, storage_uri, sha256,
  extraction_confidence, created_by, updated_by
) VALUES (
  '33333333-3333-3333-3333-333333333333',
  '22222222-2222-2222-2222-222222222222',
  'INCOME_PROOF', 'gs://dmc-synthetic/banca/income-proof-01.pdf',
  repeat('a', 64), 0.9825, 'lab_s05', 'lab_s05'
);

INSERT INTO credit_evaluation (
  evaluation_id, application_id, evaluation_sequence, ruleset_version,
  score_value, outcome_code, input_snapshot, created_by, updated_by
) VALUES (
  '44444444-4444-4444-4444-444444444444',
  '22222222-2222-2222-2222-222222222222',
  1, 'ruleset-2026.08-campaign-a', 742.5000, 'MANUAL_REVIEW',
  '{"income_source":"synthetic","exposure_source":"synthetic"}'::jsonb,
  'risk_engine', 'risk_engine'
);

DO $$
DECLARE
  v_created_at TIMESTAMPTZ;
  v_row_version BIGINT;
BEGIN
  SELECT created_at, row_version
    INTO v_created_at, v_row_version
  FROM loan_application
  WHERE application_id = '22222222-2222-2222-2222-222222222222';

  IF v_created_at IS NULL OR v_row_version <> 1 THEN
    RAISE EXCEPTION 'FAIL audit defaults: created_at=%, row_version=%', v_created_at, v_row_version;
  END IF;

  RAISE NOTICE 'PASS audit defaults';
END $$;

DO $$
DECLARE
  v_ruleset TEXT;
  v_snapshot JSONB;
BEGIN
  SELECT ruleset_version, input_snapshot
    INTO v_ruleset, v_snapshot
  FROM credit_evaluation
  WHERE evaluation_id = '44444444-4444-4444-4444-444444444444';

  IF v_ruleset IS NULL OR v_snapshot IS NULL THEN
    RAISE EXCEPTION 'FAIL evaluation reproducibility fields';
  END IF;

  RAISE NOTICE 'PASS evaluation keeps ruleset version and input snapshot';
END $$;

\echo '--- Banca · pruebas negativas esperadas ---'

DO $$
BEGIN
  BEGIN
    INSERT INTO loan_application (
      application_number, customer_id, channel_code, requested_amount,
      requested_term_months, status_code, idempotency_key, created_by, updated_by
    ) VALUES (
      'APP-NEG-AMOUNT', '11111111-1111-1111-1111-111111111111', 'WEB',
      0, 12, 'DRAFT', gen_random_uuid(), 'lab_s05', 'lab_s05'
    );
    RAISE EXCEPTION 'FAIL: monto 0 fue aceptado';
  EXCEPTION WHEN check_violation THEN
    RAISE NOTICE 'PASS ck_application_amount rechazó monto no positivo';
  END;
END $$;

DO $$
BEGIN
  BEGIN
    INSERT INTO loan_application (
      application_number, customer_id, channel_code, requested_amount,
      requested_term_months, status_code, idempotency_key, created_by, updated_by
    ) VALUES (
      'APP-NEG-FK', '99999999-9999-9999-9999-999999999999', 'WEB',
      5000, 12, 'DRAFT', gen_random_uuid(), 'lab_s05', 'lab_s05'
    );
    RAISE EXCEPTION 'FAIL: cliente inexistente fue aceptado';
  EXCEPTION WHEN foreign_key_violation THEN
    RAISE NOTICE 'PASS FK de cliente rechazó referencia inexistente';
  END;
END $$;

DO $$
BEGIN
  BEGIN
    INSERT INTO loan_application (
      application_number, customer_id, channel_code, requested_amount,
      requested_term_months, status_code, idempotency_key, created_by, updated_by
    ) VALUES (
      'APP-NEG-IDEMP', '11111111-1111-1111-1111-111111111111', 'MOBILE',
      9000, 18, 'DRAFT', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'lab_s05', 'lab_s05'
    );
    RAISE EXCEPTION 'FAIL: idempotency_key duplicado fue aceptado';
  EXCEPTION WHEN unique_violation THEN
    RAISE NOTICE 'PASS UNIQUE de idempotency_key evitó duplicidad';
  END;
END $$;

DO $$
BEGIN
  BEGIN
    INSERT INTO application_document (
      application_id, document_type, storage_uri, sha256,
      extraction_confidence, created_by, updated_by
    ) VALUES (
      '22222222-2222-2222-2222-222222222222', 'INCOME_PROOF',
      'gs://dmc-synthetic/banca/invalid-confidence.pdf', repeat('b', 64),
      1.2500, 'lab_s05', 'lab_s05'
    );
    RAISE EXCEPTION 'FAIL: confianza fuera de rango fue aceptada';
  EXCEPTION WHEN check_violation THEN
    RAISE NOTICE 'PASS ck_document_confidence rechazó valor fuera de 0..1';
  END;
END $$;

DO $$
BEGIN
  BEGIN
    INSERT INTO credit_evaluation (
      application_id, evaluation_sequence, ruleset_version,
      outcome_code, input_snapshot, created_by, updated_by
    ) VALUES (
      '22222222-2222-2222-2222-222222222222', 2, 'ruleset-test',
      'MAGIC_APPROVAL', '{}'::jsonb, 'lab_s05', 'lab_s05'
    );
    RAISE EXCEPTION 'FAIL: outcome no permitido fue aceptado';
  EXCEPTION WHEN check_violation THEN
    RAISE NOTICE 'PASS ck_evaluation_outcome rechazó estado no permitido';
  END;
END $$;

\echo 'PASS · Banca · todas las pruebas previstas fueron ejecutadas.'
