# Preguntas para la siguiente entrevista — Siniestro Fácil

Las siguientes preguntas corresponden a vacíos, políticas incompletas o tensiones que la entrevista actual no permite resolver sin inventar información.

## Alcance y piloto

1. ¿Qué ciudad se utilizará para el piloto?
2. ¿Qué talleres participarán y cómo se seleccionará el grupo controlado?
3. ¿Qué criterios determinarán que el piloto fue exitoso y puede ampliarse?
4. ¿Qué ocurre en Siniestro Fácil cuando un caso inicialmente dentro del alcance revela posteriormente lesiones graves, proceso legal o daño masivo?

## Identidad y acceso

5. ¿Cómo se verificará la identidad del asegurado durante el reporte móvil?
6. ¿Cómo se acredita que una persona está autorizada para reportar en nombre del titular?
7. ¿Cómo se revoca o limita esa autorización?
8. ¿Qué permisos concretos tendrá cada actor: asegurado, reportante autorizado, operador, ajustador, investigador de fraude, taller, proveedor y supervisor?
9. ¿Qué responsabilidades específicas tiene el supervisor mencionado en la entrevista?
10. ¿El conductor distinto del asegurado tendrá acceso directo a la aplicación o solo figurará como dato del expediente?
11. ¿El corredor participará en el flujo futuro o solo representa un canal del proceso actual?

## Estados y experiencia del cliente

12. ¿Cuáles son los subestados internos mencionados por Operaciones?
13. ¿Qué estados y subestados deben ser visibles para el asegurado?
14. ¿Cómo se traducirán los estados internos a lenguaje comprensible para el cliente?
15. ¿Qué comunicaciones deben enviarse al asegurado ante cada cambio relevante y por qué canales?
16. ¿Qué información exacta se considera “siguiente paso” para cada estado?

## Cobertura y deducible

17. ¿Cuáles son las reglas de validación de cobertura para el alcance inicial?
18. ¿Qué causales pueden producir observación o rechazo?
19. ¿Qué decisiones de cobertura pueden automatizarse y cuáles requieren revisión humana?
20. ¿Cómo se determina y comunica el deducible aplicable?
21. ¿Qué ocurre si el sistema de pólizas no responde durante la validación?

## Evidencia

22. ¿Qué evidencia es obligatoria según tipo de evento antes de avanzar a evaluación, inspección, autorización o pago?
23. ¿En qué casos se requiere denuncia?
24. ¿Cuánto tiempo debe conservarse la evidencia original y cada versión derivada?
25. ¿Existen límites de tamaño, formato o cantidad de archivos por siniestro?
26. ¿Qué metadatos deben considerarse obligatorios y cuáles son opcionales cuando el dispositivo no los provee?
27. ¿Qué transformaciones de imágenes/documentos están permitidas?
28. ¿Quién puede descargar evidencia original?

## Deduplicación y relación de casos

29. ¿Cuál es la política exacta para detectar posibles reportes duplicados?
30. ¿Qué atributos se utilizan para sugerir que dos reportes podrían corresponder al mismo evento?
31. ¿Quién decide si dos reportes son duplicados?
32. ¿Qué debe ocurrir cuando el asegurado, corredor y taller reportan el mismo evento?
33. ¿Qué diferencia operativa debe existir entre “casos relacionados” y “casos duplicados”?
34. ¿En qué circunstancias, si alguna, se pueden consolidar datos entre expedientes relacionados?

## Asignación y operación

35. ¿Cómo se define objetivamente un caso simple, complejo o riesgoso?
36. ¿Qué peso o prioridad tienen ciudad, daño, severidad, cobertura, disponibilidad y señales de riesgo en la asignación?
37. ¿Qué actor puede reasignar un caso y qué razones de reasignación se permiten?
38. ¿Qué condiciones determinan que una inspección sea necesaria?
39. ¿Qué reglas gobiernan observaciones, repuestos alternativos y ampliaciones durante la reparación?
40. ¿Cuánto dura la vigencia de un presupuesto y quién la determina?
41. ¿Qué niveles de aprobación existen para presupuestos y cambios?

## SLA y métricas

42. ¿Cuál es el compromiso de primera respuesta según tipo de siniestro y ubicación?
43. ¿Cuál es el SLA de llegada de grúa por región?
44. ¿Cuál es el SLA de revisión de cobertura?
45. ¿Cuál es el SLA de asignación?
46. ¿Cuál es el SLA de inspección?
47. ¿Cuál es el SLA de recepción y revisión de presupuesto?
48. ¿Cuál es el SLA de autorización?
49. ¿Cuál es el SLA de cierre?
50. ¿Cómo se calculan exactamente las métricas indicadas por el CEO: primera asistencia, tiempo a decisión, casos sin llamadas adicionales, satisfacción, costo por siniestro y pérdidas evitadas por fraude?
51. ¿Qué valores objetivo o rangos se esperan para esas métricas?

