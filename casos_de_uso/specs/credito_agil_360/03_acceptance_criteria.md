# Criterios de aceptación — Crédito Ágil 360

Los criterios se formulan con la evidencia disponible. Cuando una regla o umbral no está definido, el criterio registra explícitamente la validación pendiente.

## Continuidad e identidad de solicitud

### CA-001 — Crear solicitud única

- **Dado** un cliente que inicia desde una oferta o simulación;
- **cuando** confirma el inicio del proceso;
- **entonces** el sistema crea una solicitud con un identificador único y conserva el canal de origen.

### CA-002 — Continuar desde otro canal

- **Dado** un cliente autenticado con una solicitud no finalizada;
- **cuando** accede desde otro canal habilitado;
- **entonces** recupera la misma solicitud, su información registrada, estado y acciones pendientes.

### CA-003 — Evitar duplicado por reintento

- **Dado** que una acción fue enviada y la respuesta de una integración no llegó al canal;
- **cuando** el cliente repite la acción;
- **entonces** el sistema identifica el reintento y no crea una nueva solicitud ni duplica el procesamiento confirmado.

## Datos y documentos

### CA-004 — Reutilizar datos vigentes

- **Dado** que el banco dispone de datos vigentes del cliente;
- **cuando** el cliente llega a la etapa de información;
- **entonces** el sistema presenta esos datos para confirmación y no exige ingresarlos nuevamente.

### CA-005 — Actualizar solo información permitida

- **Dado** un dato disponible para confirmación;
- **cuando** el cliente solicita actualizarlo;
- **entonces** el sistema permite el cambio solo si la política aplicable lo autoriza y conserva evidencia del cambio.

La lista de datos editables y sus validaciones está pendiente.

### CA-006 — Cargar documento requerido

- **Dado** que la solicitud requiere un documento;
- **cuando** el cliente carga un archivo permitido;
- **entonces** el documento queda vinculado con la solicitud y el sistema informa el resultado de recepción o validación.

Los formatos, tamaños y controles de archivo están pendientes.

### CA-007 — Extracción documental sin invención

- **Dado** un documento recibido por una capacidad de IA;
- **cuando** un campo no puede encontrarse;
- **entonces** la salida conserva el campo como ausente y no genera un valor sustituto.

### CA-008 — Evidencia de extracción

- **Dado** un campo extraído por IA;
- **cuando** un usuario autorizado revisa el resultado;
- **entonces** puede identificar el documento de origen y el nivel de confianza asociado.

### CA-009 — Revisión por baja confianza

- **Dado** un campo con confianza inferior al umbral aprobado;
- **cuando** finaliza la extracción;
- **entonces** el caso se deriva a revisión humana antes de utilizar ese campo en una decisión.

El umbral está pendiente de validación.

## Evaluación y reglas

### CA-010 — Registrar versión de reglas

- **Dado** una solicitud lista para evaluación;
- **cuando** se ejecutan las políticas de elegibilidad;
- **entonces** la evaluación registra la versión de reglas utilizada, fecha y hora.

### CA-011 — Producir resultado válido

- **Dado** una evaluación completada;
- **cuando** se emite el resultado;
- **entonces** el estado corresponde al menos a aprobado, rechazado, observado o revisión manual.

### CA-012 — Conservar condiciones de aprobación

- **Dado** un resultado aprobado;
- **cuando** se registra la decisión;
- **entonces** se conservan las condiciones aplicables disponibles: monto máximo, plazo, tasa, condiciones y vigencia.

### CA-013 — Derivar a revisión manual

- **Dado** un caso que cumple una condición de revisión manual definida por Riesgos;
- **cuando** finaliza la evaluación automática;
- **entonces** el sistema crea una tarea de revisión con el motivo y el expediente disponible.

### CA-014 — Recomendar excepción

- **Dado** un analista autorizado y un caso elegible para excepción;
- **cuando** registra una recomendación;
- **entonces** debe incluir justificación y evidencias antes de enviarla al nivel aprobador.

### CA-015 — Segregación de excepción

- **Dado** una excepción que requiere aprobación superior;
- **cuando** el mismo analista que la recomendó intenta aprobarla;
- **entonces** el sistema impide la aprobación cuando la política de segregación lo prohíba.

La matriz exacta de niveles está pendiente.

### CA-016 — No modificar decisión histórica

- **Dado** una decisión ya emitida;
- **cuando** cambian datos del cliente o una nueva versión de reglas entra en vigencia;
- **entonces** la decisión histórica conserva los datos y reglas usados originalmente.

### CA-017 — Reconstruir decisión

- **Dado** una decisión existente y un usuario autorizado;
- **cuando** consulta la auditoría;
- **entonces** visualiza datos usados, fuentes, fecha, hora, versión de reglas, score, excepciones y usuarios que intervinieron.

## Estado y comunicación

### CA-018 — Mostrar estado comprensible

- **Dado** una solicitud en curso;
- **cuando** el cliente consulta el trámite;
- **entonces** visualiza un estado simple, la acción pendiente y el siguiente paso sin exponer información interna innecesaria.

### CA-019 — Mostrar documento pendiente

- **Dado** una solicitud que requiere documento;
- **cuando** el cliente consulta el estado;
- **entonces** el sistema identifica el documento requerido y la acción para entregarlo.

### CA-020 — Notificar cambio relevante

- **Dado** un cliente con un canal permitido seleccionado;
- **cuando** ocurre uno de los eventos de notificación definidos;
- **entonces** el sistema envía un mensaje sin datos sensibles y registra el intento y resultado.

### CA-021 — Contact center sin capacidad de decisión

- **Dado** un agente de contact center autorizado;
- **cuando** consulta una solicitud;
- **entonces** puede ver el estado permitido y registrar una incidencia, pero no modificar la decisión de Riesgos.

## Aceptación y desembolso

### CA-022 — Revisar condiciones

- **Dado** un crédito aprobado y vigente;
- **cuando** el cliente abre la propuesta;
- **entonces** puede revisar las condiciones aplicables antes de aceptar.

### CA-023 — Registrar aceptación

- **Dado** un contrato disponible;
- **cuando** el cliente completa el mecanismo de aceptación aprobado;
- **entonces** el sistema registra la aceptación con fecha, hora y evidencia requerida.

El mecanismo legal y la evidencia exacta están pendientes.

### CA-024 — Desembolso idempotente

- **Dado** una solicitud aceptada y elegible para desembolso;
- **cuando** el sistema recibe múltiples solicitudes de ejecución con la misma clave de operación;
- **entonces** se confirma como máximo un desembolso y los reintentos reciben el mismo resultado registrado.

### CA-025 — Recuperar falla de integración

- **Dado** una integración temporalmente no disponible;
- **cuando** el procesamiento no puede completarse;
- **entonces** el sistema conserva la información registrada, informa un estado no ambiguo y permite reprocesar únicamente la operación fallida.

## Analítica y accesibilidad

### CA-026 — Registrar evento de recorrido

- **Dado** un ingreso, abandono, error, rechazo documental, reintento o cambio de etapa;
- **cuando** ocurre el evento;
- **entonces** se registra con solicitud o sesión correlacionable, etapa y tiempo, minimizando datos financieros sensibles.

### CA-027 — Lectores de pantalla

- **Dado** un usuario que utiliza un lector de pantalla;
- **cuando** navega por los formularios principales;
- **entonces** puede identificar campos, errores, botones y estado del trámite.

El estándar y alcance de pruebas de accesibilidad deben definirse.
