# Requisitos — Crédito Ágil 360

## Requisitos funcionales

| ID | Requisito | Historias | Fuente |
|---|---|---|---|
| RF-001 | El sistema debe permitir seleccionar una oferta o registrar una simulación de crédito personal. | HU-001 | CANALES-02 |
| RF-002 | El sistema debe crear una solicitud con identificador único y conservarlo al cambiar de canal. | HU-001, HU-002 | CANALES-01, CANALES-04 |
| RF-003 | El sistema debe permitir recuperar una solicitud después de autenticar al cliente. | HU-002 | CANALES-04 |
| RF-004 | El sistema debe permitir a un asesor autorizado consultar el estado sin acceder a información innecesaria. | HU-003 | CANALES-04 |
| RF-005 | El sistema debe presentar los datos vigentes disponibles para confirmación. | HU-004 | CANALES-03 |
| RF-006 | El sistema debe permitir actualizar los datos que las políticas autoricen. | HU-005 | CANALES-03 |
| RF-007 | El sistema debe registrar la autorización aplicable antes de ejecutar las consultas que la requieran. | HU-006 | CANALES-02 |
| RF-008 | El sistema debe solicitar y recibir documentos únicamente cuando correspondan al caso. | HU-007 | CANALES-02, RIESGOS-06 |
| RF-009 | La capacidad de IA debe extraer campos sin completar valores ausentes. | HU-008 | RIESGOS-09 |
| RF-010 | Cada campo extraído debe vincularse con documento de origen y nivel de confianza. | HU-008 | RIESGOS-09 |
| RF-011 | Los campos por debajo del umbral acordado deben enviarse a revisión humana. | HU-008 | RIESGOS-09 |
| RF-012 | El sistema debe consultar las fuentes internas y externas habilitadas para la evaluación. | HU-009 | RIESGOS-01, RIESGOS-02 |
| RF-013 | El sistema debe aplicar la versión vigente de reglas y políticas según campaña, segmento y demás condiciones aprobadas. | HU-009 | RIESGOS-03, RIESGOS-05 |
| RF-014 | La evaluación debe producir al menos aprobado, rechazado, observado o revisión manual. | HU-009, HU-010 | RIESGOS-04 |
| RF-015 | Un resultado aprobado debe poder registrar monto máximo, plazo, tasa, condiciones y vigencia cuando correspondan. | HU-017 | RIESGOS-04 |
| RF-016 | El sistema debe derivar a revisión manual los casos definidos por Riesgos. | HU-010 | RIESGOS-06 |
| RF-017 | El expediente de revisión debe presentar datos, documentos, alertas y motivo de derivación. | HU-010 | RIESGOS-05, RIESGOS-06 |
| RF-018 | El analista debe poder recomendar una excepción registrando justificación y documentos considerados. | HU-011 | RIESGOS-07 |
| RF-019 | El supervisor autorizado debe poder aprobar o rechazar la excepción dentro del sistema. | HU-012 | RIESGOS-07 |
| RF-020 | El sistema debe conservar recomendador, aprobador, fecha y evidencia de la excepción. | HU-011, HU-012 | RIESGOS-07 |
| RF-021 | El sistema debe conservar datos utilizados, fuentes, fecha, hora, versión de reglas, score, excepciones y usuarios de cada decisión. | HU-013 | RIESGOS-05 |
| RF-022 | El sistema no debe reescribir una decisión histórica cuando cambien datos o reglas posteriores. | HU-013 | RIESGOS-05 |
| RF-023 | El sistema debe mostrar al cliente un estado simple, acciones pendientes y siguiente paso. | HU-014 | CEO-06, CANALES-05 |
| RF-024 | El sistema debe traducir los estados internos a mensajes comprensibles para el cliente. | HU-014 | CANALES-05 |
| RF-025 | El sistema debe notificar inicio, información pendiente, cambio relevante, aprobación con vigencia, contrato disponible y desembolso. | HU-015 | CANALES-06 |
| RF-026 | El cliente debe poder elegir entre los canales de notificación permitidos. | HU-015 | CANALES-06 |
| RF-027 | El contact center debe poder consultar estado y registrar incidencias, sin modificar decisiones. | HU-016 | CANALES-09 |
| RF-028 | El cliente aprobado debe poder revisar condiciones y aceptar el contrato. | HU-017, HU-018 | CANALES-02 |
| RF-029 | El sistema debe solicitar, registrar y confirmar el desembolso. | HU-019 | CEO-09, CANALES-02 |
| RF-030 | Los reintentos no deben crear una nueva evaluación o desembolso para la misma operación. | HU-019 | RIESGOS-10, CANALES-07 |
| RF-031 | Ante una falla de integración, el sistema debe conservar lo ya registrado y reintentar solo la acción necesaria. | HU-002, HU-019 | CANALES-07 |
| RF-032 | El sistema debe capturar eventos de ingreso, abandono, error, documento rechazado, reintento, tiempo de respuesta y conversión. | HU-020 | CANALES-10 |
| RF-033 | La analítica del recorrido debe minimizar la mezcla con información financiera sensible. | HU-020 | CANALES-10 |

