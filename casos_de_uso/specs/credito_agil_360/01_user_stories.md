# Historias de usuario — Crédito Ágil 360

## Convenciones

- Estado inicial: `Draft`.
- Prioridad: solo se asigna cuando la evidencia permite distinguir MVP o futuro.
- Fuente: referencia a entrevista y número de respuesta.
- Ninguna historia implica una tecnología específica.

## Épica E1 — Inicio y continuidad omnicanal

### HU-001 — Iniciar desde una oferta o simulación

Como cliente existente con ingresos recurrentes, quiero seleccionar una oferta o simular un crédito, para iniciar una solicitud de crédito personal.

- Prioridad: MVP.
- Fuente: CEO-05; CANALES-01; CANALES-02.

### HU-002 — Recuperar la misma solicitud

Como cliente, quiero continuar mi solicitud desde otro canal después de autenticarme, para no volver a empezar ni perder la información registrada.

- Prioridad: MVP.
- Fuente: CEO-06; CANALES-01; CANALES-04.

### HU-003 — Ayudar al cliente desde un canal asistido

Como asesor autorizado, quiero consultar el mismo estado de la solicitud que ve el cliente, para ayudarlo sin crear otra solicitud ni acceder a información innecesaria.

- Prioridad: MVP.
- Fuente: CANALES-04; CANALES-09.

## Épica E2 — Datos, autorizaciones y documentos

### HU-004 — Confirmar datos disponibles

Como cliente, quiero revisar y confirmar los datos vigentes que el banco ya posee, para evitar completar nuevamente información disponible.

- Prioridad: MVP.
- Fuente: CEO-01; CEO-06; CANALES-03.

### HU-005 — Actualizar información permitida

Como cliente, quiero actualizar la información desactualizada cuando esté permitido, para que la evaluación no utilice datos incorrectos.

- Prioridad: MVP condicionado a reglas pendientes.
- Fuente: CANALES-03.

### HU-006 — Autorizar consultas

Como cliente, quiero conocer y otorgar las autorizaciones aplicables antes de las consultas, para controlar el uso de mi información.

- Prioridad: MVP.
- Fuente: CANALES-02.
- Validación pendiente: texto, alcance, vigencia y evidencia de consentimiento.

### HU-007 — Adjuntar documentos requeridos

Como cliente, quiero cargar únicamente los documentos que correspondan a mi caso, para completar la información necesaria sin pasos innecesarios.

- Prioridad: MVP.
- Fuente: CEO-06; CANALES-02; RIESGOS-02; RIESGOS-06.

### HU-008 — Extraer datos documentales con revisión

Como analista de Riesgos, quiero que la IA extraiga campos de documentos indicando origen y confianza, para reducir trabajo manual sin completar datos ausentes.

- Prioridad: MVP sujeto a umbral y gobierno de IA.
- Fuente: CEO-08; RIESGOS-09.

## Épica E3 — Evaluación y decisión

### HU-009 — Evaluar bajo reglas vigentes

Como responsable de Riesgos, quiero que cada solicitud sea evaluada con la versión vigente de las políticas aplicables, para asegurar decisiones controladas y auditables.

- Prioridad: MVP.
- Fuente: CEO-07; CEO-10; RIESGOS-01; RIESGOS-03; RIESGOS-05.

### HU-010 — Enviar casos a revisión manual

Como analista de Riesgos, quiero recibir los casos que requieren intervención con sus datos, documentos, alertas y motivo de derivación, para evaluarlos con contexto suficiente.

- Prioridad: MVP.
- Fuente: RIESGOS-04; RIESGOS-06.

### HU-011 — Recomendar una excepción

Como analista de Riesgos, quiero recomendar una excepción dejando justificación y evidencias, para que sea evaluada por el nivel de aprobación correspondiente.

- Prioridad: MVP.
- Fuente: RIESGOS-07.

### HU-012 — Aprobar o rechazar una excepción

Como supervisor autorizado, quiero aprobar o rechazar una excepción dentro del sistema, para mantener segregación de funciones y trazabilidad.

- Prioridad: MVP.
- Fuente: RIESGOS-07; RIESGOS-10.

### HU-013 — Reconstruir una decisión

Como auditor o responsable de Riesgos, quiero reconstruir una decisión histórica con datos, fuentes, hora, score, reglas, excepciones y usuarios, para explicar cómo se obtuvo.

- Prioridad: MVP.
- Fuente: CEO-07; RIESGOS-05; RIESGOS-10.

## Épica E4 — Estado, acciones y comunicación

### HU-014 — Consultar estado y siguiente acción

Como cliente, quiero visualizar el estado, los documentos faltantes y el siguiente paso en lenguaje claro, para no tener que llamar al banco.

- Prioridad: MVP.
- Fuente: CEO-03; CEO-06; CANALES-02; CANALES-05.

### HU-015 — Recibir notificaciones relevantes

Como cliente, quiero recibir notificaciones por los canales permitidos cuando ocurra un cambio relevante, para actuar dentro de la vigencia correspondiente.

- Prioridad: MVP.
- Fuente: CANALES-06.

### HU-016 — Registrar una incidencia

Como agente de contact center, quiero registrar una incidencia asociada a la solicitud, para escalar un problema sin modificar la decisión de Riesgos.

- Prioridad: MVP.
- Fuente: CANALES-09.

## Épica E5 — Aceptación y desembolso

### HU-017 — Revisar condiciones aprobadas

Como cliente aprobado, quiero revisar monto, plazo, tasa, condiciones y vigencia aplicables, para decidir si acepto el crédito.

- Prioridad: MVP.
- Fuente: RIESGOS-04; CANALES-02.

### HU-018 — Aceptar el contrato

Como cliente aprobado, quiero aceptar el contrato disponible, para continuar al desembolso.

- Prioridad: MVP.
- Fuente: CANALES-02; CANALES-06.
- Validación pendiente: mecanismo legal de aceptación.

### HU-019 — Desembolsar una sola vez

Como responsable de Operaciones, quiero que el desembolso sea idempotente, para evitar duplicidades ante reintentos o fallas.

- Prioridad: MVP.
- Fuente: CEO-09; RIESGOS-10; CANALES-07.

## Épica E6 — Analítica del recorrido

### HU-020 — Analizar el journey

Como responsable de Canales Digitales, quiero analizar eventos por etapa sin mezclar información financiera sensible innecesaria, para mejorar conversión y experiencia.

- Prioridad: MVP.
- Fuente: CEO-04; CANALES-10.

## Historias futuras explícitas

- Atención a clientes nuevos.
- Atención a trabajadores independientes.
- Extensión a otros productos crediticios.

Estas capacidades fueron mencionadas como posteriores y no forman parte del MVP inicial.
