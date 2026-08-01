# Laboratorio guiado — Crédito Ágil 360

## Objetivo

Construir una cadena de trazabilidad completa desde una frase de entrevista hasta una historia, requisitos y criterios de aceptación.

## Evidencia de entrada

Frase del caso:

> “Queremos aprobar créditos más rápido, pero sin aumentar el riesgo.”

## Paso 1 — Separar lo que la frase sí dice

- Existe un proceso de aprobación de créditos.
- La velocidad actual es percibida como insuficiente.
- El negocio no acepta deteriorar el riesgo para ganar velocidad.

## Paso 2 — Registrar lo que no dice

- Tiempo actual de aprobación.
- Tiempo objetivo.
- Definición de “aumentar el riesgo”.
- Segmentos de clientes incluidos.
- Monto máximo.
- Fuentes usadas para evaluar.
- Casos que requieren revisión humana.

Estos elementos deben convertirse en preguntas abiertas, no en supuestos ocultos.

## Paso 3 — Formular objetivo inicial

Reducir el tiempo de evaluación y decisión de las solicitudes de crédito manteniendo los niveles de riesgo definidos por el banco.

> Estado: objetivo preliminar sujeto a métricas y umbrales pendientes.

## Paso 4 — Historia de usuario

**HU-BAN-01**

Como solicitante de crédito, quiero conocer el estado y resultado de mi evaluación, para tomar una decisión financiera sin esperar ni consultar por otros canales.

## Paso 5 — Requisitos funcionales

**RF-BAN-01 — Registrar solicitud**  
El sistema debe registrar una solicitud asociada a un solicitante y asignarle un identificador único.

**RF-BAN-02 — Consultar estado**  
El solicitante autorizado debe poder consultar el estado vigente de su solicitud.

**RF-BAN-03 — Registrar decisiones**  
El sistema debe registrar cada decisión de evaluación con fecha, responsable o motor, versión de reglas y resultado.

**RF-BAN-04 — Escalar a revisión**  
Cuando una solicitud cumpla condiciones de revisión manual, el sistema debe crear una tarea para un analista de riesgos.

## Paso 6 — Reglas de negocio preliminares

**RN-BAN-01**  
Una solicitud solo puede tener un estado vigente a la vez.

**RN-BAN-02**  
Toda decisión debe conservar la versión de las reglas utilizadas.

**RN-BAN-03**  
Una decisión manual debe identificar al analista responsable.

> Los umbrales concretos de riesgo permanecen como preguntas abiertas.

## Paso 7 — Requisitos no funcionales

**RNF-BAN-01 — Trazabilidad**  
El sistema debe conservar evidencia auditable de cambios de estado y decisiones durante el periodo definido por la política institucional.

**RNF-BAN-02 — Seguridad**  
Solo usuarios y servicios autorizados pueden consultar información de una solicitud.

**RNF-BAN-03 — Rendimiento**  
El tiempo máximo de respuesta para consultar el estado debe definirse con el Product Owner y quedar sujeto a prueba de carga.

> Al no existir un umbral respaldado, se registra la métrica pendiente en lugar de inventar una cifra.

## Paso 8 — Criterios de aceptación

**CA-BAN-01**

- **Dado** un solicitante con identidad validada;
- **Cuando** registra una solicitud con los datos obligatorios;
- **Entonces** el sistema crea un identificador único y muestra el estado inicial.

**CA-BAN-02**

- **Dado** una solicitud existente;
- **Cuando** se ejecuta una evaluación;
- **Entonces** se registra el resultado, la fecha y la versión de reglas empleada.

**CA-BAN-03**

- **Dado** una solicitud marcada para revisión manual;
- **Cuando** finaliza la evaluación automática;
- **Entonces** se crea una tarea visible en la bandeja de riesgos.

## Paso 9 — Matriz de trazabilidad

| Fuente | Historia | Requisito | Regla/RNF | Criterio |
|---|---|---|---|---|
| Entrevista CEO: velocidad sin elevar riesgo | HU-BAN-01 | RF-BAN-03 | RN-BAN-02 | CA-BAN-02 |
| Entrevista Riesgos: revisión de excepciones | HU-BAN-01 | RF-BAN-04 | RN-BAN-03 | CA-BAN-03 |
| Entrevista Canales: seguimiento del cliente | HU-BAN-01 | RF-BAN-02 | RNF-BAN-02 | Pendiente |

## Prompt maestro

```text
Actúa como analista de negocio y arquitecto de aplicaciones.

Transforma las entrevistas entregadas en una especificación funcional inicial.

Reglas obligatorias:
1. Usa únicamente información presente en las entrevistas.
2. No inventes actores, cifras, tecnologías, procesos ni reglas.
3. Separa objetivos, historias, RF, RNF, reglas, restricciones,
   criterios y preguntas abiertas.
4. Cuando falte información, crea una pregunta abierta.
5. Cuando exista contradicción, registra ambas posiciones.
6. Indica la fuente de cada requisito.
7. Formula criterios observables y verificables.
8. No diseñes todavía la arquitectura ni el modelo de datos.
```

## Resultado esperado

Una sección de Specification que pueda ser revisada por negocio, riesgos, UX, arquitectura y QA sin perder la fuente original.
