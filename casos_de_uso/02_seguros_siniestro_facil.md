# Caso de uso 2 — Seguros

## Seguros Horizonte: Siniestro Fácil

### Contexto ficticio

Seguros Horizonte comercializa seguros vehiculares, de salud y de hogar. El caso del taller se concentra en seguros vehiculares. La compañía administra aproximadamente 420,000 pólizas activas y recibe cerca de 18,000 reportes de siniestro al mes.

Hoy, un asegurado puede reportar un accidente por teléfono, correo, aplicación móvil o mediante un corredor. La información se transcribe varias veces, las fotografías se almacenan en ubicaciones diferentes y el cliente no tiene una visión clara del avance. La compañía propone una aplicación moderna llamada **Siniestro Fácil** para registrar el evento, validar cobertura, recopilar evidencias, coordinar asistencia, gestionar la evaluación y mantener informado al asegurado.

Las entrevistas siguientes representan el material inicial de descubrimiento. Los participantes deberán detectar diferencias entre objetivos estratégicos, necesidades operativas y controles antifraude.

---

## Entrevista 1 — CEO

**Entrevistado:** Rodrigo Velarde, CEO  
**Objetivo:** comprender la prioridad estratégica, la propuesta de valor y los límites del proyecto.

### 1. ¿Por qué transformar el proceso de siniestros?

**CEO:** La promesa de una aseguradora se prueba cuando ocurre un siniestro. Vendemos tranquilidad, pero en ese momento el cliente enfrenta llamadas, formularios repetidos y poca información. Cada demora afecta la confianza y eleva nuestros costos de atención.

### 2. ¿Cuál es el problema de negocio más urgente?

**CEO:** Tenemos un proceso poco transparente y excesivamente manual. Los casos simples consumen tiempo que deberíamos dedicar a los complejos. Al mismo tiempo, debemos controlar fraude y evitar pagos incorrectos. Necesitamos velocidad con criterio, no velocidad sin controles.

### 3. ¿Qué espera de Siniestro Fácil?

**CEO:** Que el asegurado pueda reportar el accidente desde su teléfono, recibir ayuda, adjuntar evidencia y conocer el siguiente paso. Internamente, quiero una vista única del caso y una asignación inteligente para que los siniestros sencillos sigan una vía rápida y los riesgosos reciban revisión especializada.

### 4. ¿Cómo mediría el éxito?

**CEO:** Tiempo desde el reporte hasta la primera asistencia, tiempo hasta la decisión, porcentaje de casos resueltos sin llamadas adicionales, satisfacción del cliente, costo operativo por siniestro y pérdidas evitadas por fraude. Debemos mirar esas métricas en conjunto.

### 5. ¿Cuál debería ser el alcance inicial?

**CEO:** Siniestros vehiculares de daños materiales sin lesiones graves. Empezaría con clientes directos y pólizas vigentes. Los casos con heridos, fallecidos, procesos legales o daños masivos deben continuar por rutas especializadas.

### 6. ¿Qué experiencia espera para el asegurado?

**CEO:** Lenguaje humano y guía paso a paso. El cliente no conoce nuestros términos internos. La aplicación debe decirle qué hacer, cómo protegerse, qué evidencia recopilar y cuándo llegará la asistencia. También debe permitir que una persona autorizada reporte el caso si el titular no puede hacerlo.

### 7. ¿Qué riesgos deben evitarse?

**CEO:** Exposición de datos personales, rechazo incorrecto de coberturas, pagos duplicados, manipulación de evidencia y decisiones automatizadas sin posibilidad de revisión. Tampoco quiero que el sistema trate una recomendación de IA como una verdad absoluta.

### 8. ¿Qué papel debería tener la IA?

**CEO:** Puede clasificar fotografías, detectar documentos faltantes, resumir declaraciones y priorizar casos. Puede sugerir posibles inconsistencias, pero una alerta no equivale a fraude. Las decisiones sensibles deben ser revisables y quedar explicadas.

### 9. ¿Qué dependencias reconoce?

**CEO:** Nuestro sistema de pólizas, la red de talleres, proveedores de grúa, ajustadores, mapas, mensajería y medios de pago. No todos tienen APIs modernas. La arquitectura debe tolerar integraciones lentas y proveedores temporalmente indisponibles.

