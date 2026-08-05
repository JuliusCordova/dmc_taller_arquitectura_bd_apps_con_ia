# DMC Application Specification — Crédito Ágil 360

## Control del documento

- Producto: Crédito Ágil 360.
- Organización ficticia: Banco Andino Digital.
- Versión: `0.2-draft`.
- Estado: pendiente de validación.
- Fuente primaria: entrevistas de CEO, Riesgos de Crédito y Canales Digitales.
- Método: Spec-Driven Development.
- Fuente de verdad: este documento y sus anexos trazables.

---

# 01. Identidad

## Nombre del producto

**Crédito Ágil 360**.

## Propósito

Originar créditos personales para clientes existentes con ingresos recurrentes mediante una experiencia omnicanal, trazable y explicable, desde la oferta o simulación hasta la decisión, aceptación y desembolso dentro del alcance aprobado.

## Sponsor y stakeholders principales

- CEO / Sponsor.
- Riesgos de Crédito.
- Canales Digitales.
- Operaciones.
- Cumplimiento y Legal.
- Seguridad y Privacidad.
- Desembolso y Core bancario.

## Estado de esta versión

La versión `0.2-draft` organiza la evidencia disponible en los 12 bloques canónicos. No implica aprobación funcional, técnica, legal ni de riesgo.

---

# 02. Contexto

El proceso actual está fragmentado entre canales, riesgos, operaciones, cumplimiento y desembolso. Cada canal puede crear registros diferentes, volver a pedir información disponible, mostrar estados ambiguos y generar duplicados cuando ocurren reintentos o fallas de integración.

Parte de las reglas se encuentra distribuida entre sistemas, hojas de cálculo y manuales operativos. La decisión histórica no siempre puede reconstruirse con facilidad.

## Problemas confirmados

- abandono durante la solicitud;
- tiempos de espera y transferencias internas;
- duplicidad de datos y solicitudes;
- pérdida de continuidad entre canales;
- dificultad para conocer el estado;
- intervención manual elevada;
- inconsistencias entre sistemas;
- dificultad para explicar decisiones históricas;
- riesgo de duplicar evaluaciones o desembolsos.

## Evidencia de origen

- CEO-01 a CEO-10.
- RIESGOS-01 a RIESGOS-10.
- CANALES-01 a CANALES-10.

---

# 03. Objetivos

## Objetivos de negocio confirmados

1. Aumentar la conversión de ofertas a desembolsos sin deteriorar la calidad de cartera.
2. Reducir el tiempo desde la solicitud hasta la decisión.
3. Reducir el abandono por etapa.
4. Reducir solicitudes con intervención manual.
5. Permitir continuidad entre canales.
6. Mostrar estado y siguiente paso en lenguaje claro.
7. Mantener decisiones controladas, auditables y explicables.
8. Completar una primera versión operativa de extremo a extremo para una campaña de clientes con abono de sueldo.

## Métricas mencionadas

- conversión de ofertas a desembolsos;
- tiempo medio desde solicitud hasta decisión;
- abandono por etapa;
- mora temprana;
- solicitudes con intervención manual;
- errores, reintentos, rechazos documentales y tiempos de respuesta.

## Información pendiente

No se definieron valores base, metas, ventanas de medición ni umbrales de éxito.

---

# 04. Alcance

## Incluido en la primera versión

- créditos personales;
- clientes existentes con ingresos recurrentes;
- selección de oferta o simulación;
- solicitud única y continuidad omnicanal;
- confirmación de datos disponibles;
- actualización de datos permitidos;
- autorizaciones de consulta;
- carga documental cuando corresponda;
- consultas internas y externas habilitadas;
- reglas de elegibilidad;
- aprobación, rechazo, observación o revisión manual;
- gestión de excepciones;
- estado y acciones pendientes;
- condiciones, contrato y aceptación;
- desembolso para el alcance aprobado;
- notificaciones sin datos sensibles;
- auditoría y trazabilidad;
- analítica del journey.

## Fuera del MVP inicial

- clientes nuevos;
- trabajadores independientes;
- otros productos crediticios;
- transformación simultánea de todos los sistemas legados.

## Dependencias

- identidad y autenticación;
- sistemas internos de clientes, productos, movimientos y alertas;
- fuentes externas aún no identificadas;
- motor de reglas;
- gestión contractual;
- core bancario y desembolso;
- proveedores de notificaciones;
- políticas de Cumplimiento, Seguridad y Privacidad.