## Requisitos no funcionales

| ID | Categoría | Requisito verificable o estado | Fuente |
|---|---|---|---|
| RNF-001 | Trazabilidad | Toda decisión debe poder reconstruirse con datos, fuentes, tiempo, reglas, score, excepciones y usuarios. | RIESGOS-05 |
| RNF-002 | Seguridad | La solución debe proteger datos personales y financieros y limitar el acceso por rol. Los controles exactos quedan por definir. | CEO-07, RIESGOS-10 |
| RNF-003 | Segregación | Un analista puede recomendar una excepción y el nivel autorizado debe aprobarla según política. | RIESGOS-07, RIESGOS-10 |
| RNF-004 | Idempotencia | Reintentos no deben duplicar solicitud, evaluación ni desembolso. | RIESGOS-08, RIESGOS-10, CANALES-07 |
| RNF-005 | Disponibilidad | La solución debe estar disponible durante campañas. El SLA exacto no está definido. | RIESGOS-10 |
| RNF-006 | Escalabilidad | Debe soportar el tráfico habitual y el incremento de hasta cinco veces durante las primeras horas de campaña. | CANALES-08 |
| RNF-007 | Volumen | La referencia actual es aproximadamente 8,000 simulaciones y 1,500 solicitudes diarias; debe confirmarse para dimensionamiento. | CANALES-08 |
| RNF-008 | Resiliencia | Debe reprocesar consultas fallidas sin perder información ya registrada. | RIESGOS-10, CANALES-07 |
| RNF-009 | Experiencia | Los mensajes deben ser claros y evitar estados ambiguos. | CEO-06, CANALES-05 |
| RNF-010 | Accesibilidad | Los formularios deben ser compatibles con lectores de pantalla, usar lenguaje claro y validaciones inmediatas. | CANALES-09 |
| RNF-011 | Privacidad | Las notificaciones no deben contener datos sensibles. | CANALES-06 |
| RNF-012 | Explicabilidad | Ninguna decisión crediticia debe ser imposible de explicar. | CEO-07 |
| RNF-013 | Gobierno IA | Los modelos deben tener responsables, límites y monitoreo. | CEO-08 |
| RNF-014 | Calidad IA | La extracción debe conservar confianza y origen; el umbral está pendiente. | RIESGOS-09 |
| RNF-015 | Evolución | Las reglas deben poder cambiar sin reconstruir toda la aplicación. | CEO-10, RIESGOS-03 |
| RNF-016 | Continuidad | La solución no debe comprometer la continuidad del core bancario. | CEO-07 |
| RNF-017 | Minimización | No debe duplicar innecesariamente datos sensibles. | CEO-10 |
| RNF-018 | Observabilidad | Debe registrar fallas, reintentos, tiempos y eventos por etapa. Métricas y retención pendientes. | CANALES-10 |
| RNF-019 | Rendimiento | Los umbrales de respuesta por operación no fueron definidos y deben acordarse. | RIESGOS-10, CANALES-10 |
| RNF-020 | Compatibilidad | La mayoría de las consultas se realiza desde móvil; navegadores y versiones soportadas están pendientes. | CANALES-08 |

## Restricciones que no deben convertirse todavía en diseño técnico

- No se ha seleccionado proveedor cloud, base de datos, framework, modelo de IA ni motor de reglas.
- No se ha definido si cada consulta o decisión será síncrona o asíncrona.
- No se han definido contratos de API ni eventos.
- No se han definido RTO, RPO, SLA, retención, cifrado o mecanismos concretos de autenticación.
