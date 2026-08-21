# Prompts ATLAS — Architecture Review

## Propósito

Usar ATLAS no solo como generador de código, sino como revisor de arquitectura, detector de decisiones implícitas y asistente para refactorizar el backend de Siniestro Fácil sin romper la Specification.

---

## Prompt 1 — Extraer architecture drivers

### Actor

Actúa como arquitecto de software cloud-native y especialista en Spec-Driven Development.

### Tarea

Analiza la Specification de Siniestro Fácil y extrae los architecture drivers que deben condicionar el backend y su futuro despliegue en Google Cloud.

### Límites

- No inventes requisitos.
- Distingue RF, RNF, regla, restricción y supuesto.
- No selecciones un servicio GCP si todavía no existe un driver que lo justifique.
- Marca como pregunta abierta cualquier decisión sin evidencia suficiente.

### Autovalidación

Para cada driver confirma:

```text
Fuente
→ Driver
→ Riesgo
→ Decisión requerida
→ Evidencia esperada
```

### Salida

Tabla:

| Fuente | Driver | Riesgo | Decisión a evaluar | Evidencia |
|---|---|---|---|---|

Luego clasifica drivers en `CRITICAL`, `HIGH`, `MEDIUM` o `LOW`.

---

## Prompt 2 — Diseñar arquitectura interna

### Actor

Actúa como software architect con experiencia en arquitectura limpia, hexagonal y sistemas cloud-native.

### Tarea

Propón la estructura interna del backend de Siniestro Fácil a partir de las historias READY y los drivers aprobados.

### Límites

- El dominio no puede depender de HTTP, ORM, PostgreSQL ni Google Cloud.
- No introduzcas microservicios sin un driver explícito.
- No inventes módulos de negocio.
- No generes código completo todavía.

### Autovalidación

Verifica:

- separación API / application / domain / infrastructure;
- dirección de dependencias;
- responsabilidades sin duplicidad;
- puertos necesarios;
- adaptadores necesarios;
- límites transaccionales candidatos;
- trazabilidad con historias y reglas.

### Salida

1. estructura propuesta de carpetas;
2. responsabilidades por capa;
3. dependencias permitidas y prohibidas;
4. puertos/adaptadores;
5. diagrama Mermaid;
6. riesgos y preguntas abiertas.

---

## Prompt 3 — Mapear arquitectura a GCP

### Actor

Actúa como Google Cloud solution architect y revisor de arquitectura de aplicaciones.

### Tarea

Mapea las responsabilidades del backend de Siniestro Fácil a una arquitectura GCP mínima y justificable.

### Límites

- Favorece servicios administrados cuando sean adecuados.
- No agregues GKE, microservicios, caches, colas o gateways sin un requisito o riesgo que lo justifique.
- Cloud Run debe tratarse como runtime stateless.
- Mantén separado el diseño lógico del diseño de infraestructura.

### Autovalidación

Por cada componente responde:

```text
Driver
→ Servicio / patrón
→ Responsabilidad
→ Riesgo introducido
→ Mitigación
→ Evidencia futura
```

### Salida

1. tabla de decisiones;
2. arquitectura Mermaid;
3. responsabilidades por servicio;
4. componentes descartados y motivo;
5. ADR necesarios.

---

## Prompt 4 — Architecture Review del backend actual

### Actor

Actúa como principal software architect independiente del equipo que generó el backend.

### Tarea

Audita el backend actual de Siniestro Fácil contra la Specification y los lineamientos de arquitectura de la Sesión 07.

### Límites

- No evalúes por preferencias personales de estilo.
- No propongas tecnologías nuevas si no resuelven un driver.
- No aceptes decisiones sin trazabilidad.
- No corrijas silenciosamente vacíos de Specification.

### Autovalidación

Busca de forma explícita:

- SQL en controller;
- reglas de negocio en capa API;
- dominio acoplado a framework, ORM o GCP;
- dependencias invertidas incorrectamente;
- secretos o configuración hardcoded;
- estado persistente en memoria local;
- ausencia de timeout;
- retry peligroso;
- falta de idempotencia;
- límites transaccionales difusos;
- logs insuficientes o con datos sensibles;
- componente cloud sin driver;
- acoplamiento que impida pruebas.

### Salida

| Severidad | Hallazgo | Evidencia | Driver/Regla afectado | Riesgo | Corrección |
|---|---|---|---|---|---|

Finaliza con `GO`, `GO_WITH_REFACTOR` o `NO_GO` para continuar el sprint.

---

## Prompt 5 — Break the architecture

### Actor

Actúa como reliability engineer y adversarial architecture reviewer.

### Tarea

Diseña escenarios capaces de romper la arquitectura propuesta de Siniestro Fácil.

### Límites

- No inventes amenazas irreales.
- Prioriza escenarios derivados de los RNF, integraciones y decisiones reales.
- No propongas todavía la solución.

### Autovalidación

Incluye al menos escenarios sobre:

- múltiples requests simultáneos;
- duplicidad;
- caída o latencia de PostgreSQL;
- agotamiento de conexiones;
- caída de una integración;
- archivo de evidencia incompleto;
- instancia Cloud Run terminada;
- secreto ausente/incorrecto;
- pico de tráfico;
- error no observable.

### Salida

Tabla:

| Escenario | Componente | Síntoma esperado | Impacto | Cómo detectarlo | Evidencia requerida |
|---|---|---|---|---|---|

---

## Prompt 6 — Refactor controlado

### Actor

Actúa como tech lead encargado de ejecutar refactor arquitectónico sin cambiar comportamiento funcional no autorizado.

### Tarea

A partir de hallazgos `CRITICAL` y `HIGH`, propone un backlog de refactor para llevar el backend al baseline arquitectónico aprobado.

### Límites

- No agregues funcionalidades.
- No cambies contratos sin una decisión registrada.
- No cambies el modelo de datos sin ADR/Specification.
- Separa refactor estructural de cambios funcionales.

### Autovalidación

Cada tarea debe tener:

- hallazgo fuente;
- archivos afectados;
- resultado esperado;
- prueba de no regresión;
- evidencia.

### Salida

| Orden | Hallazgo | Refactor | Archivos | Prueba | Evidencia | Bloqueante |
|---|---|---|---|---|---|---|

---

## Secuencia recomendada

```text
Specification
      ↓
Prompt 1 · Drivers
      ↓
Prompt 2 · Arquitectura interna
      ↓
Prompt 3 · Arquitectura GCP
      ↓
Backend existente
      ↓
Prompt 4 · Architecture Review
      ↓
Prompt 5 · Break
      ↓
Prompt 6 · Refactor backlog
      ↓
ADR + Spec + Evidencia
```

## Idea fuerza

> ATLAS no decide la arquitectura por nosotros. Hace explícitas las decisiones, busca contradicciones y obliga a demostrar la trazabilidad antes de aceptar código generado por IA.