## Restricciones

- no aprobar fuera de políticas;
- no exponer información financiera;
- no producir decisiones imposibles de explicar;
- no comprometer la continuidad del core;
- no duplicar innecesariamente datos sensibles;
- mantener segregación de funciones;
- evitar evaluación o desembolso duplicado;
- permitir cambios de reglas sin reconstruir toda la aplicación.

---

# 05. Actores

## Actores humanos

- Cliente existente con ingresos recurrentes.
- Asesor de agencia o canal autorizado.
- Agente de contact center.
- Analista de Riesgos.
- Supervisor de Riesgos.
- Operador de desembolso.
- Auditor.
- Administrador funcional de reglas, sujeto a validación.

## Stakeholders y áreas

- CEO / Sponsor.
- Riesgos de Crédito.
- Canales Digitales.
- Operaciones.
- Cumplimiento y Legal.
- Seguridad y Privacidad.
- Gobierno de Datos.
- Core bancario.

## Actores sistémicos

- Sistema de identidad.
- Sistemas internos.
- Fuentes externas.
- Motor de reglas.
- Gestión documental.
- Gestión contractual.
- Servicio de desembolso.
- Servicios de notificación.
- Capacidades de IA o agentes bajo controles definidos.

---

# 06. Procesos

## Proceso principal

1. Seleccionar una oferta o realizar una simulación.
2. Crear o recuperar una solicitud única.
3. Confirmar datos disponibles y completar faltantes.
4. Registrar autorizaciones aplicables.
5. Adjuntar documentos cuando corresponda.
6. Consultar fuentes internas y externas habilitadas.
7. Aplicar políticas y reglas vigentes.
8. Emitir aprobado, rechazado, observado o revisión manual.
9. Revisar casos manuales y gestionar excepciones.
10. Comunicar estado y siguiente acción.
11. Mostrar condiciones aprobadas.
12. Registrar aceptación contractual.
13. Solicitar y confirmar desembolso sin duplicidad.

## Procesos alternativos

- integración lenta o no disponible;
- documento ilegible;
- información incompleta;
- inconsistencia de ingresos;
- alerta de identidad;
- exposición cercana al límite;
- reintento del cliente;
- excepción de campaña;
- continuación desde otro canal;
- fallo o respuesta incierta del desembolso.

## Estados visibles mencionados

Borrador, información pendiente, en evaluación, requiere documento, requiere validación, aprobado, no aprobado, pendiente de aceptación, listo para desembolso, desembolsado y cancelado.

La máquina de estados interna y sus transiciones quedan pendientes.

---

# 07. Historias

Las historias completas y su trazabilidad están en `01_user_stories.md`.

## Resumen por épica

1. Inicio y continuidad omnicanal.
2. Datos, autorizaciones y documentos.
3. Evaluación y decisión.
4. Estado, acciones y comunicación.
5. Aceptación y desembolso.
6. Analítica del recorrido.

## Volumen actual

- 20 historias de usuario iniciales.
- Historias futuras separadas para clientes nuevos, independientes y otros productos.

---

# 08. Requisitos funcionales

Los requisitos completos están en `02_requirements.md`.

## Capacidades funcionales principales

- iniciar desde oferta o simulación;
- crear y recuperar solicitud única;
- reutilizar y confirmar datos;
- registrar autorizaciones;
- gestionar documentos;
- extraer datos con IA sin inventar valores;
- consultar fuentes habilitadas;
- aplicar reglas versionadas;
- gestionar revisión manual y excepciones;
- conservar decisión histórica;
- mostrar estados y notificar;
- aceptar contrato;
- ejecutar desembolso idempotente;
- registrar eventos del journey.

## Volumen actual

- 33 requisitos funcionales iniciales.

---

# 09. Requisitos no funcionales

Los requisitos completos están en `02_requirements.md`.

## Categorías identificadas

- trazabilidad;
- seguridad;
- privacidad;
- segregación de funciones;
- idempotencia;
- disponibilidad;
- escalabilidad;
- resiliencia;
- experiencia;
- accesibilidad;
- explicabilidad;
- gobierno de IA;
- evolución de reglas;
- continuidad del core;
- minimización de datos;
- observabilidad;
- rendimiento;
- compatibilidad móvil.

## Volumen actual

- 20 requisitos no funcionales iniciales.

