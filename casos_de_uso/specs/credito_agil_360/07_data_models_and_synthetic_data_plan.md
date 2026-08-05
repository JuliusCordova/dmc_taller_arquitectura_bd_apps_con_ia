# Plan de modelos de datos y datos sintéticos — Crédito Ágil 360

## Objetivo

Definir cómo evolucionará el diseño de datos desde conceptos de negocio hasta estructuras físicas y datasets de prueba, manteniendo trazabilidad con la Specification.

## Principios

1. No diseñar tablas antes de validar conceptos y relaciones.
2. No usar datos personales reales.
3. Cada atributo debe justificar su origen y uso.
4. Toda decisión histórica debe poder reconstruirse.
5. Reintentos y operaciones idempotentes deben modelarse explícitamente.
6. El modelo debe diferenciar dato actual, dato utilizado en una decisión y evidencia de origen.
7. El diseño físico no debe introducir una tecnología antes de evaluar patrones de acceso y restricciones.

---

# 1. Modelo conceptual

## Propósito

Representar los conceptos del negocio y sus relaciones sin atributos técnicos ni decisiones físicas.

## Entidades candidatas basadas en entrevistas

- Cliente.
- Oferta.
- Simulación.
- Solicitud.
- Canal.
- Autorización.
- Documento.
- Fuente de datos.
- Evaluación.
- Política o conjunto de reglas.
- Versión de reglas.
- Score.
- Decisión.
- Motivo de decisión.
- Revisión manual.
- Excepción.
- Contrato.
- Aceptación.
- Desembolso.
- Notificación.
- Incidencia.
- Evento del journey.

La lista es candidata y deberá validarse. No implica todavía una tabla por concepto.

## Relaciones a validar

- un cliente puede tener varias ofertas;
- una oferta puede originar una simulación o solicitud;
- una solicitud pertenece a un cliente y conserva un identificador único;
- una solicitud puede atravesar varios canales;
- una solicitud puede tener autorizaciones y documentos;
- una solicitud puede tener una o más evaluaciones o reintentos controlados;
- una evaluación utiliza datos de fuentes y una versión de reglas;
- una evaluación produce una decisión;
- una decisión puede requerir revisión manual o excepción;
- una solicitud aprobada puede generar contrato, aceptación y desembolso;
- una solicitud genera notificaciones, incidencias y eventos.

## Entregables

- diagrama conceptual;
- glosario;
- catálogo de entidades;
- relaciones y cardinalidades preliminares;
- matriz entidad ↔ historia ↔ requisito;
- preguntas abiertas.

---

# 2. Modelo lógico

## Propósito

Definir atributos, claves, dominios y restricciones sin depender de un motor específico.

## Áreas de diseño

### Identidad y clientes

- identificador interno del cliente;
- referencias a fuentes maestras;
- datos confirmados y vigencia;
- cambios autorizados;
- minimización de información duplicada.

### Solicitud y continuidad

- identificador único;
- canal de origen y canales utilizados;
- estado actual e historial;
- correlación;
- claves de idempotencia;
- distinción entre nueva solicitud y reintento.

### Documentos y extracción

- tipo documental;
- referencia al archivo;
- fecha y origen;
- campos extraídos;
- confianza;
- revisión humana;
- resultado de validación.

### Evaluación y decisión

- snapshot de datos utilizados;
- fuentes;
- fecha y hora;
- versión de reglas;
- score;
- resultado;
- motivos;
- evidencia explicable.

### Excepciones

- recomendación;
- justificación;
- evidencias;
- nivel requerido;
- aprobador;
- decisión de excepción;
- segregación de funciones.

### Contrato y desembolso

- condiciones aprobadas;
- vigencia;
- aceptación;
- evidencia contractual;
- operación de desembolso;
- clave de idempotencia;
- estado y confirmación del core.

### Comunicación y analítica

- preferencia de canal;
- evento de notificación;
- intento y resultado;
- incidencia;
- evento del journey;
- separación de navegación y datos financieros.

## Entregables

- modelo lógico normalizado;
- diccionario de datos;
- claves candidatas;
- dominios y obligatoriedad;
- reglas de integridad;
- historial y temporalidad;
- matriz de datos sensibles.

---

# 3. Modelo físico

