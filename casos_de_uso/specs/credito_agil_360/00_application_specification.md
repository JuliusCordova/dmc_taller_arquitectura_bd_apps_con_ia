# DMC Application Specification — Crédito Ágil 360

## 0. Control del documento

- Producto: Crédito Ágil 360.
- Organización ficticia: Banco Andino Digital.
- Versión: 0.1-draft.
- Estado: pendiente de validación.
- Fuente primaria: entrevistas de CEO, Riesgos de Crédito y Canales Digitales.
- Método: Spec-Driven Development.

## 1. Identidad del producto

Crédito Ágil 360 es una aplicación moderna para originar créditos personales, inicialmente dirigida a clientes existentes con ingresos recurrentes. Debe permitir iniciar y continuar una misma solicitud entre canales, completar información faltante, adjuntar documentos cuando corresponda, ejecutar la evaluación crediticia bajo políticas controladas, informar el estado y, dentro del alcance aprobado, llegar hasta aceptación contractual y desembolso.

## 2. Contexto y problema

El proceso actual está fragmentado entre canales, riesgos, operaciones, cumplimiento y desembolso. Los canales crean identificadores distintos, solicitan nuevamente información disponible, presentan estados ambiguos y pueden generar duplicados cuando una integración falla o el cliente reintenta. Parte de las reglas se encuentra distribuida entre sistemas, hojas de cálculo y manuales.

### Impactos mencionados

- abandono durante la solicitud;
- esperas y transferencias internas;
- duplicidad de información y solicitudes;
- dificultad para conocer el estado;
- intervención manual;
- errores por inconsistencias entre sistemas;
- dificultad para reconstruir una decisión histórica.

## 3. Objetivos y métricas

### Objetivos confirmados

1. Aumentar la conversión de ofertas a desembolsos sin deteriorar la calidad de cartera.
2. Reducir el tiempo desde la solicitud hasta la decisión.
3. Reducir el abandono por etapa.
4. Reducir las solicitudes que requieren intervención manual.
5. Ofrecer continuidad entre canales y visibilidad clara del trámite.
6. Mantener decisiones crediticias controladas, auditables y explicables.

### Métricas mencionadas

- conversión de ofertas a desembolsos;
- tiempo medio desde solicitud hasta decisión;
- abandono por etapa;
- mora temprana;
- porcentaje o cantidad de solicitudes con intervención manual;
- eventos de ingreso, abandono, error, rechazo documental, reintento, tiempo de respuesta y conversión.

Los valores base, metas y ventanas de medición no fueron definidos en las entrevistas.

## 4. Alcance

### Incluido en la primera versión según entrevistas

- créditos personales;
- clientes existentes con ingresos recurrentes;
- oferta o simulación;
- confirmación y actualización permitida de datos;
- autorización de consultas;
- carga de documentos cuando corresponda;
- consulta de fuentes internas y externas habilitadas;
- aplicación de políticas de elegibilidad;
- aprobación automática, rechazo, observación o revisión manual;
- gestión controlada de excepciones;
- consulta de estado y acciones pendientes;
- aceptación de condiciones y contrato;
- desembolso de extremo a extremo para el alcance aprobado;
- notificaciones sin datos sensibles;
- trazabilidad y auditoría.

### Fuera de la primera versión

- clientes nuevos;
- trabajadores independientes;
- otros productos crediticios;
- transformación simultánea de todos los sistemas legados.

### Dependencias no definidas

- fuentes externas exactas;
- core bancario y mecanismo de desembolso;
- sistemas internos de clientes, productos, movimientos, alertas y comportamiento;
- servicios de identidad;
- proveedores de correo, SMS y notificaciones;
- gestión contractual y firma o aceptación;
- políticas de Cumplimiento, Seguridad y Privacidad.

### Restricciones confirmadas

- no aprobar fuera de políticas;
- no exponer información financiera;
- no producir decisiones imposibles de explicar;
- no comprometer la continuidad del core;
- no duplicar innecesariamente datos sensibles;
- permitir cambio de reglas sin reconstruir toda la aplicación;
- mantener segregación de funciones;
- evitar evaluación o desembolso duplicado.

## 5. Actores y stakeholders

- Cliente existente con ingresos recurrentes.
- Asesor de agencia, contact center u otro canal autorizado.
- Analista de Riesgos de Crédito.
- Supervisor de Riesgos.
- Canales Digitales.
- Operaciones.
- Cumplimiento.
- Desembolso.
- Sistemas internos y fuentes externas.
- Motor de reglas.
- Capacidades de IA para extracción, detección de inconsistencias, orientación y resumen, bajo límites controlados.

## 6. Proceso principal

