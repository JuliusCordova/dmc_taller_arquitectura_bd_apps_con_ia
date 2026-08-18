\set ON_ERROR_STOP on
SET search_path TO dmc_s05_retail, public;

\echo '--- Retail · pruebas positivas ---'

INSERT INTO sku (
  sku_id, sku_code, product_name, serialized, created_by, updated_by
) VALUES (
  '11111111-bbbb-1111-bbbb-111111111111', 'SKU-TECH-0001',
  'Producto Sintetico Uno', FALSE, 'lab_s05', 'lab_s05'
);

INSERT INTO location (
  location_id, location_code, location_type, location_name, created_by, updated_by
) VALUES (
  '22222222-bbbb-2222-bbbb-222222222222', 'STORE-LIM-001',
  'STORE', 'Tienda Sintetica Lima 001', 'lab_s05', 'lab_s05'
);

INSERT INTO inventory_balance (
  balance_id, sku_id, location_id, qty_on_hand, qty_reserved,
  qty_blocked, safety_stock, created_by, updated_by
) VALUES (
  '33333333-bbbb-3333-bbbb-333333333333',
  '11111111-bbbb-1111-bbbb-111111111111',
  '22222222-bbbb-2222-bbbb-222222222222',
  20, 4, 2, 3, 'lab_s05', 'lab_s05'
);

INSERT INTO inventory_reservation (
  reservation_id, reservation_number, sku_id, location_id, quantity,
  source_code, status_code, idempotency_key, expires_at, created_by, updated_by
) VALUES (
  '44444444-bbbb-4444-bbbb-444444444444', 'RES-2026-0001',
  '11111111-bbbb-1111-bbbb-111111111111',
  '22222222-bbbb-2222-bbbb-222222222222',
  2, 'ECOMMERCE', 'ACTIVE',
  'aaaaaaaa-cccc-aaaa-cccc-aaaaaaaaaaaa', now() + interval '15 minutes',
  'checkout', 'checkout'
);

INSERT INTO inventory_movement (
  movement_id, event_id, sku_id, location_id, movement_type,
  quantity_delta, previous_quantity, new_quantity, occurred_at,
  source_document, reason_text, created_by, updated_by
) VALUES (
  '55555555-bbbb-5555-bbbb-555555555555',
  'bbbbbbbb-cccc-bbbb-cccc-bbbbbbbbbbbb',
  '11111111-bbbb-1111-bbbb-111111111111',
  '22222222-bbbb-2222-bbbb-222222222222',
  'ADJUSTMENT', 1, 19, 20, now(), 'COUNT-TEST-001',
  'Ajuste sintetico del laboratorio', 'inventory_service', 'inventory_service'
);

DO $$
DECLARE
  v_available INTEGER;
  v_created_at TIMESTAMPTZ;
  v_row_version BIGINT;
BEGIN
  SELECT qty_available, created_at, row_version
    INTO v_available, v_created_at, v_row_version
  FROM inventory_balance
  WHERE balance_id = '33333333-bbbb-3333-bbbb-333333333333';

  IF v_available <> 11 THEN
    RAISE EXCEPTION 'FAIL qty_available esperado=11 obtenido=%', v_available;
  END IF;

  IF v_created_at IS NULL OR v_row_version <> 1 THEN
    RAISE EXCEPTION 'FAIL audit defaults';
  END IF;

  RAISE NOTICE 'PASS balance derivado y auditado';
END $$;

DO $$
DECLARE
  v_count INTEGER;
BEGIN
  SELECT count(*) INTO v_count
  FROM inventory_balance
  WHERE sku_id = '11111111-bbbb-1111-bbbb-111111111111'
    AND location_id = '22222222-bbbb-2222-bbbb-222222222222';

  IF v_count <> 1 THEN
    RAISE EXCEPTION 'FAIL saldo unico por SKU/ubicacion';
  END IF;
  RAISE NOTICE 'PASS saldo unico por SKU/ubicacion';
END $$;

\echo '--- Retail · pruebas negativas esperadas ---'

DO $$
BEGIN
  BEGIN
    INSERT INTO inventory_balance (
      sku_id, location_id, qty_on_hand, qty_reserved, qty_blocked,
      safety_stock, created_by, updated_by
    ) VALUES (
      '11111111-bbbb-1111-bbbb-111111111111',
      '22222222-bbbb-2222-bbbb-222222222222',
      -1, 0, 0, 0, 'lab_s05', 'lab_s05'
    );
    RAISE EXCEPTION 'FAIL: cantidad negativa fue aceptada';
  EXCEPTION WHEN check_violation THEN
    RAISE NOTICE 'PASS ck_balance_nonnegative rechazo cantidad negativa';
  WHEN unique_violation THEN
    -- La clave compuesta puede dispararse antes según el plan; usamos otra ubicación en la prueba siguiente.
    RAISE NOTICE 'PASS control de unicidad tambien evita un segundo saldo para el mismo SKU/ubicacion';
  END;
END $$;

DO $$
DECLARE
  v_location UUID := '99999999-bbbb-9999-bbbb-999999999999';
