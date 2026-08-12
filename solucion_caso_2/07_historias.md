# Historias de usuario — Siniestro Fácil

> Las historias se limitan a comportamientos expresados en la entrevista. Los criterios detallados se documentan en `11_criterios.md`.

## HU-01 — Reportar un accidente

**Como** asegurado o reportante autorizado, **quiero** reportar un accidente desde el teléfono, **para** iniciar la atención del siniestro sin depender de llamadas o formularios repetidos.

**Fuentes:** CEO-01, CEO-03, CEO-06.

## HU-02 — Crear el caso con información mínima

**Como** reportante, **quiero** poder iniciar el caso con los datos mínimos definidos, **para** no quedar bloqueado cuando todavía no pueda recopilar toda la evidencia.

**Fuente:** OPERACIONES-02.

## HU-03 — Recibir guía paso a paso

**Como** asegurado, **quiero** recibir instrucciones en lenguaje humano sobre qué hacer, qué evidencia recopilar y qué sigue, **para** entender el proceso durante una situación de estrés.

**Fuente:** CEO-06.

## HU-04 — Solicitar y seguir asistencia

**Como** asegurado, **quiero** recibir asistencia cuando corresponda y conocer cuándo llegará, **para** poder continuar con seguridad después del accidente.

**Fuentes:** CEO-03, CEO-06; OPERACIONES-01.

## HU-05 — Adjuntar evidencias al expediente

**Como** reportante, **quiero** adjuntar fotografías, documentos y declaraciones relacionados con el siniestro, **para** aportar información necesaria para su evaluación.

**Fuentes:** CEO-03; OPERACIONES-03.

## HU-06 — Consultar el avance

**Como** asegurado, **quiero** conocer el avance y el siguiente paso de mi siniestro, **para** no depender de llamadas adicionales para entender su situación.

**Fuentes:** CEO-01, CEO-03.

## HU-07 — Gestionar una vista única del caso

**Como** operador, **quiero** consultar un expediente único con información, evidencias, cambios y comunicaciones, **para** gestionar el caso con trazabilidad.

**Fuentes:** CEO-03; OPERACIONES-10.

## HU-08 — Asignar y reasignar siniestros

**Como** operador, **quiero** asignar y reasignar casos considerando los factores mencionados y conservando historial y razón, **para** dirigir cada caso al tratamiento correspondiente sin perder trazabilidad.

**Fuente:** OPERACIONES-05.

## HU-09 — Gestionar presupuesto y cambios del taller

**Como** taller, **quiero** presentar presupuesto y diagnóstico y solicitar aprobación de observaciones, alternativas o ampliaciones, **para** gestionar la reparación dentro del expediente.

**Fuente:** OPERACIONES-07.

## HU-10 — Registrar autorizaciones

**Como** operador, **quiero** registrar quién autorizó una reparación o cambio relacionado, **para** evitar autorizaciones sin evidencia auditable.

**Fuentes:** OPERACIONES-06, OPERACIONES-07, OPERACIONES-10.

## HU-11 — Gestionar fallas de proveedores

**Como** operador, **quiero** reintentar, escalar o reasignar una solicitud a un proveedor y registrar cada intento y resultado, **para** evitar que el cliente quede bloqueado por una falta de respuesta.

**Fuente:** OPERACIONES-09.

## HU-12 — Revisar alertas antifraude

**Como** investigador de fraude, **quiero** revisar alertas con su explicación, datos de origen y regla/modelo utilizado, **para** confirmarlas, descartarlas o solicitar más información con una justificación registrada.

**Fuente:** FRAUDE-04.

## HU-13 — Consultar información ampliada bajo restricción

**Como** investigador de fraude, **quiero** acceder a información ampliada según mi rol y necesidad, **para** investigar señales sin exponer innecesariamente información sensible a otros actores.

**Fuente:** FRAUDE-07.

## HU-14 — Relacionar expedientes sin fusionarlos

**Como** investigador de fraude, **quiero** relacionar participantes, vehículos, talleres, teléfonos, cuentas u otros elementos que aparezcan en distintos reclamos, **para** analizar conexiones sin fusionar incorrectamente expedientes.

**Fuente:** FRAUDE-08.

## HU-15 — Conservar evidencia reproducible

**Como** investigador de fraude, **quiero** disponer del original, hash, metadatos, fuente y transformaciones de la evidencia, **para** reproducir posteriormente el análisis del caso.

**Fuentes:** FRAUDE-03, FRAUDE-10.

## HU-16 — Auditar el expediente

**Como** actor autorizado de auditoría/operación, **quiero** consultar la línea de tiempo completa del caso, **para** conocer quién hizo qué, qué cambió y qué decisiones, comunicaciones y pagos quedaron registrados.

**Fuente:** OPERACIONES-10.

## Historias pendientes de definición

No se crean historias para autenticación, recuperación de cuenta, notificaciones específicas, pagos detallados, navegación, administración de usuarios, configuración técnica o flujo completo de rutas especializadas porque la entrevista no define esos comportamientos.
