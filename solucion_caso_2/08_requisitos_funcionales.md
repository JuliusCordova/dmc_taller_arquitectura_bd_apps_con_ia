# Requisitos funcionales — Siniestro Fácil

Cada requisito se formula como comportamiento observable y se limita a lo indicado por la entrevista.

## Registro y expediente

### RF-01 — Inicio del reporte
El sistema debe permitir iniciar el reporte de un siniestro vehicular desde el teléfono del asegurado.

**Fuente:** CEO-03.

### RF-02 — Reportante autorizado
El sistema debe permitir que una persona autorizada reporte el siniestro cuando el titular no pueda hacerlo.

**Fuente:** CEO-06.

> El mecanismo de autorización no está definido y se mantiene como pregunta abierta.

### RF-03 — Identificación inicial
El sistema debe permitir registrar o confirmar la identidad del reportante, la póliza y el vehículo asociados al reporte.

**Fuente:** OPERACIONES-01.

### RF-04 — Información mínima de creación
El sistema debe permitir crear un caso cuando se disponga, como mínimo, de: número de póliza o documento del asegurado, placa del vehículo, fecha, ubicación aproximada, tipo de evento y medio de contacto.

**Fuente:** OPERACIONES-02.

### RF-05 — Datos del evento
El sistema debe permitir registrar fecha, hora, ubicación, personas involucradas, descripción y daños aparentes.

**Fuente:** OPERACIONES-01.

### RF-06 — Evidencia posterior al inicio
El sistema no debe exigir toda la evidencia como condición universal para crear el caso, de modo que el reporte pueda iniciarse cuando el cliente se encuentre en una situación de riesgo.

**Fuente:** OPERACIONES-02.

## Cobertura y asistencia

### RF-07 — Verificación de cobertura y deducible
El sistema debe soportar el registro del resultado de la verificación de cobertura y deducible del caso.

**Fuente:** OPERACIONES-01.

### RF-08 — Coordinación de asistencia
El sistema debe permitir coordinar asistencia cuando corresponda al caso.

**Fuente:** OPERACIONES-01.

### RF-09 — Resultado de solicitud a proveedor
El sistema debe registrar cada intento de coordinación con un proveedor y distinguir entre solicitud aceptada, rechazada o sin respuesta.

**Fuente:** OPERACIONES-09.

### RF-10 — Manejo de proveedor sin respuesta
El sistema debe permitir reintentar, escalar o reasignar la coordinación cuando un proveedor no responda.

**Fuente:** OPERACIONES-09.

## Evidencias

### RF-11 — Adjuntar evidencia
El sistema debe permitir asociar al siniestro fotografías del vehículo, daños y entorno, documentos de identidad, licencia, tarjeta de propiedad, declaración del conductor, datos de terceros y denuncia cuando corresponda.

**Fuente:** OPERACIONES-03.

### RF-12 — Trazabilidad de evidencia
El sistema debe vincular cada evidencia con el siniestro y el momento de captura y, cuando esos datos estén disponibles, con ubicación y dispositivo.

**Fuente:** OPERACIONES-03.

### RF-13 — Conservación del original
El sistema debe conservar el contenido original de cada evidencia y no reemplazarlo por una versión optimizada o transformada.

**Fuente:** FRAUDE-03.

### RF-14 — Metadatos de evidencia
El sistema debe conservar para cada evidencia su hash, metadatos disponibles, fecha de recepción, fuente, transformaciones realizadas y versiones derivadas.

**Fuente:** FRAUDE-03.

## Estado y asignación

### RF-15 — Estados operativos
El sistema debe poder representar los estados mencionados en la entrevista: Reportado, validando cobertura, asistencia coordinada, evidencia pendiente, en evaluación, inspección programada, presupuesto recibido, autorizado, observado, rechazado, en reparación, listo para entrega, indemnizado y cerrado.

**Fuente:** OPERACIONES-04.

### RF-16 — Separación de estado interno y visible
El sistema debe permitir que existan subestados internos no expuestos al cliente.

**Fuente:** OPERACIONES-04.

> Los subestados concretos y el mapeo de visibilidad no están definidos.

### RF-17 — Asignación del caso
El sistema debe soportar la asignación considerando ciudad, tipo de daño, severidad, cobertura, disponibilidad de proveedores y señales de riesgo.

