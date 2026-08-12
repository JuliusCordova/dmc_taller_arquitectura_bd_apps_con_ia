# Requisitos no funcionales — Siniestro Fácil

> La entrevista expresa cualidades y restricciones, pero no define metas numéricas para desempeño, disponibilidad, capacidad o retención. Por ello, los RNF se redactan solo cuando existe un comportamiento verificable sin inventar umbrales; los parámetros faltantes se convierten en preguntas.

## Seguridad y privacidad

### RNF-01 — Protección de datos personales
La solución debe evitar la exposición de datos personales a actores no autorizados.

**Fuente:** CEO-07.

### RNF-02 — Acceso restringido por rol y necesidad
La información ampliada utilizada por Prevención de Fraude debe estar restringida según rol y necesidad.

**Fuente:** FRAUDE-07.

### RNF-03 — Auditoría de accesos sensibles
Las descargas de evidencia y consultas sensibles deben quedar registradas.

**Fuente:** FRAUDE-07.

## Integridad y trazabilidad

### RNF-04 — Preservación de originales
Las transformaciones o compresiones de evidencia no deben eliminar ni sustituir el contenido original.

**Fuente:** FRAUDE-03.

### RNF-05 — Integridad verificable de evidencia
Cada evidencia debe conservar un hash y los metadatos disponibles necesarios para su trazabilidad.

**Fuente:** FRAUDE-03.

### RNF-06 — Historial de cambios
Las modificaciones relevantes del expediente deben poder rastrearse hasta el actor que las realizó y su momento dentro de la línea de tiempo del caso.

**Fuente:** OPERACIONES-10.

### RNF-07 — Reproducibilidad antifraude
Debe ser posible reconstruir posteriormente por qué una alerta fue generada utilizando la versión de regla/modelo, sus datos de entrada y la revisión humana conservada.

**Fuente:** FRAUDE-10.

## Resiliencia e integración

### RNF-08 — Tolerancia a indisponibilidad de proveedores
La operación no debe depender de que un proveedor externo específico responda exitosamente; ante falta de respuesta debe poder continuarse mediante reintento, escalamiento o reasignación.

**Fuentes:** CEO-09, OPERACIONES-09.

### RNF-09 — Registro de interacción con terceros
Cada intento de integración o coordinación relevante con un proveedor debe dejar registro del resultado, distinguiendo aceptación, rechazo o ausencia de respuesta.

**Fuente:** OPERACIONES-09.

## Usabilidad y comunicación

### RNF-10 — Lenguaje comprensible para el asegurado
La experiencia dirigida al asegurado debe usar lenguaje humano y guía paso a paso, evitando depender de términos internos no explicados.

**Fuente:** CEO-06.

## Gobernanza de automatización e IA

### RNF-11 — Explicabilidad de alertas
Toda alerta debe conservar una explicación y la identificación de la regla o modelo que la originó.

**Fuente:** FRAUDE-04.

### RNF-12 — Revisabilidad de decisiones sensibles
Las decisiones sensibles y recomendaciones de IA deben permanecer revisables; una alerta no debe considerarse por sí sola fraude confirmado.

**Fuentes:** CEO-07, CEO-08; FRAUDE-01, FRAUDE-04.

### RNF-13 — Versionado de políticas antifraude
La política que determina el tratamiento de alertas debe ser configurable y versionada.

**Fuente:** FRAUDE-05.

## Calidad de datos

### RNF-14 — No sobrescritura silenciosa del valor declarado
Cuando un dato sea normalizado, la solución debe conservar separadamente el valor declarado y el valor normalizado.

**Fuente:** FRAUDE-09.

## RNF aún no cuantificables

La entrevista menciona tiempos operativos a controlar —primera respuesta, llegada de grúa, revisión de cobertura, asignación, inspección, recepción de presupuesto, autorización y cierre— pero indica que el compromiso varía según tipo de siniestro y ubicación y no proporciona valores. Por ello no se inventan SLA.

**Fuente:** OPERACIONES-08.

Tampoco se especifican: tiempo de respuesta de la aplicación, disponibilidad, RTO/RPO, concurrencia, throughput, crecimiento esperado, tamaño máximo de archivos, retención de evidencias, accesibilidad normativa, compatibilidad de dispositivos, cifrado concreto ni objetivos de observabilidad. Estos elementos deben resolverse en entrevistas posteriores antes de fijarlos como RNF medibles.