BEGIN
  INSERT INTO location (
    location_id, location_code, location_type, location_name, created_by, updated_by
  ) VALUES (
    v_location, 'STORE-LIM-NEG', 'STORE', 'Tienda Sintetica Negativa', 'lab_s05', 'lab_s05'
  );

  BEGIN
    INSERT INTO inventory_balance (
      sku_id, location_id, qty_on_hand, qty_reserved, qty_blocked,
      safety_stock, created_by, updated_by
    ) VALUES (
      '11111111-bbbb-1111-bbbb-111111111111', v_location,
      -1, 0, 0, 0, 'lab_s05', 'lab_s05'
    );
    RAISE EXCEPTION 'FAIL: saldo negativo fue aceptado';
  EXCEPTION WHEN check_violation THEN
    RAISE NOTICE 'PASS ck_balance_nonnegative rechazo saldo negativo';
  END;
END $$;

DO $$
BEGIN
  BEGIN
    INSERT INTO inventory_reservation (
      reservation_number, sku_id, location_id, quantity, source_code,
      status_code, idempotency_key, expires_at, created_by, updated_by
    ) VALUES (
      'RES-NEG-QTY', '11111111-bbbb-1111-bbbb-111111111111',
      '22222222-bbbb-2222-bbbb-222222222222', 0, 'ECOMMERCE',
      'ACTIVE', gen_random_uuid(), now() + interval '10 minutes', 'lab_s05', 'lab_s05'
    );
    RAISE EXCEPTION 'FAIL: reserva con cantidad 0 fue aceptada';
  EXCEPTION WHEN check_violation THEN
    RAISE NOTICE 'PASS ck_reservation_quantity rechazo cantidad 0';
  END;
END $$;

DO $$
BEGIN
  BEGIN
    INSERT INTO inventory_reservation (
      reservation_number, sku_id, location_id, quantity, source_code,
      status_code, idempotency_key, expires_at, created_by, updated_by
    ) VALUES (
      'RES-NEG-IDEMP', '11111111-bbbb-1111-bbbb-111111111111',
      '22222222-bbbb-2222-bbbb-222222222222', 1, 'ECOMMERCE',
      'ACTIVE', 'aaaaaaaa-cccc-aaaa-cccc-aaaaaaaaaaaa',
      now() + interval '10 minutes', 'lab_s05', 'lab_s05'
    );
    RAISE EXCEPTION 'FAIL: idempotency_key duplicado fue aceptado';
  EXCEPTION WHEN unique_violation THEN
    RAISE NOTICE 'PASS UNIQUE de idempotency_key evito doble reserva';
  END;
END $$;

DO $$
BEGIN
  BEGIN
    INSERT INTO inventory_movement (
      event_id, sku_id, location_id, movement_type, quantity_delta,
      occurred_at, created_by, updated_by
    ) VALUES (
      'bbbbbbbb-cccc-bbbb-cccc-bbbbbbbbbbbb',
      '11111111-bbbb-1111-bbbb-111111111111',
      '22222222-bbbb-2222-bbbb-222222222222',
      'ADJUSTMENT', 2, now(), 'lab_s05', 'lab_s05'
    );
    RAISE EXCEPTION 'FAIL: event_id duplicado fue aceptado';
  EXCEPTION WHEN unique_violation THEN
    RAISE NOTICE 'PASS UNIQUE de event_id evito reprocesamiento';
  END;
END $$;

DO $$
BEGIN
  BEGIN
    INSERT INTO inventory_movement (
      event_id, sku_id, location_id, movement_type, quantity_delta,
      occurred_at, created_by, updated_by
    ) VALUES (
      gen_random_uuid(),
      '11111111-bbbb-1111-bbbb-111111111111',
      '22222222-bbbb-2222-bbbb-222222222222',
      'ADJUSTMENT', 0, now(), 'lab_s05', 'lab_s05'
    );
    RAISE EXCEPTION 'FAIL: movimiento delta 0 fue aceptado';
  EXCEPTION WHEN check_violation THEN
    RAISE NOTICE 'PASS ck_movement_delta rechazo delta 0';
  END;
END $$;

DO $$
BEGIN
  BEGIN
    INSERT INTO inventory_reservation (
      reservation_number, sku_id, location_id, quantity, source_code,
      status_code, idempotency_key, expires_at, created_by, updated_by
    ) VALUES (
      'RES-NEG-FK', 'ffffffff-bbbb-ffff-bbbb-ffffffffffff',
      '22222222-bbbb-2222-bbbb-222222222222', 1, 'ECOMMERCE',
      'ACTIVE', gen_random_uuid(), now() + interval '10 minutes', 'lab_s05', 'lab_s05'
    );
    RAISE EXCEPTION 'FAIL: reserva con SKU inexistente fue aceptada';
  EXCEPTION WHEN foreign_key_violation THEN
    RAISE NOTICE 'PASS FK de SKU rechazo referencia inexistente';
  END;
END $$;

\echo 'PASS · Retail · todas las pruebas previstas fueron ejecutadas.'
