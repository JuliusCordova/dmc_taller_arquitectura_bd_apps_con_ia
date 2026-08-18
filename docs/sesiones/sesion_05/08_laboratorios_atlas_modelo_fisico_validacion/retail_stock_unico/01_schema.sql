CREATE EXTENSION IF NOT EXISTS pgcrypto;

DROP SCHEMA IF EXISTS dmc_s05_retail CASCADE;
CREATE SCHEMA dmc_s05_retail;
SET search_path TO dmc_s05_retail, public;

CREATE TABLE sku (
    sku_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sku_code VARCHAR(40) NOT NULL UNIQUE,
    product_name VARCHAR(200) NOT NULL,
    serialized BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by VARCHAR(120) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by VARCHAR(120) NOT NULL,
    row_version BIGINT NOT NULL DEFAULT 1
);

CREATE TABLE location (
    location_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    location_code VARCHAR(40) NOT NULL UNIQUE,
    location_type VARCHAR(20) NOT NULL,
    location_name VARCHAR(200) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by VARCHAR(120) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by VARCHAR(120) NOT NULL,
    row_version BIGINT NOT NULL DEFAULT 1,
    CONSTRAINT ck_location_type CHECK (location_type IN ('STORE','DISTRIBUTION_CENTER'))
);

CREATE TABLE inventory_balance (
    balance_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sku_id UUID NOT NULL,
    location_id UUID NOT NULL,
    qty_on_hand INTEGER NOT NULL DEFAULT 0,
    qty_reserved INTEGER NOT NULL DEFAULT 0,
    qty_blocked INTEGER NOT NULL DEFAULT 0,
    safety_stock INTEGER NOT NULL DEFAULT 0,
    qty_available INTEGER GENERATED ALWAYS AS (
      GREATEST(qty_on_hand - qty_reserved - qty_blocked - safety_stock, 0)
    ) STORED,
    as_of_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by VARCHAR(120) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by VARCHAR(120) NOT NULL,
    row_version BIGINT NOT NULL DEFAULT 1,
    CONSTRAINT fk_balance_sku FOREIGN KEY (sku_id) REFERENCES sku(sku_id),
    CONSTRAINT fk_balance_location FOREIGN KEY (location_id) REFERENCES location(location_id),
    CONSTRAINT uq_balance_sku_location UNIQUE (sku_id, location_id),
    CONSTRAINT ck_balance_nonnegative CHECK (
      qty_on_hand >= 0 AND qty_reserved >= 0 AND qty_blocked >= 0 AND safety_stock >= 0
    )
);

CREATE TABLE inventory_reservation (
    reservation_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    reservation_number VARCHAR(50) NOT NULL UNIQUE,
    sku_id UUID NOT NULL,
    location_id UUID NOT NULL,
    quantity INTEGER NOT NULL,
    source_code VARCHAR(30) NOT NULL,
    status_code VARCHAR(20) NOT NULL,
    idempotency_key UUID NOT NULL UNIQUE,
    expires_at TIMESTAMPTZ NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by VARCHAR(120) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by VARCHAR(120) NOT NULL,
    row_version BIGINT NOT NULL DEFAULT 1,
    CONSTRAINT fk_reservation_sku FOREIGN KEY (sku_id) REFERENCES sku(sku_id),
    CONSTRAINT fk_reservation_location FOREIGN KEY (location_id) REFERENCES location(location_id),
    CONSTRAINT ck_reservation_quantity CHECK (quantity > 0),
    CONSTRAINT ck_reservation_status CHECK (status_code IN ('ACTIVE','CONFIRMED','RELEASED','EXPIRED','MOVED')),
    CONSTRAINT ck_reservation_expiration CHECK (expires_at > created_at)
);

CREATE TABLE inventory_movement (
    movement_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    event_id UUID NOT NULL UNIQUE,
    sku_id UUID NOT NULL,
    location_id UUID NOT NULL,
    movement_type VARCHAR(30) NOT NULL,
    quantity_delta INTEGER NOT NULL,
    previous_quantity INTEGER,
    new_quantity INTEGER,
    occurred_at TIMESTAMPTZ NOT NULL,
    source_document VARCHAR(80),
    reason_text VARCHAR(300),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by VARCHAR(120) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by VARCHAR(120) NOT NULL,
    row_version BIGINT NOT NULL DEFAULT 1,
    CONSTRAINT fk_movement_sku FOREIGN KEY (sku_id) REFERENCES sku(sku_id),
    CONSTRAINT fk_movement_location FOREIGN KEY (location_id) REFERENCES location(location_id),
    CONSTRAINT ck_movement_delta CHECK (quantity_delta <> 0),
    CONSTRAINT ck_movement_type CHECK (
      movement_type IN ('SALE','RECEIPT','TRANSFER_OUT','TRANSFER_IN','RETURN','ADJUSTMENT','DAMAGE','THEFT','CANCELLATION')
    )
);

CREATE INDEX ix_balance_location ON inventory_balance(location_id, sku_id);
CREATE INDEX ix_reservation_lookup ON inventory_reservation(sku_id, location_id, status_code, expires_at);
CREATE INDEX ix_movement_timeline ON inventory_movement(sku_id, location_id, occurred_at DESC);
