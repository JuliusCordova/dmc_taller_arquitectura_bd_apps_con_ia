DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id       serial PRIMARY KEY,
  email    text UNIQUE NOT NULL,
  nombre   text NOT NULL,
  telefono text
);

CREATE TABLE pedidos (
  id        serial PRIMARY KEY,
  user_id   int NOT NULL REFERENCES users(id),
  total     numeric(10,2) NOT NULL CHECK (total >= 0),
  estado    text NOT NULL DEFAULT 'CREADO',
  creado_en timestamptz NOT NULL DEFAULT now()
);

INSERT INTO users (email, nombre, telefono) VALUES
  ('ana@correo.pe',  'Ana Torres',  '999111222'),
  ('luis@correo.pe', 'Luis Rojas',  '999333444'),
  ('rosa@correo.pe', 'Rosa Quispe', '999555666');

INSERT INTO pedidos (user_id, total) VALUES
  (1, 120.50),
  (2, 89.90),
  (3, 240.00),
  (1, 35.00);
