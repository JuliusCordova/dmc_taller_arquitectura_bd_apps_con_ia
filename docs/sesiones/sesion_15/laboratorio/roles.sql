DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'app_readonly') THEN
    CREATE ROLE app_readonly NOLOGIN;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'app_writer') THEN
    CREATE ROLE app_writer NOLOGIN;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'api_reportes') THEN
    CREATE ROLE api_reportes LOGIN PASSWORD 'lab_only_reportes' IN ROLE app_readonly;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'api_pedidos') THEN
    CREATE ROLE api_pedidos LOGIN PASSWORD 'lab_only_pedidos' IN ROLE app_writer;
  END IF;
END
$$;

REVOKE ALL ON DATABASE pedidos FROM PUBLIC;
GRANT CONNECT ON DATABASE pedidos TO app_readonly, app_writer;

REVOKE CREATE ON SCHEMA public FROM PUBLIC;
GRANT USAGE ON SCHEMA public TO app_readonly, app_writer;

REVOKE ALL ON ALL TABLES IN SCHEMA public FROM app_readonly, app_writer;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA public FROM app_readonly, app_writer;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_readonly;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO app_writer;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO app_writer;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT SELECT ON TABLES TO app_readonly;
ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT SELECT, INSERT, UPDATE ON TABLES TO app_writer;
ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT USAGE ON SEQUENCES TO app_writer;
