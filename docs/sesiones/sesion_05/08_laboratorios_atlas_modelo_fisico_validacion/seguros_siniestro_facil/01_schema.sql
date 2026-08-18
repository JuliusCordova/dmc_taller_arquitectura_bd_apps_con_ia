CREATE EXTENSION IF NOT EXISTS pgcrypto;

DROP SCHEMA IF EXISTS dmc_s05_seguros CASCADE;
CREATE SCHEMA dmc_s05_seguros;
SET search_path TO dmc_s05_seguros, public;

CREATE TABLE party (
    party_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    document_type VARCHAR(10) NOT NULL,
    document_number VARCHAR(30) NOT NULL,
    full_name VARCHAR(200) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by VARCHAR(120) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by VARCHAR(120) NOT NULL,
    row_version BIGINT NOT NULL DEFAULT 1,
    CONSTRAINT uq_party_document UNIQUE (document_type, document_number)
);

CREATE TABLE vehicle (
    vehicle_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    plate VARCHAR(12) NOT NULL UNIQUE,
    vin VARCHAR(40),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by VARCHAR(120) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by VARCHAR(120) NOT NULL,
    row_version BIGINT NOT NULL DEFAULT 1
);

CREATE TABLE policy (
    policy_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    policy_number VARCHAR(40) NOT NULL UNIQUE,
    insured_party_id UUID NOT NULL,
    vehicle_id UUID NOT NULL,
    status_code VARCHAR(20) NOT NULL,
    valid_from DATE NOT NULL,
    valid_to DATE NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by VARCHAR(120) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by VARCHAR(120) NOT NULL,
    row_version BIGINT NOT NULL DEFAULT 1,
    CONSTRAINT fk_policy_party FOREIGN KEY (insured_party_id) REFERENCES party(party_id),
    CONSTRAINT fk_policy_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id),
    CONSTRAINT ck_policy_status CHECK (status_code IN ('ACTIVE','INACTIVE','CANCELLED','EXPIRED')),
    CONSTRAINT ck_policy_dates CHECK (valid_to >= valid_from)
);

CREATE TABLE claim (
    claim_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    claim_number VARCHAR(40) NOT NULL UNIQUE,
    policy_id UUID NOT NULL,
    vehicle_id UUID NOT NULL,
    reported_by_party_id UUID NOT NULL,
    event_at TIMESTAMPTZ NOT NULL,
    reported_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    location_text VARCHAR(300),
    event_type VARCHAR(40) NOT NULL,
    status_code VARCHAR(30) NOT NULL,
    idempotency_key UUID NOT NULL UNIQUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by VARCHAR(120) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by VARCHAR(120) NOT NULL,
    row_version BIGINT NOT NULL DEFAULT 1,
    CONSTRAINT fk_claim_policy FOREIGN KEY (policy_id) REFERENCES policy(policy_id),
    CONSTRAINT fk_claim_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id),
    CONSTRAINT fk_claim_reporter FOREIGN KEY (reported_by_party_id) REFERENCES party(party_id),
    CONSTRAINT ck_claim_event_time CHECK (event_at <= reported_at),
    CONSTRAINT ck_claim_status CHECK (
      status_code IN (
        'REPORTED','VALIDATING_COVERAGE','ASSISTANCE_COORDINATED','EVIDENCE_PENDING',
        'IN_EVALUATION','INSPECTION_SCHEDULED','ESTIMATE_RECEIVED','AUTHORIZED',
        'OBSERVED','REJECTED','IN_REPAIR','READY_FOR_DELIVERY','INDEMNIFIED','CLOSED'
      )
    )
);

CREATE TABLE claim_evidence (
    evidence_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    claim_id UUID NOT NULL,
    evidence_type VARCHAR(40) NOT NULL,
    original_uri TEXT NOT NULL,
    sha256 CHAR(64) NOT NULL,
    captured_at TIMESTAMPTZ,
    received_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    source_code VARCHAR(40) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by VARCHAR(120) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by VARCHAR(120) NOT NULL,
    row_version BIGINT NOT NULL DEFAULT 1,
    CONSTRAINT fk_evidence_claim FOREIGN KEY (claim_id) REFERENCES claim(claim_id),
    CONSTRAINT uq_claim_evidence_hash UNIQUE (claim_id, sha256)
);

CREATE TABLE workshop (
    workshop_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tax_id VARCHAR(20) NOT NULL UNIQUE,
    workshop_name VARCHAR(200) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by VARCHAR(120) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by VARCHAR(120) NOT NULL,
    row_version BIGINT NOT NULL DEFAULT 1
);

CREATE TABLE repair_estimate (
    estimate_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    claim_id UUID NOT NULL,
    workshop_id UUID NOT NULL,
    estimate_number VARCHAR(40) NOT NULL,
    version_no INTEGER NOT NULL,
    amount NUMERIC(14,2) NOT NULL,
    currency_code CHAR(3) NOT NULL,
    status_code VARCHAR(20) NOT NULL,
    valid_until DATE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by VARCHAR(120) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by VARCHAR(120) NOT NULL,
    row_version BIGINT NOT NULL DEFAULT 1,
    CONSTRAINT fk_estimate_claim FOREIGN KEY (claim_id) REFERENCES claim(claim_id),
    CONSTRAINT fk_estimate_workshop FOREIGN KEY (workshop_id) REFERENCES workshop(workshop_id),
    CONSTRAINT uq_estimate_version UNIQUE (workshop_id, estimate_number, version_no),
    CONSTRAINT ck_estimate_version CHECK (version_no > 0),
    CONSTRAINT ck_estimate_amount CHECK (amount > 0),
    CONSTRAINT ck_estimate_status CHECK (status_code IN ('SUBMITTED','OBSERVED','APPROVED','REJECTED','SUPERSEDED'))
);

CREATE TABLE fraud_alert (
    alert_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    claim_id UUID NOT NULL,
    alert_type VARCHAR(60) NOT NULL,
    severity_code VARCHAR(20) NOT NULL,
    rule_or_model_version VARCHAR(100) NOT NULL,
    explanation TEXT NOT NULL,
    status_code VARCHAR(20) NOT NULL,
    generated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    reviewed_by VARCHAR(120),
    reviewed_at TIMESTAMPTZ,
    review_justification TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by VARCHAR(120) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by VARCHAR(120) NOT NULL,
    row_version BIGINT NOT NULL DEFAULT 1,
    CONSTRAINT fk_alert_claim FOREIGN KEY (claim_id) REFERENCES claim(claim_id),
    CONSTRAINT ck_alert_severity CHECK (severity_code IN ('LOW','MEDIUM','HIGH','CRITICAL')),
    CONSTRAINT ck_alert_status CHECK (status_code IN ('OPEN','CONFIRMED','DISMISSED','MORE_INFO_REQUIRED'))
);

CREATE INDEX ix_claim_policy ON claim(policy_id);
CREATE INDEX ix_claim_vehicle ON claim(vehicle_id);
CREATE INDEX ix_evidence_claim ON claim_evidence(claim_id, received_at DESC);
CREATE INDEX ix_estimate_claim ON repair_estimate(claim_id, created_at DESC);
CREATE INDEX ix_alert_claim ON fraud_alert(claim_id, generated_at DESC);