Los SLA, RTO, RPO, latencias y umbrales aún deben definirse.

---

# 10. Reglas

## Reglas confirmadas

1. Una solicitud conserva un identificador único aunque cambie de canal.
2. La decisión utiliza la versión de reglas vigente en el momento de evaluación.
3. Una decisión histórica no se reescribe por cambios posteriores.
4. El analista puede recomendar una excepción; el nivel autorizado la aprueba.
5. Toda excepción conserva justificación, evidencias, recomendador y aprobador.
6. Las excepciones no se aprueban por correo fuera del sistema.
7. Un aprobado puede incluir monto máximo, plazo, tasa, condiciones y vigencia.
8. El rechazo registra razones internas; el mensaje al cliente debe validarse.
9. La IA no completa campos ausentes.
10. Cada campo extraído conserva documento de origen y confianza.
11. Casos debajo del umbral acordado requieren revisión humana.
12. Contact center consulta estado y registra incidencia, pero no modifica decisiones.
13. Las notificaciones no incluyen datos sensibles.
14. Una solicitud no debe evaluarse ni desembolsarse dos veces por reintentos.

## Reglas pendientes

- deduplicación;
- edición de datos;
- vigencia de datos;
- matriz de excepciones;
- estados y transiciones;
- motivos comunicables;
- umbrales de confianza;
- reglas exactas de campaña y elegibilidad.

---

# 11. Criterios

Los criterios completos están en `03_acceptance_criteria.md`.

## Cobertura actual

- creación y recuperación de solicitud;
- idempotencia;
- reutilización de datos;
- documentos y extracción con IA;
- evaluación y versionado de reglas;
- revisión manual y excepciones;
- reconstrucción de decisiones;
- estados y notificaciones;
- contrato y desembolso;
- resiliencia;
- analítica y accesibilidad.

## Volumen actual

- 27 criterios de aceptación en formato Dado–Cuando–Entonces.

---

# 12. Preguntas

Las preguntas completas están en `04_open_questions_and_validations.md`.

## Grupos de preguntas

- negocio y alcance;
- identidad, datos y consentimiento;
- reglas, evaluación y excepciones;
- IA y agentes;
- integraciones y resiliencia;
- requisitos no funcionales;
- validaciones del prototipo.

## Volumen actual

- 34 preguntas abiertas con responsable sugerido e impacto.

## Regla SDD

Una pregunta abierta no debe convertirse en una decisión de arquitectura, dato, API, prueba o código hasta ser respondida o aceptada formalmente como supuesto.

---

# Uso permitido de IA y agentes

## Capacidades mencionadas

- leer documentos;
- extraer campos;
- señalar inconsistencias;
- orientar al cliente;
- resumir un expediente.

## Límites confirmados

- la decisión crediticia sigue políticas controladas y auditables;
- la IA no completa información no encontrada;
- cada resultado conserva origen y confianza;
- los modelos requieren responsables, límites y monitoreo;
- los casos bajo umbral requieren revisión humana.

No se han definido proveedor, modelo, autonomía, herramientas, acciones permitidas ni controles AgentOps.

---

# Consideraciones preliminares de datos

## Objetos evidenciados

Cliente, oferta, simulación, solicitud, autorización, documento, fuente, dato utilizado, evaluación, versión de reglas, score, decisión, motivo, excepción, contrato, desembolso, notificación, incidencia y evento de recorrido.

## Principios

- conservar el valor utilizado en la decisión histórica;
- distinguir nueva solicitud de reintento;
- minimizar duplicación de datos sensibles;
- conservar origen, fecha y hora;
- separar analítica de navegación de información financiera sensible cuando sea posible.

El modelo conceptual, lógico y físico se desarrollará y versionará en los hitos definidos en `06_development_plan.md`.

---

# Criterios para pasar a diseño detallado

- los 12 bloques están completos al nivel de evidencia disponible;
- historias y requisitos tienen fuente;
- el alcance MVP está aprobado;
- preguntas críticas están resueltas o aceptadas como dependencia;
- Riesgos valida reglas, evaluación, excepciones y trazabilidad;
- Cumplimiento y Seguridad validan consentimiento, privacidad y acceso;
- Canales valida journey, estados y continuidad;
- Operaciones valida contrato, desembolso e idempotencia;
- los criterios de aceptación son verificables;
- el plan de desarrollo está actualizado con el estado real.