### 10. ¿Cuál es la expectativa de entrega?

**CEO:** Un piloto funcional en una ciudad y con un grupo controlado de talleres. Quiero comprobar la experiencia completa, desde el reporte hasta la autorización de reparación, antes de expandirlo a todo el país.

---

## Entrevista 2 — Área crítica: Operaciones de Siniestros

**Entrevistada:** Ana Lucía Campos, gerente de Operaciones de Siniestros  
**Objetivo:** entender el flujo operativo, los estados, las excepciones y la coordinación con terceros.

### 1. ¿Qué ocurre cuando se reporta un accidente?

**Operaciones:** Primero confirmamos la identidad del reportante, la póliza y el vehículo. Registramos fecha, hora, ubicación, personas involucradas, descripción y daños aparentes. Luego verificamos cobertura y deducible, coordinamos asistencia si corresponde y asignamos el caso.

### 2. ¿Qué información mínima se necesita para crear el caso?

**Operaciones:** Número de póliza o documento del asegurado, placa del vehículo, fecha y ubicación aproximada, tipo de evento y un medio de contacto. No siempre podemos exigir toda la evidencia al inicio, especialmente si el cliente está en una situación de riesgo.

### 3. ¿Qué evidencias suelen solicitar?

**Operaciones:** Fotografías del vehículo, daños, entorno, documentos de identidad, licencia, tarjeta de propiedad, declaración del conductor, datos de terceros y denuncia cuando aplica. Cada evidencia debe vincularse al siniestro, al momento de captura y, cuando sea posible, a ubicación y dispositivo.

### 4. ¿Cuáles son los estados principales?

**Operaciones:** Reportado, validando cobertura, asistencia coordinada, evidencia pendiente, en evaluación, inspección programada, presupuesto recibido, autorizado, observado, rechazado, en reparación, listo para entrega, indemnizado y cerrado. Hay subestados internos que el cliente no necesita ver.

### 5. ¿Cómo se asigna un siniestro?

**Operaciones:** Depende de ciudad, tipo de daño, severidad, cobertura, disponibilidad de proveedores y señales de riesgo. Los casos simples pueden ir a un flujo digital. Los complejos requieren ajustador. La reasignación debe conservar el historial y la razón.

### 6. ¿Qué problemas operativos existen hoy?

**Operaciones:** Se crean casos duplicados cuando llaman el asegurado, el corredor y el taller. Las fotografías llegan por correo o mensajería y luego cuesta saber cuál es la versión válida. También hay autorizaciones telefónicas que no quedan registradas adecuadamente.

### 7. ¿Cómo se trabaja con talleres y proveedores?

**Operaciones:** Un taller recibe la orden, presenta presupuesto, adjunta diagnóstico y solicita aprobación. Puede haber observaciones, repuestos alternativos o ampliaciones durante la reparación. Necesitamos conocer la vigencia de cada presupuesto y quién aprobó cada cambio.

### 8. ¿Qué tiempos deben controlarse?

**Operaciones:** Primera respuesta, llegada de grúa, revisión de cobertura, asignación, inspección, recepción de presupuesto, autorización y cierre. Cada etapa tiene un compromiso distinto según el tipo de siniestro y la ubicación.

### 9. ¿Qué ocurre cuando un proveedor no responde?

**Operaciones:** Debemos reintentar, escalar o reasignar. El cliente no debería quedar bloqueado porque un proveedor específico falló. Las integraciones deben registrar cada intento y distinguir entre una solicitud aceptada, rechazada o sin respuesta.

### 10. ¿Qué necesita para auditar un caso?

**Operaciones:** Una línea de tiempo completa: quién registró información, qué cambió, qué evidencias se añadieron, qué cobertura se aplicó, qué proveedor actuó, qué presupuesto fue aprobado, qué comunicación recibió el cliente y qué pago se autorizó.

---

## Entrevista 3 — Área crítica: Prevención de Fraude

**Entrevistado:** Martín Quiroz, jefe de Prevención de Fraude  
**Objetivo:** comprender señales de riesgo, tratamiento de alertas y requisitos de explicabilidad.

### 1. ¿Qué significa fraude en este proceso?

**Fraude:** Puede ser un siniestro inventado, daños antiguos presentados como recientes, colusión con talleres, documentos alterados, identidad falsa, exageración del costo o múltiples reclamos por el mismo evento. También existen errores honestos, por eso una inconsistencia no debe producir rechazo automático.

