# Historias de usuario y criterios de aceptación

Todos los criterios usan Given/When/Then. Los valores no confirmados se remiten a `06-preguntas-abiertas.md`.

## Épica E1 — Originación omnicanal

### HU-01 — Iniciar o recuperar una solicitud única (MVP)

Como cliente existente, quiero iniciar o recuperar mi solicitud tras autenticarme para continuar en cualquier canal sin repetir información.

- Dado que no existe un proceso activo equivalente, cuando inicio una solicitud, entonces se crea un identificador único y se registra el canal de origen.
- Dado que existe un proceso activo equivalente, cuando ingreso desde otro canal, entonces se recupera la misma solicitud y no se crea otra.
- Dado un reintento de la misma operación, cuando el canal repite la petición, entonces el resultado es idempotente.
- Regla de equivalencia/deduplicación: POR RESPONDER.

### HU-02 — Simular o seleccionar oferta (MVP)

Como cliente, quiero seleccionar una oferta o simular monto y plazo para decidir si continúo.

- Dado un producto habilitado, cuando ingreso monto y plazo permitidos, entonces veo condiciones disponibles sin presentar una aprobación inexistente.
- Dado un dato fuera de límites, cuando lo ingreso, entonces recibo una validación inmediata y clara.
- Límites, cálculo y vigencia: POR RESPONDER.

### HU-03 — Confirmar o actualizar datos (MVP)

Como cliente, quiero ver información disponible y vigente para confirmar o corregir sin volver a escribirla.

- Se muestran contacto verificado, dirección, información laboral reciente y cuenta de abono cuando estén disponibles y vigentes.
- Cada dato indica su procedencia o uso en lenguaje comprensible.
- Una actualización conserva el valor usado históricamente en decisiones previas.
- Vigencia y datos actualizables: POR RESPONDER.

### HU-04 — Autorizar consultas (MVP)

Como cliente, quiero revisar y otorgar las autorizaciones requeridas antes de la evaluación.

- Sin autorización requerida vigente no se solicita evaluación.
- La evidencia registra identidad, texto/versión, fecha-hora, canal y resultado.
- Textos y revocación: POR VALIDAR con Cumplimiento/Legal.

## Épica E2 — Evaluación y documentos

### HU-05 — Adjuntar documento solicitado (MVP condicional)

Como cliente, quiero saber exactamente qué documento falta y cómo corregirlo.

- La interfaz muestra documento, motivo orientativo, acción siguiente y estado.
- Una falla no elimina datos ya capturados y permite reintentar solo la acción necesaria.
- El archivo se analiza sin inventar campos; cada extracción conserva origen y confianza.
- Formatos, tamaño, vigencia, malware y conservación: POR RESPONDER.

### HU-06 — Ejecutar evaluación auditable (MVP)

Como Riesgos, quiero evaluar con datos y reglas versionadas para reconstruir cada decisión.

- La evaluación produce aprobado, rechazado, observado o revisión manual.
- Registra snapshot de datos, fuente, fecha-hora, versión de reglas, score, resultado y razones internas.
- Un aprobado puede incluir monto máximo, plazo, tasa, condiciones y vigencia.
- Una consulta fallida puede reprocesarse sin duplicar evaluación.

### HU-07 — Revisar caso manual (MVP)

Como analista, quiero recibir un caso resumido con evidencias para decidir sin buscar datos dispersos.

- La bandeja distingue inconsistencias, alertas, cercanía a límite, documento ilegible, información incompleta y excepciones de campaña.
- El analista visualiza solo información necesaria según rol.
- Un resumen generado por IA enlaza evidencias y no se considera fuente de decisión.

### HU-08 — Gestionar excepción (MVP)

Como analista, quiero recomendar una excepción y enviarla al supervisor correspondiente.

- Toda recomendación registra justificación, documentos, usuario y fecha-hora.
- Cuando el nivel exige supervisor, el analista no puede autoaprobar.
- No se acepta aprobación por correo como autorización del sistema.
- Niveles y matrices: POR RESPONDER.

## Épica E3 — Estado, aceptación y desembolso

### HU-09 — Consultar estado y acción siguiente (MVP)

Como cliente, quiero una línea de tiempo y mensajes claros para saber qué ocurre.

- Se representan: borrador, información pendiente, en evaluación, requiere documento, requiere validación, aprobado, no aprobado, pendiente de aceptación, listo para desembolso, desembolsado y cancelado.
- Cada estado accionable indica qué falta y qué debe hacer el cliente.
- Los estados internos se traducen sin exponer razones restringidas.

### HU-10 — Recibir notificaciones seguras (MVP)

Como cliente, quiero elegir canales permitidos y recibir cambios relevantes sin exposición de datos sensibles.

- Se contemplan inicio, pendiente, cambio relevante, aprobación/vigencia, contrato y desembolso.
- App, correo y SMS dependen de consentimiento/preferencia válida.
- El mensaje externo no contiene datos financieros sensibles.

### HU-11 — Revisar y aceptar contrato (MVP)

Como cliente aprobado, quiero revisar condiciones y aceptar el contrato antes del desembolso.

- Solo una decisión aprobada y vigente habilita la aceptación.
- Se registra la versión íntegra aceptada, identidad, fecha-hora y canal.
- Firma, autenticación reforzada y tratamiento de expiración: POR RESPONDER.

### HU-12 — Desembolsar una sola vez (MVP)

Como Operaciones, quiero desembolsar el crédito aceptado de forma idempotente.

- Solo una solicitud lista para desembolso puede solicitar la operación.
- Reintentos con la misma clave no generan un segundo desembolso.
- El resultado queda correlacionado con solicitud, contrato y operación del core.
- Reversos y conciliación: POR RESPONDER.

## Épica E4 — Observabilidad y mejora

### HU-13 — Medir el recorrido (MVP)

Como Canales, quiero eventos de ingreso, abandono, error, rechazo de documento, reintento, latencia y conversión.

- Los eventos correlacionan etapa y solicitud con identificadores seudonimizados cuando corresponda.
- La analítica de navegación no incorpora información financiera más sensible de lo necesario.
- Catálogo, retención y acceso: POR RESPONDER.