1. El cliente selecciona una oferta o realiza una simulación.
2. El sistema crea o recupera una solicitud única.
3. El cliente confirma datos disponibles y completa los faltantes.
4. El cliente autoriza las consultas aplicables.
5. El cliente adjunta documentos cuando corresponda.
6. El sistema consulta fuentes internas y externas habilitadas.
7. El sistema aplica las políticas y reglas vigentes.
8. La evaluación produce aprobado, rechazado, observado o revisión manual.
9. Los casos manuales son atendidos por Riesgos; las excepciones requieren justificación y aprobación según el nivel correspondiente.
10. El cliente recibe un estado y una instrucción clara.
11. En caso de aprobación, revisa condiciones y acepta el contrato.
12. El sistema solicita y registra el desembolso evitando duplicidad.

### Flujos alternativos confirmados

- integración lenta o no disponible;
- documento ilegible;
- información incompleta;
- inconsistencia entre información declarada y observada;
- alerta de identidad;
- exposición cercana al límite;
- reintento del cliente;
- solicitud marcada como excepcional;
- continuación desde otro canal.

## 7. Estados del cliente mencionados

- Borrador.
- Información pendiente.
- En evaluación.
- Requiere documento.
- Requiere validación.
- Aprobado.
- No aprobado.
- Pendiente de aceptación.
- Listo para desembolso.
- Desembolsado.
- Cancelado.

La correspondencia con estados internos y sus transiciones debe definirse y aprobarse.

## 8. Reglas de negocio confirmadas

1. Una solicitud debe conservar un identificador único aunque cambie de canal.
2. La decisión debe utilizar la versión de reglas vigente al momento de la evaluación.
3. Una decisión histórica no debe reescribirse cuando cambien los datos o reglas posteriores.
4. Un analista puede recomendar una excepción, pero la aprobación depende del nivel de riesgo y puede requerir supervisor.
5. Toda excepción debe conservar justificación, documentos considerados, recomendador y aprobador.
6. Las aprobaciones de excepción no deben gestionarse fuera del sistema.
7. Un aprobado puede incluir monto máximo, plazo, tasa, condiciones y fecha de vigencia.
8. El rechazo debe registrar razones internas; el contenido que se muestra al cliente debe ser definido.
9. La IA no debe completar campos ausentes.
10. Cada campo extraído por IA debe conservar documento de origen y nivel de confianza.
11. Los casos debajo del umbral de confianza acordado requieren revisión humana.
12. El contact center puede consultar estado y registrar incidencias, pero no modificar decisiones de Riesgos.
13. Las notificaciones no deben incluir datos sensibles.
14. Una misma solicitud no debe evaluarse o desembolsarse dos veces por reintentos.

## 9. Uso permitido de IA y agentes

### Capacidades mencionadas

- leer documentos;
- extraer campos;
- señalar inconsistencias;
- orientar al cliente;
- resumir el expediente para el analista.

### Límites confirmados

- la decisión crediticia sigue políticas controladas y auditables;
- la IA no completa datos no encontrados;
- los resultados deben conservar evidencia de origen y confianza;
- los modelos requieren monitoreo, responsables y límites claros;
- casos bajo el umbral acordado requieren intervención humana.

No se ha definido el modelo, proveedor, umbral, autonomía, catálogo de herramientas ni acciones que un agente puede ejecutar.

## 10. Consideraciones preliminares de datos

### Objetos de negocio evidenciados

Cliente, oferta, simulación, solicitud, autorización, documento, fuente, dato utilizado, evaluación, versión de reglas, score, decisión, motivo, excepción, contrato, desembolso, notificación, incidencia y evento de recorrido.

### Principios derivados de restricciones explícitas

- conservar el valor utilizado en la decisión histórica;
- separar navegación y analítica de la información financiera sensible cuando sea posible;
- evitar duplicación innecesaria de datos sensibles;
- conservar origen, fecha y hora de los datos utilizados;
- distinguir reintento de nueva solicitud.

El modelo conceptual, lógico y físico se definirá en una fase posterior y deberá validarse contra esta Specification.

## 11. Criterios de salida de la Specification v0.1

La versión puede pasar a diseño detallado cuando:

- las historias y requisitos tengan fuente identificada;
- el alcance MVP sea aprobado;
- las preguntas críticas de identidad, deduplicación, reglas, integraciones, SLA, retención y autorizaciones estén resueltas o formalmente aceptadas como dependencia;
- Riesgos valide reglas, estados de evaluación, excepciones y trazabilidad;
- Cumplimiento y Seguridad validen consentimiento, privacidad, acceso y mensajes;
- Canales valide el journey, estados visibles y continuidad omnicanal;
- Operaciones y Desembolso validen el flujo end-to-end e idempotencia;
- los criterios de aceptación sean verificables.

## 12. Referencias de evidencia

- CEO-01 a CEO-10.
- RIESGOS-01 a RIESGOS-10.
- CANALES-01 a CANALES-10.

La trazabilidad detallada se encuentra en los documentos complementarios de esta carpeta.
