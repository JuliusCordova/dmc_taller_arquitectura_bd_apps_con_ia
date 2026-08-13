# Sesión 04 — Reto final y autoevaluación

## Reto: romper un modelo incorrecto

El objetivo es demostrar criterio de modelado. No se evalúa quién dibuja más rápido, sino quién detecta mejor los errores y puede justificarlos con reglas del negocio.

## Modelo propuesto

```text
Cliente
   ↓
Email
   ↓
Pedido
   ↓
Estado
   ↓
Producto
```

## Parte 1 — Auditoría individual

Detecta al menos 5 problemas.

Para cada problema completa:

| # | Hallazgo | Por qué es un problema | Cómo lo corregirías | ¿Qué evidencia necesitas? |
|---:|---|---|---|---|
| 1 |  |  |  |  |
| 2 |  |  |  |  |
| 3 |  |  |  |  |
| 4 |  |  |  |  |
| 5 |  |  |  |  |

## Preguntas guía

1. ¿Email tiene identidad propia?
2. ¿Estado debe ser una entidad?
3. ¿Qué verbo debería relacionar Cliente y Pedido?
4. ¿Qué cardinalidades faltan?
5. ¿Producto está conectado correctamente con Pedido?
6. ¿Existe una N:M oculta?
7. ¿Qué parte del modelo es evidencia y qué parte parece una inferencia?
8. ¿Hay algo que ya pertenece al modelo lógico o físico?

---

# Parte 2 — Reconstrucción

Corrige el modelo manteniéndote exclusivamente en nivel conceptual.

Tu modelo debe mostrar:

- entidades justificadas;
- relaciones con verbo;
- cardinalidades sustentadas;
- preguntas donde no exista evidencia.

No uses tipos SQL, PK/FK ni nombres de tecnología.

---

# Parte 3 — Auditoría con ATLAS

Usa el Prompt ATLAS desarrollado durante la sesión para auditar tu propia propuesta.

La IA debe buscar:

- entidades sin fuente;
- atributos disfrazados de entidades;
- estados disfrazados de entidades;
- relaciones sin verbo;
- cardinalidades inventadas;
- decisiones técnicas prematuras.

Registra al menos una observación de la IA que aceptaste y una que rechazaste.

| Recomendación IA | Aceptada / Rechazada | Justificación |
|---|---|---|
|  |  |  |

---

# Autoevaluación

Puntúa cada criterio de 0 a 2:

- 0 = no logrado;
- 1 = parcialmente logrado;
- 2 = logrado y defendible.

| Criterio | 0–2 | Evidencia |
|---|---:|---|
| Identifico entidades sin convertir todos los sustantivos en cajas |  |  |
| Distingo entidad, atributo, estado y evento |  |  |
| Uso verbos para las relaciones |  |  |
| Justifico cardinalidad mínima y máxima |  |  |
| Identifico opcionalidad |  |  |
| Detecto relaciones N:M |  |  |
| Distingo modelo conceptual, lógico y físico |  |  |
| Mantengo trazabilidad con la Specification |  |  |
| Uso ATLAS para controlar la generación de IA |  |  |
| Convierto dudas en preguntas abiertas en lugar de inventar |  |  |

## Interpretación

- **17–20:** listo para avanzar al modelo lógico.
- **13–16:** buen dominio, revisar conceptos puntuales.
- **9–12:** requiere repetir ejercicios de cardinalidad y clasificación.
- **0–8:** revisar fundamentos antes de pasar a la siguiente sesión.

---

# Evidencia final de la sesión

Antes de cerrar, confirma que tu equipo dejó:

```text
docs/modelos/
├── 01_glosario_dominio.md
├── 02_entidades_candidatas.md
├── 03_modelo_conceptual.md
├── 04_preguntas_cardinalidad.md
├── 05_trazabilidad_modelo.md
└── modelo_conceptual.mmd

docs/prompts/
└── prompt_atlas_modelado_conceptual_v1.md
```

## Reflexión final

Responde en máximo 5 líneas:

> ¿Qué decisión de modelado parecía obvia al inicio, pero cambió cuando revisaste la evidencia o la cardinalidad?

La sesión termina cuando puedes explicar el modelo en lenguaje de negocio y señalar claramente qué está confirmado y qué sigue pendiente.
