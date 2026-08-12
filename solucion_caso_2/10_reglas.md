# Reglas de negocio — Siniestro Fácil

> Solo se registran reglas confirmadas por la entrevista. Las políticas incompletas no se completan mediante supuestos.

## RB-01 — Alcance inicial por tipo de siniestro
El flujo inicial de Siniestro Fácil se concentra en siniestros vehiculares de daños materiales sin lesiones graves, para clientes directos y pólizas vigentes.

**Fuente:** CEO-05.

## RB-02 — Derivación de casos especializados
Los casos con heridos, fallecidos, procesos legales o daños masivos deben continuar por rutas especializadas.

**Fuente:** CEO-05.

## RB-03 — Evidencia no necesariamente completa al crear el caso
No siempre se debe exigir toda la evidencia al inicio, especialmente si el cliente está en una situación de riesgo.

**Fuente:** OPERACIONES-02.

## RB-04 — Factores de asignación
La asignación depende de ciudad, tipo de daño, severidad, cobertura, disponibilidad de proveedores y señales de riesgo.

**Fuente:** OPERACIONES-05.

## RB-05 — Tratamiento según complejidad
Los casos simples pueden seguir un flujo digital; los casos complejos requieren ajustador.

**Fuente:** OPERACIONES-05.

> La clasificación exacta de “simple” y “complejo” no está definida.

## RB-06 — Reasignación trazable
Toda reasignación debe conservar historial y razón.

**Fuente:** OPERACIONES-05.

## RB-07 — Presupuesto auditable
Debe poder conocerse la vigencia de cada presupuesto y quién aprobó cada cambio.

**Fuente:** OPERACIONES-07.

## RB-08 — Proveedor no bloqueante
Si un proveedor no responde, la operación debe poder reintentar, escalar o reasignar; el cliente no debe quedar bloqueado por la falla de un proveedor específico.

**Fuente:** OPERACIONES-09.

## RB-09 — Evidencia original preservada
El contenido original de cada evidencia debe conservarse incluso si se genera una versión comprimida o transformada.

**Fuente:** FRAUDE-03.

## RB-10 — Alerta no equivale a fraude
Una inconsistencia o alerta no debe producir por sí sola la conclusión de fraude ni rechazo automático.

**Fuentes:** FRAUDE-01, FRAUDE-04; CEO-08.

## RB-11 — Revisión de alertas
Un investigador puede confirmar una alerta, descartarla o solicitar más información y debe quedar registrada la justificación.

**Fuente:** FRAUDE-04.

## RB-12 — Tratamiento diferenciado de alertas
Algunas reglas críticas pueden detener temporalmente un pago o derivar el caso; otras solo aumentan la prioridad de revisión.

**Fuente:** FRAUDE-05.

## RB-13 — Política antifraude configurable y versionada
La política que determina el efecto de las alertas debe ser configurable y versionada.

**Fuente:** FRAUDE-05.

## RB-14 — Acceso de fraude restringido
El acceso ampliado para investigadores debe restringirse por rol y necesidad.

**Fuente:** FRAUDE-07.

## RB-15 — Relaciones sin fusión automática
Casos relacionados mediante accidente, persona, vehículo, taller, teléfono, cuenta bancaria u otro vínculo deben poder relacionarse sin fusionarse incorrectamente.

**Fuente:** FRAUDE-08.

## RB-16 — Valor declarado separado del normalizado
El valor declarado debe conservarse por separado del valor normalizado; la normalización no debe sustituir silenciosamente el dato original.

**Fuente:** FRAUDE-09.

## RB-17 — Reproducibilidad
Debe poder determinarse meses después por qué un caso recibió una alerta, aun si la regla o modelo cambió.

**Fuente:** FRAUDE-10.

## Políticas mencionadas pero no definidas

No se convierten en reglas concretas por falta de información:

- política exacta de deduplicación;
- umbrales antifraude;
- combinaciones de señales y monto expuesto que determinan bloqueo o derivación;
- conservación temporal de imágenes/evidencias;
- SLA por región/tipo de siniestro;
- clasificación exacta de casos simples, complejos y riesgosos;
- reglas detalladas de cobertura y deducible;
- mecanismo de autorización de un reportante distinto del titular.
