# Contexto — Siniestro Fácil

## Situación actual

Seguros Horizonte comercializa seguros vehiculares, de salud y de hogar; este caso se concentra únicamente en seguros vehiculares. Actualmente un accidente puede reportarse por teléfono, correo, aplicación móvil o corredor. La información se transcribe varias veces, las fotografías quedan distribuidas en distintas ubicaciones y el cliente carece de una visión clara del avance.

**Fuente:** Contexto ficticio del caso.

## Problemas de negocio y operación confirmados

- Proceso poco transparente y excesivamente manual. Fuente: CEO-02.
- Casos simples consumen tiempo que debería dedicarse a casos complejos. Fuente: CEO-02.
- Existe necesidad simultánea de velocidad y control de fraude/pagos incorrectos. Fuente: CEO-02.
- Se crean casos duplicados cuando reportan distintos participantes. Fuente: OPERACIONES-06.
- Las fotografías llegan por canales diversos y es difícil determinar la versión válida. Fuente: OPERACIONES-06.
- Existen autorizaciones telefónicas que no quedan adecuadamente registradas. Fuente: OPERACIONES-06.
- Los datos presentan variantes de nombres, errores de placa, ubicaciones aproximadas, documentos incompletos y duplicados. Fuente: FRAUDE-09.
- Proveedores externos pueden responder lentamente o estar temporalmente indisponibles. Fuentes: CEO-09, OPERACIONES-09.

## Tensiones explícitas del caso

- Rapidez de atención frente a control de fraude.
- Experiencia simple frente a evidencia suficiente.
- Automatización frente a revisión humana.
- Expediente único frente a múltiples participantes y reclamos relacionados.
- Almacenamiento de originales frente a versiones optimizadas.
- Procesos síncronos de atención frente a coordinaciones asíncronas con terceros.

**Fuente:** sección “Reto para el equipo”.

## Dependencias mencionadas

- Sistema de pólizas.
- Red de talleres.
- Proveedores de grúa.
- Ajustadores.
- Mapas.
- Mensajería.
- Medios de pago.

La entrevista indica que no todos cuentan con APIs modernas y que la solución debe tolerar integraciones lentas y proveedores temporalmente indisponibles.

**Fuente:** CEO-09.

## Datos cuantitativos presentes en la entrevista

La entrevista menciona aproximadamente **420,000 pólizas activas** y cerca de **18,000 reportes de siniestro al mes** como contexto de la compañía. Estos datos no se convierten en requisitos de capacidad porque la entrevista no define concurrencia, throughput ni metas de crecimiento.

**Fuente:** Contexto ficticio del caso.

## Información aún no definida

No se especifican SLA numéricos, umbrales antifraude, política exacta de deduplicación, plazo de conservación de evidencias, detalle de integración con talleres ni parámetros de desempeño técnico.

**Fuente:** sección “Incertidumbres”.
