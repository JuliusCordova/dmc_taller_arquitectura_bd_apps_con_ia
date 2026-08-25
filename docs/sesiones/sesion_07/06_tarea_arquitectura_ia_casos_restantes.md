# Tarea Sesión 07 — Diseñar arquitectura cloud-native con IA para los casos restantes

## Propósito

Aplicar los principios de arquitectura de software cloud-native vistos en la Sesión 07 a un caso de uso distinto de Siniestro Fácil, utilizando IA como copiloto de arquitectura y manteniendo la DMC Application Specification como fuente de verdad.

La tarea busca demostrar que el alumno no copia una arquitectura de referencia, sino que puede derivar decisiones arquitectónicas a partir de requisitos funcionales, requisitos no funcionales, reglas, patrones de acceso, integraciones y riesgos del caso asignado.

## Casos de uso

Cada equipo debe trabajar con uno de los dos casos restantes del programa:

1. **Banca — Crédito Ágil 360**
   - Fuente principal: `casos_de_uso/01_banca_credito_agil_360.md`
   - Usar además la Specification, historias, requisitos y artefactos disponibles en el repositorio para este caso.

2. **Retail — Stock Único**
   - Fuente principal: `casos_de_uso/03_retail_stock_unico.md`
   - Usar además la Specification, historias, requisitos y artefactos disponibles en el repositorio para este caso.

## Consigna

A partir del SDD del caso asignado, utilizar ATLAS para diseñar una arquitectura de software cloud-native para el MVP.

La IA puede proponer la arquitectura, pero cada componente debe justificarse mediante al menos uno de estos elementos:

- requisito funcional;
- requisito no funcional;
- regla de negocio;
- patrón de acceso;
- integración;
- necesidad de seguridad;
- necesidad de observabilidad;
- necesidad de resiliencia;
- necesidad explícita de escalabilidad o rendimiento.

No se acepta una arquitectura basada únicamente en recomendaciones genéricas de la IA.

## Nube objetivo

El equipo puede elegir una de las siguientes nubes:

- Google Cloud;
- Microsoft Azure;
- AWS.

La arquitectura debe mantener coherencia tecnológica dentro del proveedor elegido.

## Entregables obligatorios

### 1. Architecture Drivers

Identificar y priorizar los drivers que condicionan la arquitectura:

- RF relevantes;
- RNF relevantes;
- restricciones;
- integraciones;
- riesgos;
- patrones de carga;
- volumen o concurrencia cuando esté documentado;
- seguridad y privacidad;
- disponibilidad y recuperación cuando corresponda.

### 2. Arquitectura lógica

Representar al menos:

- API / entrada;
- Application / casos de uso;
- Domain;
- Infrastructure;
- persistencia;
- integraciones;
- componentes transversales.

El dominio no debe depender directamente del proveedor cloud.

### 3. Arquitectura cloud

Diseñar la arquitectura usando servicios del proveedor seleccionado.

Cada servicio debe responder a un driver documentado. Evitar microservicios por defecto; si se proponen, deben justificarse por límites de dominio, autonomía, escalabilidad independiente, aislamiento o una necesidad equivalente sustentada.

### 4. Diagrama de arquitectura

Entregar un diagrama visual con iconografía del proveedor cloud seleccionado.

El diagrama debe mostrar como mínimo:

- entrada de usuario o canal;
- backend / compute;
- persistencia;
- almacenamiento de objetos si aplica;
- integración síncrona o asíncrona si aplica;
- identidad y secretos;
- observabilidad;
- principales flujos.

### 5. Matriz de trazabilidad arquitectónica

Formato mínimo:

| Driver / fuente | Decisión | Componente | Justificación | Riesgo / trade-off | Validación |
|---|---|---|---|---|---|
| RNF-XX | Backend stateless | Cloud Run / Container Apps / Fargate | Escalabilidad horizontal | Presión de conexiones | Prueba de concurrencia |

Cada fila debe poder rastrearse al SDD.

### 6. Tres ADR mínimos

Crear al menos tres Architecture Decision Records. Como referencia:

- ADR-001 — elección de compute;
- ADR-002 — modular monolith vs microservicios;
- ADR-003 — decisión de persistencia, integración o almacenamiento.

Cada ADR debe incluir:

- contexto;
- decisión;
- alternativas consideradas;
- consecuencias positivas;
- consecuencias negativas;
- drivers que justifican la decisión.

