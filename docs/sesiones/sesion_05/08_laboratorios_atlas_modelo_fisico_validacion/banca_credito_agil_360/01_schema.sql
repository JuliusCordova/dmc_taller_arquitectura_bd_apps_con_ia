CREATE EXTENSION IF NOT EXISTS pgcrypto;

DROP SCHEMA IF EXISTS dmc_s05_banca CASCADE;
CREATE SCHEMA dmc_s05_banca;
SET search_path TO dmc_s05_banca, public;

CREATE TABLE customer (
    customer_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_number VARCHAR(30) NOT NULL UNIQUE,
    document_type VARCHAR(10) NOT NULL,
    document_number VARCHAR(30) NOT NULL,
    full_name VARCHAR(200) NOT NULL,
    email VARCHAR(254),
    recurring_income BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by VARCHAR(120) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by VARCHAR(120) NOT NULL,
    row_version BIGINT NOT NULL DEFAULT 1,
    CONSTRAINT uq_customer_document UNIQUE (document_type, document_number)
);

CREATE TABLE loan_application (
    application_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    application_number VARCHAR(40) NOT NULL UNIQUE,
    customer_id UUID NOT NULL,
    channel_code VARCHAR(20) NOT NULL,
    requested_amount NUMERIC(14,2) NOT NULL,
    requested_term_months SMALLINT NOT NULL,
    status_code VARCHAR(30) NOT NULL,
    idempotency_key UUID NOT NULL UNIQUE,
    submitted_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by VARCHAR(120) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by VARCHAR(120) NOT NULL,
    row_version BIGINT NOT NULL DEFAULT 1,
    CONSTRAINT fk_application_customer
      FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT ck_application_amount CHECK (requested_amount > 0),
    CONSTRAINT ck_application_term CHECK (requested_term_months BETWEEN 1 AND 120),
    CONSTRAINT ck_application_channel CHECK (
      channel_code IN ('MOBILE','WEB','BRANCH','CONTACT_CENTER')
    ),
    CONSTRAINT ck_application_status CHECK (
      status_code IN (
        'DRAFT','PENDING_INFORMATION','IN_EVALUATION','REQUIRES_DOCUMENT',
        'REQUIRES_VALIDATION','APPROVED','NOT_APPROVED','PENDING_ACCEPTANCE',
        'READY_FOR_DISBURSEMENT','DISBURSED','CANCELLED'
      )
    )
);

CREATE TABLE application_document (
    document_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    application_id UUID NOT NULL,
    document_type VARCHAR(40) NOT NULL,
    storage_uri TEXT NOT NULL,
    sha256 CHAR(64) NOT NULL,
    extraction_confidence NUMERIC(5,4),
    received_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by VARCHAR(120) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by VARCHAR(120) NOT NULL,
    row_version BIGINT NOT NULL DEFAULT 1,
    CONSTRAINT fk_document_application
      FOREIGN KEY (application_id) REFERENCES loan_application(application_id),
    CONSTRAINT uq_document_hash_per_application UNIQUE (application_id, sha256),
    CONSTRAINT ck_document_confidence CHECK (
      extraction_confidence IS NULL OR extraction_confidence BETWEEN 0 AND 1
    )
);

CREATE TABLE credit_evaluation (
    evaluation_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    application_id UUID NOT NULL,
    evaluation_sequence INTEGER NOT NULL,
    ruleset_version VARCHAR(80) NOT NULL,
    score_value NUMERIC(10,4),
    outcome_code VARCHAR(30) NOT NULL,
    input_snapshot JSONB NOT NULL,
    evaluated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    created_by VARCHAR(120) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_by VARCHAR(120) NOT NULL,
    row_version BIGINT NOT NULL DEFAULT 1,
    CONSTRAINT fk_evaluation_application
      FOREIGN KEY (application_id) REFERENCES loan_application(application_id),
    CONSTRAINT uq_evaluation_sequence UNIQUE (application_id, evaluation_sequence),
    CONSTRAINT ck_evaluation_sequence CHECK (evaluation_sequence > 0),
    CONSTRAINT ck_evaluation_outcome CHECK (
      outcome_code IN ('APPROVED','REJECTED','OBSERVED','MANUAL_REVIEW')
    )
);

CREATE INDEX ix_loan_application_customer
    ON loan_application(customer_id);

CREATE INDEX ix_application_document_application
    ON application_document(application_id);

CREATE INDEX ix_credit_evaluation_application
    ON credit_evaluation(application_id, evaluated_at DESC);
