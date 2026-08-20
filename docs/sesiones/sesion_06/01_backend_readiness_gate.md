# SDD Backend Readiness Gate — Sesión 06

## Objetivo

Determinar si una historia de usuario está suficientemente especificada para entrar a construcción de backend sin que el equipo o la IA inventen decisiones críticas.

## Resultado del gate

Cada historia evaluada debe quedar en uno de estos estados:

- `READY` — puede entrar al sprint.
- `READY_WITH_ASSUMPTIONS` — puede entrar si los supuestos están explícitos, versionados y no afectan reglas críticas.
- `BLOCKED` — falta una decisión crítica y no debe construirse todavía.

## Checklist por historia

### 1. Negocio y alcance

- [ ] La historia pertenece al MVP actual.
- [ ] Actor y objetivo están claros.
- [ ] Existe fuente o evidencia de origen.
- [ ] El resultado esperado es observable.

### 2. Requisitos y reglas

- [ ] Tiene requisitos funcionales trazables.
- [ ] Se identificaron NFR aplicables.
- [ ] Las reglas de negocio necesarias están documentadas.
- [ ] No existen contradicciones entre historia, requisito y regla.

### 3. Criterios de aceptación

- [ ] Existen criterios verificables.
- [ ] Incluyen al menos camino exitoso.
- [ ] Incluyen errores o condiciones relevantes.
- [ ] Pueden transformarse en pruebas.

### 4. Datos y persistencia

- [ ] Las entidades requeridas existen en el modelo.
- [ ] Los atributos necesarios tienen fuente y significado.
- [ ] PK/FK y cardinalidades relevantes están resueltas.
- [ ] Nullability y obligatoriedad pueden justificarse.
- [ ] Las reglas críticas tienen control previsto en BD o aplicación.

### 5. Estados y ciclo de vida

- [ ] Estados involucrados están definidos.
- [ ] Las transiciones necesarias están identificadas.
- [ ] Se conoce qué actor o evento provoca cada transición relevante.

### 6. Integraciones

- [ ] Dependencias externas están identificadas.
- [ ] Entradas y salidas necesarias son conocidas al nivel requerido para el sprint.
- [ ] Reintentos, idempotencia o errores de integración están considerados cuando aplican.

### 7. Preguntas abiertas

- [ ] Las preguntas críticas están resueltas.
- [ ] Las preguntas no críticas están registradas como supuestos o dependencias.
- [ ] Ninguna pregunta abierta obliga a inventar comportamiento de negocio.

### 8. Trazabilidad de construcción

- [ ] Puede trazarse historia → requisito.
- [ ] Puede trazarse requisito → regla/criterio.
- [ ] Puede trazarse regla/criterio → tabla/columna o componente.
- [ ] Puede definirse evidencia de prueba.

## Regla de decisión

### READY

Todos los puntos críticos están resueltos y existe evidencia suficiente para desarrollar y probar.

### READY_WITH_ASSUMPTIONS

Solo existen vacíos no críticos. Cada supuesto debe incluir:

- descripción;
- razón;
- impacto;
- responsable de validar;
- fecha o hito de revisión.

### BLOCKED

La historia queda bloqueada si falta cualquiera de los siguientes:

- regla de negocio crítica;
- estado o transición necesaria;
- criterio de aceptación comprobable;
- dato obligatorio sin definición;
- contrato/integración esencial;
- decisión de seguridad o autorización indispensable.

## Matriz mínima de salida

| Historia | RF | Regla | Criterio | Datos/Tablas | Estado Gate | Bloqueo/Supuesto |
|---|---|---|---|---|---|---|
| HU-xx | RF-xx | RN-xx | CA-xx | tabla.columna | READY/BLOCKED | detalle |

## Aplicación a Siniestro Fácil

Ejemplos de historias candidatas:

1. Registrar un siniestro.
2. Consultar el siniestro y su estado.
3. Adjuntar evidencia.
4. Registrar presupuesto de taller.

Cada equipo debe seleccionar al menos una historia y demostrar por qué puede o no entrar al sprint.

## Principio docente

> El gate no busca burocracia. Busca detectar la ambigüedad cuando todavía cuesta minutos corregirla, no cuando ya se convirtió en código, datos y pruebas inconsistentes.