### 7. Architecture Challenge

Pedir a la IA que intente romper la arquitectura con al menos cinco escenarios realistas.

Ejemplos posibles, solo cuando sean pertinentes al caso:

- aumento abrupto de carga;
- caída temporal de base de datos;
- integración externa indisponible;
- operación duplicada;
- dos usuarios actualizando simultáneamente;
- evento duplicado;
- secreto comprometido;
- pérdida de conectividad;
- archivo demasiado grande;
- degradación de latencia.

Para cada escenario documentar:

`escenario → impacto → protección actual → gap → mejora propuesta → prueba`

### 8. Crítica de la propuesta de IA

El equipo debe identificar al menos una recomendación de la IA que haya rechazado o modificado.

Explicar:

- qué recomendó la IA;
- por qué parecía razonable;
- qué driver o restricción la contradijo;
- qué decisión tomó finalmente el equipo.

## Prompt ATLAS base

```text
ACTOR
Actúa como arquitecto de software cloud-native senior especializado en Spec-Driven Development.

TAREA
Analiza el SDD del caso asignado y diseña una arquitectura de software que permita implementar su MVP.

LÍMITES
- No inventes funcionalidades ni requisitos.
- No agregues servicios cloud sin justificar qué driver resuelven.
- No propongas microservicios por defecto.
- No acoples el dominio al proveedor cloud.
- Si una decisión no puede sustentarse con el SDD, márcala como pregunta abierta o supuesto explícito.

AUTOVALIDACIÓN
Para cada decisión comprueba la cadena:
RF/RNF → Driver → Decisión arquitectónica → Componente → Riesgo → Validación

Evalúa además:
- disponibilidad;
- escalabilidad;
- seguridad;
- persistencia;
- observabilidad;
- integración;
- resiliencia;
- costo y complejidad operacional.

SALIDA
1. Drivers arquitectónicos.
2. Arquitectura lógica.
3. Arquitectura cloud.
4. Componentes y responsabilidades.
5. Diagrama Mermaid.
6. Matriz de trazabilidad.
7. Tres ADR.
8. Cinco escenarios de fallo.
9. Recomendaciones de refinamiento.
10. Decisión final de arquitectura.
```

## Regla de defensa

No se acepta un componente que el equipo no pueda explicar en aproximadamente 30 segundos indicando:

1. qué problema resuelve;
2. qué driver lo justifica;
3. qué alternativa se descartó;
4. qué riesgo introduce.

Además, cada equipo deberá explicar por qué **no** utilizó al menos una tecnología o patrón recomendado inicialmente por la IA.

## Estructura esperada de evidencias

```text
evidence/session_07/<caso>/
├── architecture_drivers.md
├── architecture_logical.md
├── architecture_cloud.md
├── architecture_diagram.png
├── traceability_matrix.md
├── adr/
│   ├── ADR-001.md
│   ├── ADR-002.md
│   └── ADR-003.md
├── atlas_prompt.md
├── ai_first_proposal.md
├── architecture_challenge.md
├── architecture_review.md
└── final_decision.md
```

## Criterios de evaluación

| Criterio | Peso |
|---|---:|
| Trazabilidad SDD → arquitectura | 30% |
| Calidad de las decisiones arquitectónicas | 25% |
| Diagrama y claridad de comunicación | 20% |
| Architecture Challenge y análisis de fallos | 15% |
| Crítica y refinamiento de la propuesta de IA | 10% |

## Definition of Done

La tarea se considera completa cuando:

- [ ] el caso y la nube están identificados;
- [ ] los architecture drivers tienen fuente en el SDD;
- [ ] existe arquitectura lógica;
- [ ] existe arquitectura cloud;
- [ ] el diagrama utiliza componentes coherentes con el proveedor elegido;
- [ ] cada componente relevante tiene justificación trazable;
- [ ] existen al menos tres ADR;
- [ ] existen al menos cinco escenarios de ruptura;
- [ ] se documentó al menos una recomendación de IA rechazada o modificada;
- [ ] se actualizó el Spec cuando la arquitectura reveló una decisión, supuesto o pregunta nueva;
- [ ] todos los artefactos y evidencias quedaron versionados en GitHub.

## Mensaje clave

> La IA puede proponer una arquitectura. El alumno debe demostrar por qué esa arquitectura merece ser construida.
