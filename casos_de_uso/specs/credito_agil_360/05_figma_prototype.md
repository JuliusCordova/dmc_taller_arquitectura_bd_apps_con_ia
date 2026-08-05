# Prototipo preliminar Figma — Crédito Ágil 360

## Archivo editable

[Crédito Ágil 360 — Prototipo preliminar SDD](https://www.figma.com/design/X0i1TFLqE3KkkxQqtN8mMg)

## Propósito

El prototipo transforma las capacidades evidenciadas en las entrevistas en una primera representación visual para validar experiencia, roles y trazabilidad antes del diseño detallado.

No representa una interfaz aprobada ni define arquitectura, tecnología, reglas crediticias, cifras comerciales o textos legales.

## Vistas incluidas

### 1. Oferta y simulación — cliente móvil

Relacionada con:

- HU-001;
- RF-001;
- inicio desde oferta o simulación;
- confirmación de que las condiciones finales dependen de evaluación;
- continuidad posterior entre canales.

Elementos pendientes:

- límites de monto y plazo;
- condiciones por campaña;
- contenido regulatorio y comercial.

### 2. Confirmación de datos y autorización — cliente móvil

Relacionada con:

- HU-004, HU-005 y HU-006;
- RF-005, RF-006 y RF-007;
- reutilización de datos vigentes;
- confirmación o actualización permitida;
- autorización de consultas.

Elementos pendientes:

- datos editables;
- reglas de vigencia;
- texto y evidencia de consentimiento;
- validaciones adicionales.

### 3. Estado y acciones — cliente móvil

Relacionada con:

- HU-002, HU-014 y HU-015;
- RF-002, RF-003, RF-023, RF-024 y RF-025;
- solicitud única;
- línea de tiempo;
- estado simple;
- siguiente paso.

Elementos pendientes:

- catálogo definitivo de estados internos y externos;
- transición de estados;
- mensajes para observación, rechazo y errores;
- SLA visible al cliente.

### 4. Consola de análisis y trazabilidad — analista y supervisor

Relacionada con:

- HU-010 a HU-013;
- RF-016 a RF-022;
- bandeja de revisión manual;
- expediente consolidado;
- recomendación y aprobación de excepciones;
- reconstrucción de decisiones.

Elementos pendientes:

- priorización y SLA de bandeja;
- matriz de permisos;
- catálogo de motivos;
- estructura de score y reglas;
- fuentes exactas;
- acciones permitidas por rol.

### 5. Panel de preguntas abiertas

La página incluye un panel explícito con preguntas críticas para evitar que el prototipo convierta vacíos en decisiones aparentes.

## Trazabilidad visual

| Vista | Historias | Requisitos principales |
|---|---|---|
| Oferta y simulación | HU-001, HU-002 | RF-001 a RF-003 |
| Confirmación de datos | HU-004 a HU-006 | RF-005 a RF-007 |
| Estado y acciones | HU-014, HU-015 | RF-023 a RF-026 |
| Consola operativa | HU-010 a HU-013 | RF-016 a RF-022 |

## Validación requerida

- Producto y CEO: alcance y promesa del MVP.
- Canales: journey, mensajes y continuidad.
- Riesgos: expediente, decisión, excepción y auditoría.
- Cumplimiento y Seguridad: datos visibles, autorización y roles.
- Operaciones: aceptación, desembolso y recuperación ante fallas.
- UX: accesibilidad, lenguaje claro y pruebas con usuarios.

## Próximo paso SDD

Después de validar esta Specification y el prototipo:

1. actualizar preguntas y decisiones;
2. versionar la Specification como `0.2`;
3. derivar modelo conceptual de datos;
4. definir contratos de API y eventos;
5. diseñar arquitectura y controles;
6. crear pruebas desde los criterios de aceptación;
7. construir incrementos trazables a historias y requisitos.
