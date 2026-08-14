# Sesión 04 — Del negocio al modelo de datos con IA

## Modelo conceptual, DER y visión del modelo lógico y físico

## Propósito

Profundizar en el modelado de datos como puente entre la DMC Application Specification y la futura implementación de la base de datos.

La sesión conecta directamente con la Sesión 03 de Prompt Engineering ATLAS. El alumno ya aprendió a controlar el trabajo de la IA mediante **Actor, Tarea, Límites, Autovalidación y Salida**. En esta sesión utilizará ese método para transformar requisitos y reglas de negocio en un modelo conceptual defendible, trazable y libre de decisiones técnicas prematuras.

## Idea central

> La base de datos comienza mucho antes del `CREATE TABLE`.

La cadena pedagógica de la sesión es:

```text
Entrevistas
   ↓
DMC Application Specification
   ↓
Reglas de negocio
   ↓
Modelo conceptual
   ↓
Diagrama Entidad–Relación
   ↓
Modelo lógico
   ↓
Modelo físico
   ↓
Base de datos
```

Durante la Sesión 04 se explican los tres niveles para que el alumno entienda el mapa completo, pero el incremento que se construye y valida es el **modelo conceptual**.

## Objetivo de aprendizaje

Al finalizar, el participante podrá:

1. explicar la diferencia entre modelo conceptual, lógico y físico;
2. identificar entidades, atributos, valores, relaciones, eventos y estados;
3. distinguir conceptos del negocio de decisiones tecnológicas;
4. identificar identidad y posibles identificadores sin diseñar todavía claves físicas;
5. definir relaciones mediante verbos de negocio;
6. determinar cardinalidad mínima y máxima;
7. reconocer relaciones 1:1, 1:N y N:M;
8. identificar opcionalidad;
9. reconocer cuándo una relación N:M puede requerir una entidad asociativa;
10. entender qué es un DER y diferenciar DER conceptual, lógico y físico;
11. comprender el puente del modelo conceptual al lógico;
12. aplicar intuición de dependencias y normalización sin adelantar la Sesión 05;
13. construir un Prompt ATLAS especializado en modelado conceptual;
14. auditar un modelo generado por IA mediante Generate → Critique → Refine;
15. mantener trazabilidad entre Specification, requisitos y modelo.

## Resultado observable

Cada equipo debe terminar con:

- glosario del dominio;
- entidades candidatas justificadas;
- relaciones con verbos;
- cardinalidades confirmadas o preguntas abiertas;
- DER conceptual;
- eventos y estados relevantes;
- preguntas de modelado;
- matriz de trazabilidad;
- Prompt ATLAS para modelado conceptual;
- actualización de la DMC Application Specification.

## Entregables recomendados

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

## Material de la Sesión 04

| Archivo | Propósito |
|---|---|
| `01_plan_docente_3_horas.md` | Plan detallado de la clase. |
| `02_mapa_conceptual_logico_fisico.md` | Marco conceptual de los tres niveles de modelado y DER. |
| `03_plan_ejercicios.md` | Ejercicios guiados, taller y retos. |
| `04_manual_chatgpt_github.md` | Configurar ChatGPT/GitHub y diferenciar lectura de escritura con Codex. |
| `05_manual_claude_github.md` | Configurar Claude web y Claude Code con GitHub. |
| `06_manual_gemini_github.md` | Configurar Gemini web y Gemini CLI con GitHub. |
| `07_manual_cloud_shell_github.md` | Configurar Cloud Shell con GitHub mediante SSH, ramas, commits y PR. |

## Regla común de herramientas

> **Conectar un repositorio como fuente de contexto no equivale necesariamente a tener permisos de escritura sobre GitHub.**

Los alumnos deben distinguir:

```text
Conector / importación web
→ lectura y análisis

Agente de desarrollo + checkout Git autenticado
→ edición, pruebas, commit y push
```

Todo cambio del curso se realiza sobre una rama y se revisa mediante Pull Request antes de merge.

## Regla de la sesión

> Ninguna caja entra al modelo si el equipo no puede explicar qué representa, por qué existe y de qué evidencia proviene.

## Lo que NO se implementa todavía

Durante esta sesión no se debe diseñar todavía:

- `CREATE TABLE`;
- tipos SQL;
- `VARCHAR`;
- `UUID`;
- PK/FK físicas;
- índices;
- particiones;
- motor de base de datos;
- PostgreSQL o MongoDB;
- decisiones de almacenamiento.

Estos conceptos se muestran únicamente como destino de la cadena de diseño.

## Conexión con las siguientes sesiones

- **Sesión 05:** modelo lógico y normalización.
- **Sesión 06:** modelo físico en PostgreSQL.
- **Sesión 07:** integridad avanzada y reglas.
- **Sesión 08:** datos sintéticos y consultas.

## Mensaje de cierre

> El modelo correcto no es el que tiene más cajas. Es el que representa mejor las reglas del negocio y puede defenderse con evidencia.