## Proveedores e integraciones

52. ¿Qué proveedores cuentan actualmente con API y cuáles requieren otros mecanismos de integración?
53. ¿Qué datos intercambia Siniestro Fácil con el sistema de pólizas?
54. ¿Qué datos intercambia con talleres, grúas, ajustadores, mapas, mensajería y medios de pago?
55. ¿Cuántos reintentos se realizan ante una falta de respuesta y con qué intervalo?
56. ¿Cuándo se escala y cuándo se reasigna una solicitud?
57. ¿Cómo se identifica que una solicitud fue aceptada por un tercero?
58. ¿Qué operación debe continuar si una integración está temporalmente indisponible y cuál debe quedar pendiente?

## Fraude e IA

59. ¿Cuáles son las reglas determinísticas antifraude actualmente vigentes?
60. ¿Qué modelos se utilizan o se planea utilizar y qué resultados producen?
61. ¿Qué umbrales definen la severidad de una alerta?
62. ¿Qué combinaciones de señales y monto expuesto permiten detener temporalmente un pago o derivar el caso?
63. ¿Qué alertas solo incrementan prioridad sin bloquear ninguna actividad?
64. ¿Quién puede modificar la política antifraude y cómo se aprueba una nueva versión?
65. ¿Qué estados de revisión de alerta existen?
66. ¿Cómo se medirá la tasa de falsos positivos mencionada por Fraude?
67. ¿Qué nivel de explicación debe mostrarse al investigador para alertas producidas por modelos?
68. ¿Qué decisiones sensibles requieren revisión humana obligatoria?
69. ¿Qué ocurre con un caso cuando una alerta es descartada?
70. ¿Qué acceso ampliado requiere exactamente el investigador y qué información debe quedar oculta para un operador regular?

## Pagos, indemnización y cierre

71. ¿Cuál es el flujo completo de autorización y emisión de pagos?
72. ¿Cómo se previenen pagos duplicados?
73. ¿Qué controles deben existir antes de autorizar un pago?
74. ¿Qué diferencia de proceso existe entre reparación e indemnización?
75. ¿Qué condiciones permiten cerrar un siniestro y quién realiza el cierre?

## Requisitos no funcionales pendientes

76. ¿Qué tiempos de respuesta de aplicación son aceptables para las operaciones principales?
77. ¿Qué nivel de disponibilidad se requiere?
78. ¿Qué volumen de usuarios concurrentes y operaciones debe soportar el piloto y una eventual expansión nacional?
79. ¿Qué objetivos de continuidad y recuperación se requieren?
80. ¿Qué requisitos regulatorios, de privacidad y seguridad deben cumplirse específicamente?
81. ¿Qué requisitos de accesibilidad deben cumplirse en la aplicación móvil?
82. ¿Qué dispositivos o versiones de sistemas operativos deben soportarse?
83. ¿Qué requisitos de observabilidad, auditoría y conservación de logs son obligatorios?

## Tecnología y arquitectura

La entrevista no autoriza seleccionar tecnologías. Antes de hacerlo deben resolverse preguntas como:

84. ¿Existen estándares tecnológicos corporativos obligatorios para aplicaciones móviles, servicios, datos e integraciones?
85. ¿Existen restricciones de infraestructura, nube, centro de datos o proveedores aprobados?
86. ¿Qué mecanismos de autenticación e identidad corporativa deben integrarse?
87. ¿Qué restricciones técnicas presentan los sistemas heredados mencionados?
88. ¿Qué requisitos de despliegue, ambientes, pruebas y operación debe cumplir la solución?

## Contradicciones/tensiones a resolver explícitamente

No se detectan declaraciones mutuamente excluyentes que permitan afirmar una contradicción cerrada, pero sí tensiones que requieren política:

89. ¿Hasta qué punto puede acelerarse un caso simple antes de requerir controles adicionales de fraude?
90. ¿Qué evidencia mínima equilibra una experiencia simple con información suficiente para evaluar el caso?
91. ¿Qué actividades pueden automatizarse completamente y cuáles requieren revisión humana?
92. ¿Cómo se mantiene una vista única del caso sin confundirla con la relación entre múltiples reclamos o pólizas del mismo accidente?
93. ¿Qué versiones optimizadas puede usar la aplicación sin afectar la obligación de conservar originales?
94. ¿Qué operaciones deben ser síncronas y cuáles pueden quedar pendientes mientras se coordina con terceros?