### 2. ¿Qué señales utilizan actualmente?

**Fraude:** Repetición de participantes, vehículos o talleres; pólizas contratadas muy cerca del evento; ubicaciones incoherentes; fotografías reutilizadas; montos atípicos; versiones contradictorias; patrones de contacto compartidos y antecedentes de reclamos. Algunas señales son determinísticas y otras provienen de modelos.

### 3. ¿Qué datos deberían conservarse?

**Fraude:** El contenido original de cada evidencia, su hash, metadatos disponibles, fecha de recepción, fuente, transformaciones realizadas y versiones derivadas. Si una imagen se comprime para la aplicación, no debemos perder el original que puede ser necesario para una investigación.

### 4. ¿Cómo debe tratarse una alerta?

**Fraude:** La alerta necesita tipo, severidad, explicación, datos que la originaron, fecha, modelo o regla utilizada y estado de revisión. Un investigador puede confirmarla, descartarla o pedir más información. Debe quedar la justificación.

### 5. ¿Puede una alerta bloquear el proceso?

**Fraude:** Algunas reglas críticas sí pueden detener temporalmente un pago o derivar el caso. Otras solo aumentan prioridad de revisión. La decisión depende de la combinación de señales y del monto expuesto. Esa política debe ser configurable y versionada.

### 6. ¿Qué espera de la inteligencia artificial?

**Fraude:** Comparación visual de daños, detección de posible reutilización de imágenes, extracción de datos y agrupación de relaciones sospechosas. Necesitamos medir falsos positivos. Un modelo demasiado sensible puede perjudicar a clientes legítimos y saturar a los investigadores.

### 7. ¿Qué acceso requiere su equipo?

**Fraude:** Acceso restringido por rol y necesidad. Un investigador puede consultar información ampliada que un operador regular no debería ver. Las descargas de evidencia y consultas sensibles deben quedar registradas.

### 8. ¿Cómo se relacionan varios casos?

**Fraude:** Un mismo accidente puede involucrar varias pólizas y varios reclamos. También un teléfono, cuenta bancaria, taller o persona puede aparecer en siniestros distintos. Necesitamos relacionarlos sin fusionar incorrectamente los expedientes.

### 9. ¿Qué problemas de calidad de datos enfrentan?

**Fraude:** Nombres escritos de distintas maneras, placas con errores, ubicaciones aproximadas, documentos incompletos y registros duplicados. Debemos conservar el valor declarado y, por separado, el valor normalizado; no reemplazar silenciosamente uno por otro.

### 10. ¿Qué requisito considera innegociable?

**Fraude:** Reproducibilidad. Meses después debemos saber por qué un caso recibió una alerta, incluso si la regla o el modelo ya cambió. Eso exige versiones, datos de entrada y evidencia de la revisión humana.

---

## Evidencias iniciales extraídas de las entrevistas

| Categoría | Elementos mencionados |
|---|---|
| Actores | Asegurado, reportante autorizado, operador, ajustador, investigador de fraude, taller, proveedor de grúa, supervisor |
| Objetos de negocio | Póliza, vehículo, siniestro, participante, cobertura, evidencia, asistencia, inspección, presupuesto, autorización, alerta, pago |
| Eventos posibles | Siniestro reportado, cobertura validada, asistencia solicitada, evidencia recibida, inspección asignada, presupuesto presentado, alerta generada, reparación autorizada, pago emitido |
| Restricciones | Evidencia inmutable, privacidad, trazabilidad, control de pagos duplicados, revisión humana, tolerancia a proveedores externos |
| Incertidumbres | Política exacta de deduplicación, umbrales antifraude, conservación de imágenes, SLA por región, integración con talleres |

## Reto para el equipo

Transformar las entrevistas en una especificación inicial de **Siniestro Fácil**, resolviendo o dejando explícitas las siguientes tensiones:

- rapidez de atención frente a control de fraude;
- experiencia simple frente a evidencia suficiente;
- automatización frente a revisión humana;
- expediente único frente a múltiples participantes y reclamos relacionados;
- almacenamiento de originales frente a versiones optimizadas;
- procesos síncronos de atención frente a coordinaciones asíncronas con terceros.