**Fuente:** OPERACIONES-05.

### RF-18 — Reasignación auditable
El sistema debe conservar el historial y la razón de cada reasignación.

**Fuente:** OPERACIONES-05.

## Taller, evaluación y reparación

### RF-19 — Presentación de presupuesto
El sistema debe permitir registrar el presupuesto y diagnóstico presentado por un taller.

**Fuente:** OPERACIONES-07.

### RF-20 — Vigencia del presupuesto
El sistema debe permitir conocer la vigencia de cada presupuesto.

**Fuente:** OPERACIONES-07.

### RF-21 — Cambios durante reparación
El sistema debe permitir registrar observaciones, repuestos alternativos y ampliaciones solicitadas durante la reparación.

**Fuente:** OPERACIONES-07.

### RF-22 — Aprobación de cambios
El sistema debe registrar quién aprobó cada cambio relacionado con presupuesto o reparación.

**Fuente:** OPERACIONES-07.

## Comunicación y experiencia

### RF-23 — Guía al asegurado
El sistema debe presentar al asegurado instrucciones sobre qué hacer, cómo protegerse, qué evidencia recopilar y el siguiente paso del proceso.

**Fuente:** CEO-06.

### RF-24 — Información de asistencia
El sistema debe permitir informar al asegurado cuándo llegará la asistencia cuando dicha información esté disponible.

**Fuente:** CEO-06.

### RF-25 — Consulta de avance
El sistema debe permitir al asegurado conocer el avance de su caso.

**Fuentes:** CEO-01, CEO-03.

## Fraude y revisión

### RF-26 — Registro de alerta
El sistema debe registrar para cada alerta: tipo, severidad, explicación, datos que la originaron, fecha, modelo o regla utilizada y estado de revisión.

**Fuente:** FRAUDE-04.

### RF-27 — Revisión de alerta
El sistema debe permitir que un investigador confirme una alerta, la descarte o solicite más información y debe conservar su justificación.

**Fuente:** FRAUDE-04.

### RF-28 — Tratamiento configurable de alertas
El sistema debe soportar una política configurable y versionada mediante la cual determinadas reglas críticas puedan detener temporalmente un pago o derivar el caso y otras solo aumenten la prioridad de revisión.

**Fuente:** FRAUDE-05.

> Las reglas, combinaciones, severidades y umbrales concretos no están definidos.

### RF-29 — Revisión humana de decisiones sensibles
El sistema debe mantener la posibilidad de revisión humana sobre decisiones sensibles y sobre recomendaciones o alertas generadas por IA.

**Fuentes:** CEO-07, CEO-08; FRAUDE-01, FRAUDE-04.

### RF-30 — Relación entre casos
El sistema debe permitir relacionar múltiples pólizas, reclamos, participantes, teléfonos, cuentas bancarias, talleres o personas sin fusionar automáticamente los expedientes.

**Fuente:** FRAUDE-08.

### RF-31 — Valores declarados y normalizados
El sistema debe conservar por separado el valor declarado y el valor normalizado cuando se normalicen datos de calidad imperfecta.

**Fuente:** FRAUDE-09.

## Auditoría

### RF-32 — Línea de tiempo completa
El sistema debe mantener una línea de tiempo que registre quién incorporó información, qué cambió, qué evidencias se añadieron, qué cobertura se aplicó, qué proveedor actuó, qué presupuesto se aprobó, qué comunicación recibió el cliente y qué pago fue autorizado.

**Fuente:** OPERACIONES-10.

### RF-33 — Registro de acceso sensible
El sistema debe registrar las descargas de evidencia y consultas sensibles realizadas por usuarios autorizados.

**Fuente:** FRAUDE-07.

### RF-34 — Reproducibilidad de alertas
El sistema debe conservar suficiente información para identificar posteriormente la versión de regla o modelo, los datos de entrada y la evidencia de revisión humana que explican por qué un caso recibió una alerta.

**Fuente:** FRAUDE-10.

## Requisitos no definidos aquí

No se agregan requisitos sobre autenticación concreta, notificaciones push, biometría, almacenamiento específico, APIs, frameworks, base de datos, observabilidad técnica, CI/CD, tiempos de respuesta, disponibilidad porcentual ni infraestructura porque la entrevista no los define.