## Propósito

Implementar el modelo lógico en el motor seleccionado y optimizarlo para los patrones de acceso validados.

## Decisiones que deben documentarse

- motor relacional y uso eventual de almacenamiento documental;
- esquema y convenciones de nombres;
- tipos de datos;
- claves primarias y foráneas;
- restricciones únicas;
- índices;
- tablas de historial;
- particionamiento;
- retención y archivado;
- cifrado y enmascaramiento;
- auditoría;
- migraciones;
- estrategia de documentos.

## Consultas prioritarias que deberá soportar

- recuperar solicitud por cliente e identificador;
- consultar estado y acciones pendientes;
- listar casos de revisión manual;
- recuperar expediente consolidado;
- reconstruir una decisión;
- validar idempotencia;
- consultar vigencia de oferta o aprobación;
- analizar eventos por etapa;
- identificar integraciones fallidas y reintentos.

## Entregables

- diagrama físico;
- DDL;
- migraciones versionadas;
- índices y restricciones;
- ADR de persistencia;
- pruebas de integridad y rendimiento inicial.

---

# 4. Estrategia de datos sintéticos

## Objetivo

Generar datos seguros y reproducibles para desarrollo, demos, pruebas funcionales, casos borde y rendimiento.

## Prohibiciones

- no copiar datos reales de clientes;
- no usar documentos reales;
- no usar números de identidad, teléfonos, correos o cuentas reales;
- no recrear información que permita identificar a una persona;
- no generar reglas crediticias presentándolas como políticas reales.

## Tipos de dataset

### Dataset mínimo funcional

Debe permitir recorrer:

- oferta o simulación;
- solicitud;
- confirmación de datos;
- documento opcional;
- evaluación;
- decisión;
- estado;
- contrato y desembolso simulado.

### Dataset de resultados

- aprobados;
- rechazados;
- observados;
- revisión manual;
- excepciones recomendadas;
- excepciones aprobadas y rechazadas.

Las proporciones se definirán para cubrir pruebas, no para representar la cartera real.

### Dataset de calidad documental

- documento legible;
- documento ilegible;
- campo ausente;
- baja confianza;
- inconsistencia entre documento y dato declarado;
- documento duplicado.

### Dataset de resiliencia

- consulta externa con timeout;
- respuesta tardía;
- reintento;
- evento duplicado;
- desembolso con estado incierto;
- fallo recuperable;
- fallo definitivo.

### Dataset de seguridad y roles

- asesor autorizado;
- analista;
- supervisor;
- contact center;
- usuario sin permisos;
- intento de autoaprobación de excepción.

### Dataset de carga

- volumen diario de referencia;
- pico de campaña de hasta cinco veces;
- concurrencia y distribución pendientes de definición;
- eventos de navegación y consulta móvil.

## Reglas de generación

- usar semillas reproducibles;
- separar identificadores sintéticos por ambiente;
- generar fechas coherentes con estados;
- respetar cardinalidades y restricciones;
- conservar correlación entre solicitud, evaluación y decisión;
- generar snapshots históricos consistentes;
- marcar todo dato como sintético;
- incluir casos válidos e inválidos intencionales.

## Validaciones automáticas

- integridad referencial;
- unicidad de claves;
- coherencia de estados;
- vigencia temporal;
- ausencia de PII real conocida;
- cobertura de criterios de aceptación;
- cobertura de casos borde;
- reproducibilidad con la misma semilla.

## Estructura futura de carpeta

```text
synthetic_data/
├── 00_strategy.md
├── 01_data_catalog.md
├── generators/
├── seeds/
├── fixtures/
│   ├── minimal/
│   ├── edge_cases/
│   └── performance/
├── documents/
└── validation/
```

## Trazabilidad requerida

Cada escenario sintético deberá indicar:

- historia relacionada;
- requisito relacionado;
- criterio de aceptación;
- entidades involucradas;
- resultado esperado;
- si representa camino feliz, excepción, error o carga.

## Preguntas pendientes

- motor y formato de salida;
- volumen exacto por dataset;
- reglas de distribución;
- tipos documentales del MVP;
- límites y formatos de campos;
- escenarios regulatorios;
- SLA y concurrencia;
- ambientes donde se cargarán los datos.
