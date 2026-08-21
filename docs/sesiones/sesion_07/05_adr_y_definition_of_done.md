# ADR y Definition of Done — Sesión 07

## Objetivo

Cerrar la Sesión 07 con decisiones de arquitectura explícitas, revisables y trazables, evitando que la arquitectura quede implícita dentro del código generado por IA.

---

# 1. Plantilla ADR DMC

```markdown
# ADR-XXX — Título de la decisión

## Estado
Proposed | Accepted | Superseded | Rejected

## Contexto
¿Qué problema o driver obliga a tomar una decisión?

## Fuentes
- HU:
- RF:
- RNF:
- Regla:
- Restricción:

## Decisión
¿Qué se decide exactamente?

## Alternativas consideradas
1. Alternativa A
2. Alternativa B
3. Alternativa C

## Consecuencias positivas
-

## Consecuencias negativas / trade-offs
-

## Riesgos
-

## Evidencia / validación requerida
-

## Impacto
- Backend:
- Datos:
- GCP:
- Seguridad:
- Operación:

## Fecha / versión
-
```

---

# 2. ADR mínimos de la sesión

## ADR-001 — Cloud Run como runtime del backend

### Preguntas que debe responder

- ¿el workload es HTTP y stateless?
- ¿puede ejecutarse en múltiples instancias?
- ¿qué implica la concurrencia?
- ¿cómo se controla min/max instances?
- ¿qué impacto tiene el scaling sobre Cloud SQL?
- ¿cómo se maneja configuración y secretos?

### Evidencia esperada

- diagrama;
- lineamiento stateless;
- estrategia de conexión;
- prueba local/containerizable o backlog de validación.

---

## ADR-002 — Modular Monolith antes de Microservices

### Preguntas que debe responder

- ¿qué driver justificaría microservicios?
- ¿existe hoy ese driver?
- ¿qué costo operativo evitaríamos?
- ¿cómo preservamos límites de dominio sin despliegue distribuido?
- ¿qué condición futura obligaría a revisar el ADR?

### Evidencia esperada

- módulos definidos;
- dependencias permitidas/prohibidas;
- arquitectura interna Mermaid.

---

## ADR-003 — Cloud Storage para evidencia y PostgreSQL para metadata

### Preguntas que debe responder

- ¿por qué separar archivo y metadata?
- ¿qué metadata necesita trazabilidad?
- ¿qué ocurre ante carga incompleta?
- ¿cómo evitamos objetos huérfanos?
- ¿cómo se controla acceso?
- ¿cómo se valida integridad/hash?

### Evidencia esperada

- flujo de carga;
- responsabilidades Storage vs PostgreSQL;
- riesgos abiertos registrados.

---

# 3. ADR opcionales si el backend ya los necesita

- `ADR-004-error-model.md` — contrato uniforme de errores.
- `ADR-005-idempotency.md` — estrategia para requests repetidos.
- `ADR-006-transaction-boundaries.md` — límites transaccionales por caso de uso.
- `ADR-007-observability-context.md` — correlation/request/business IDs.

No deben crearse ADR vacíos “por completar carpeta”. Solo decisiones reales.

---

# 4. Definition of Done — Arquitectura Sesión 07

## A. Trazabilidad

- [ ] cada driver tiene fuente en Specification o decisión aprobada;
- [ ] cada componente GCP tiene un driver o riesgo asociado;
- [ ] las decisiones críticas tienen ADR;
- [ ] preguntas no resueltas permanecen visibles;
- [ ] no se inventaron requisitos para justificar tecnología.

## B. Arquitectura interna

- [ ] API/controller separado de negocio;
- [ ] casos de uso identificables;
- [ ] dominio independiente de framework/GCP/ORM;
- [ ] persistencia detrás de port/repository;
- [ ] integraciones detrás de adapters;
- [ ] dirección de dependencias revisada;
- [ ] estructura permite pruebas aisladas.

## C. Cloud-native readiness

- [ ] backend diseñado como stateless;
- [ ] no depende de disco local persistente;
- [ ] configuración externalizada;
- [ ] secretos fuera de código;
- [ ] identidad del workload prevista;
- [ ] concurrencia considerada;
- [ ] impacto de autoscaling sobre DB considerado;
- [ ] estrategia de observabilidad mínima definida.

## D. Architecture Review

- [ ] prompt ATLAS versionado;
- [ ] review ejecutado sobre código real;
- [ ] hallazgos clasificados por severidad;
- [ ] recomendaciones sin fundamento fueron rechazadas;
- [ ] hallazgos CRITICAL/HIGH convertidos en backlog;
- [ ] existe decisión `GO`, `GO_WITH_REFACTOR` o `NO_GO`.

## E. Architecture Challenges

- [ ] se analizó pico de carga;
- [ ] se analizó fallo parcial de evidencia o dependencia;
- [ ] se identificó cómo detectar el fallo;
- [ ] se documentó al menos una mejora o pregunta derivada.

## F. Evidencia

- [ ] diagramas versionados;
- [ ] ADR versionados;
- [ ] backlog de refactor versionado;
- [ ] evidencia del review versionada;
- [ ] Specification actualizada cuando corresponda.

---

# 5. Criterio de aprobación

## GO

No existen hallazgos críticos sin resolver y el backend puede continuar bajo los lineamientos definidos.

## GO_WITH_REFACTOR

La arquitectura objetivo está aprobada, pero existen hallazgos HIGH que deben convertirse en tareas tempranas del siguiente sprint.

## NO_GO

Existen hallazgos críticos que afectan seguridad, integridad, trazabilidad o viabilidad cloud y continuar generando código aumentaría deuda o riesgo.

---

# 6. Preguntas de defensa oral

Cada equipo debe poder responder sin consultar a la IA:

1. ¿Qué RNF influyó más en la arquitectura?
2. ¿Por qué Cloud Run es adecuado para este backend?
3. ¿Por qué no usamos microservicios todavía?
4. ¿Qué parte del sistema conservaría estado y cuál no?
5. ¿Qué ocurre si Cloud Run escala y Cloud SQL no puede aceptar más conexiones?
6. ¿Dónde viven los archivos de evidencia y dónde su metadata?
7. ¿Cómo evitamos secretos en Git?
8. ¿Qué hallazgo de ATLAS decidieron no aceptar y por qué?
9. ¿Qué decisión arquitectónica podría cambiar en el futuro?
10. ¿Qué evidencia demuestra que la arquitectura no es solo un diagrama?

## Idea fuerza

> Una arquitectura no queda aprobada porque el diagrama se vea correcto. Queda aprobada cuando sus decisiones pueden trazarse, cuestionarse, probarse y defenderse.
