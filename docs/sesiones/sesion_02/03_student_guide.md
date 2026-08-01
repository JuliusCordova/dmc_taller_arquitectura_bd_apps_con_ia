# Guía del estudiante — Sesión 2

## Misión

Convertir entrevistas y visión de producto en una **DMC Application Specification v0.1** que otro equipo pueda comprender, implementar y probar sin perder el propósito original.

## Qué aprenderás

- separar necesidades, historias, requisitos, reglas y criterios;
- detectar ambigüedades y contradicciones;
- usar IA sin permitir que invente información;
- escribir requisitos verificables;
- mantener trazabilidad desde la fuente.

## Regla principal

> Toda afirmación debe tener una fuente o quedar registrada como hipótesis o pregunta abierta.

## Definiciones rápidas

| Elemento | Pregunta que responde |
|---|---|
| Problema | ¿Qué situación necesita cambiar? |
| Objetivo | ¿Qué resultado buscamos? |
| Historia de usuario | ¿Quién necesita qué y para qué? |
| Requisito funcional | ¿Qué comportamiento debe ofrecer el sistema? |
| Requisito no funcional | ¿Con qué nivel de calidad debe operar? |
| Regla de negocio | ¿Qué condición del negocio debe cumplirse? |
| Restricción | ¿Qué límite no podemos ignorar? |
| Criterio de aceptación | ¿Cómo sabremos que funciona? |
| Pregunta abierta | ¿Qué información falta para decidir? |

## Historia de usuario

**Formato:**

Como `[actor]`, quiero `[capacidad]`, para `[valor]`.

Una buena historia:

- identifica un actor concreto;
- expresa una necesidad, no una pantalla;
- declara el valor esperado;
- puede vincularse con requisitos y criterios.

## Requisito funcional

Debe incluir:

- identificador;
- comportamiento esperado;
- actor o sistema involucrado;
- condición relevante;
- resultado observable;
- fuente;
- prioridad.

## Requisito no funcional

Evita palabras como “rápido”, “seguro” o “disponible” sin contexto. Define:

- atributo de calidad;
- escenario;
- métrica;
- umbral;
- forma de validación.

## Criterio de aceptación

Usa el formato:

- **Dado** un contexto inicial;
- **Cuando** ocurre una acción o evento;
- **Entonces** se observa un resultado.

## Flujo del laboratorio

1. Leer las entrevistas.
2. Marcar afirmaciones relevantes.
3. Clasificar cada afirmación.
4. Detectar contradicciones y vacíos.
5. Generar un borrador con IA.
6. Revisar cada salida contra la fuente.
7. Construir la Specification v0.1.
8. Validar con otro equipo.
9. Versionar el documento.

## Entregable mínimo

- 3 actores;
- 1 flujo principal;
- 5 historias de usuario;
- 8 requisitos funcionales;
- 5 requisitos no funcionales;
- 5 reglas de negocio;
- 8 criterios de aceptación;
- 5 preguntas abiertas;
- 1 matriz de trazabilidad.

## Checklist personal

- [ ] No inventé cifras, reglas ni tecnologías.
- [ ] Cada requisito indica su fuente.
- [ ] Las historias expresan valor.
- [ ] Los RNF tienen una métrica o una pregunta pendiente.
- [ ] Los criterios son observables.
- [ ] Las contradicciones están documentadas.
- [ ] Las decisiones técnicas prematuras están fuera del alcance.
- [ ] La versión está identificada como v0.1.

## Preparación para la sesión 3

Subraya en tu Specification:

- sustantivos de negocio: candidatos a entidades;
- propiedades: candidatos a atributos;
- verbos: candidatos a relaciones o eventos;
- estados y transiciones;
- reglas de unicidad, obligatoriedad y cardinalidad.
