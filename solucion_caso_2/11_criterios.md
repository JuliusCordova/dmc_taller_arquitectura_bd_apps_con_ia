# Criterios de aceptación — Siniestro Fácil

> Los criterios se redactan como resultados observables. Cuando la entrevista no define una regla necesaria para decidir el resultado esperado, el criterio se limita a comprobar el comportamiento confirmado y remite la definición faltante a `12_preguntas.md`.

## CA-01 — Crear reporte con información mínima

**Dado** un reportante que dispone de los datos mínimos indicados por Operaciones, **cuando** inicia un reporte, **entonces** el caso puede crearse sin exigir universalmente toda la evidencia adicional.

Datos mínimos: número de póliza o documento del asegurado, placa, fecha, ubicación aproximada, tipo de evento y medio de contacto.

**Fuentes:** OPERACIONES-02; asociado a RF-04 y RF-06.

## CA-02 — Reporte por persona autorizada

**Dado** que una persona ha sido reconocida como reportante autorizado, **cuando** el titular no puede realizar el reporte, **entonces** esa persona puede iniciar el caso.

**Fuente:** CEO-06; asociado a RF-02.

> La forma de reconocer la autorización no está definida.

## CA-03 — Registro de datos del evento

**Dado** un reporte en curso, **cuando** se incorporan datos del accidente, **entonces** el expediente permite registrar fecha, hora, ubicación, personas involucradas, descripción y daños aparentes.

**Fuente:** OPERACIONES-01; asociado a RF-05.

## CA-04 — Evidencia vinculada al siniestro

**Dado** un siniestro existente, **cuando** se recibe una evidencia, **entonces** queda vinculada al siniestro y al momento de captura y, cuando estén disponibles, a ubicación y dispositivo.

**Fuente:** OPERACIONES-03; asociado a RF-12.

## CA-05 — Preservación de original

**Dado** un archivo de evidencia original, **cuando** se genera una transformación o versión optimizada, **entonces** el original permanece conservado y distinguible de la versión derivada.

**Fuente:** FRAUDE-03; asociado a RF-13 y RNF-04.

## CA-06 — Metadatos de evidencia

**Dado** que una evidencia fue recibida, **cuando** se consulta su trazabilidad, **entonces** pueden identificarse su hash, metadatos disponibles, fecha de recepción, fuente, transformaciones y versiones derivadas.

**Fuente:** FRAUDE-03; asociado a RF-14.

## CA-07 — Reasignación con historial

**Dado** un caso ya asignado, **cuando** se reasigna, **entonces** el historial conserva la asignación previa y la razón de la reasignación.

**Fuente:** OPERACIONES-05; asociado a RF-18.

## CA-08 — Solicitud a proveedor trazable

**Dado** que se solicita asistencia a un proveedor, **cuando** el proveedor acepta, rechaza o no responde, **entonces** el intento queda registrado con uno de esos resultados distinguibles.

**Fuente:** OPERACIONES-09; asociado a RF-09.

## CA-09 — Proveedor sin respuesta

**Dado** que un proveedor no responde, **cuando** Operaciones continúa la gestión, **entonces** el sistema permite registrar un reintento, escalamiento o reasignación sin obligar a mantener el caso bloqueado por ese proveedor específico.

**Fuente:** OPERACIONES-09; asociado a RF-10 y RNF-08.

## CA-10 — Presupuesto y aprobaciones

**Dado** un presupuesto presentado por un taller, **cuando** se consulta el expediente, **entonces** se puede identificar su vigencia y, para cada cambio aprobado, quién realizó la aprobación.

**Fuente:** OPERACIONES-07; asociado a RF-19, RF-20 y RF-22.

## CA-11 — Visibilidad de avance al asegurado

**Dado** un asegurado con un siniestro registrado, **cuando** consulta el caso, **entonces** puede conocer su avance y el siguiente paso sin que sea necesario exponer los subestados internos que Operaciones determine como no visibles.

**Fuentes:** CEO-03, CEO-06; OPERACIONES-04; asociado a RF-16, RF-23 y RF-25.

> El mapeo exacto entre estados internos y estados visibles está pendiente.

## CA-12 — Alerta explicable

**Dado** que se genera una alerta, **cuando** un investigador la consulta, **entonces** puede identificar tipo, severidad, explicación, datos que la originaron, fecha, modelo o regla y estado de revisión.

**Fuente:** FRAUDE-04; asociado a RF-26 y RNF-11.

## CA-13 — Revisión humana de alerta

**Dado** una alerta pendiente de revisión, **cuando** un investigador la revisa, **entonces** puede confirmarla, descartarla o solicitar más información y la justificación queda registrada.

**Fuente:** FRAUDE-04; asociado a RF-27.

## CA-14 — Una alerta no equivale a fraude confirmado

**Dado** que existe una alerta o inconsistencia, **cuando** el sistema la presenta, **entonces** la existencia de la alerta se distingue de una conclusión confirmada de fraude y permanece disponible para revisión humana.

**Fuentes:** FRAUDE-01, FRAUDE-04; CEO-08; asociado a RF-29 y RNF-12.

## CA-15 — Política antifraude versionada

**Dado** que una política de tratamiento de alertas ha cambiado, **cuando** se revisa una alerta histórica, **entonces** puede identificarse la versión de política/regla/modelo aplicable al momento en que fue generada.

**Fuentes:** FRAUDE-05, FRAUDE-10; asociado a RF-28 y RF-34.

## CA-16 — Casos relacionados sin fusión

**Dado** dos o más expedientes con un elemento relacionado, **cuando** se registra la relación, **entonces** los expedientes siguen siendo identificables como casos separados.

**Fuente:** FRAUDE-08; asociado a RF-30.

## CA-17 — Valor declarado y normalizado

**Dado** un dato que requiere normalización, **cuando** se guarda el valor normalizado, **entonces** el valor originalmente declarado continúa disponible por separado.

**Fuente:** FRAUDE-09; asociado a RF-31 y RNF-14.

## CA-18 — Auditoría del expediente

**Dado** un expediente con actividad registrada, **cuando** un actor autorizado consulta su línea de tiempo, **entonces** puede identificar quién registró información, qué cambió, qué evidencias se añadieron, qué cobertura se aplicó, qué proveedor actuó, qué presupuesto fue aprobado, qué comunicación recibió el cliente y qué pago se autorizó, en los casos donde dichos eventos existan.

**Fuente:** OPERACIONES-10; asociado a RF-32.

## CA-19 — Auditoría de acceso sensible

**Dado** que un usuario autorizado descarga evidencia o realiza una consulta sensible, **cuando** la acción se completa, **entonces** queda un registro auditable de dicha acción.

**Fuente:** FRAUDE-07; asociado a RF-33 y RNF-03.

## CA-20 — Reproducibilidad histórica de alerta

**Dado** una alerta histórica, **cuando** se investiga posteriormente aunque la regla o modelo haya cambiado, **entonces** se puede recuperar la versión utilizada, los datos de entrada conservados y la evidencia de la revisión humana correspondiente.

**Fuente:** FRAUDE-10; asociado a RF-34 y RNF-07.

## Criterios que no pueden cerrarse aún

No se fijan criterios numéricos de tiempo, disponibilidad, capacidad, falsos positivos, tamaño de evidencia, retención o umbrales de fraude porque la entrevista no proporciona esos valores. Tampoco se fijan criterios definitivos para deduplicación, clasificación simple/complejo, reglas de cobertura ni autorización del reportante porque las políticas correspondientes siguen abiertas.
