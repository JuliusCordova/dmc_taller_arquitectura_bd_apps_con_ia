# Solucionario de referencia — Sesión 2

## Uso

Este documento orienta al instructor. No representa una única respuesta correcta. La calidad depende de la trazabilidad, la claridad y el reconocimiento explícito de información pendiente.

## Criterios de corrección

### Historia de usuario adecuada

- actor específico;
- capacidad expresada sin imponer interfaz;
- valor de negocio o de usuario;
- fuente identificable;
- tamaño razonable para derivar requisitos.

### Requisito funcional adecuado

- verbo observable;
- condición de ejecución;
- resultado esperado;
- sin ambigüedad técnica innecesaria;
- fuente e historia relacionadas.

### RNF adecuado

- atributo de calidad;
- escenario;
- métrica y umbral cuando existe evidencia;
- método de verificación;
- pregunta abierta cuando la cifra no está definida.

### Criterio adecuado

- contexto inicial claro;
- acción o evento concreto;
- resultado verificable;
- no repite simplemente la historia.

## Ejemplos de corrección

### Ejemplo débil

> El sistema debe ser rápido y seguro.

### Mejora

Separar en dos RNF y registrar métricas pendientes:

- rendimiento de consulta de estado;
- control de acceso y protección de información;
- preguntas abiertas para umbral, carga esperada y política de autenticación.

---

### Ejemplo débil

> Como usuario quiero una pantalla de dashboard para ver todo.

### Mejora

> Como analista de operaciones, quiero visualizar los casos que requieren intervención ordenados por urgencia, para priorizar el trabajo dentro del SLA.

La pantalla es una posible solución posterior; la historia se concentra en capacidad y valor.

---

### Ejemplo débil

> El sistema usará PostgreSQL para guardar solicitudes.

### Mejora

> El sistema debe persistir cada solicitud con un identificador único y conservar su historial de estados.

La tecnología se decidirá en una etapa posterior.

## Cadena de referencia — Seguros

**Fuente:** entrevista de Operaciones: el analista necesita conocer documentos, estado y próximos pasos del siniestro.

**HU-SEG-01**  
Como analista de siniestros, quiero consultar un expediente consolidado con evidencias y estado, para resolver el caso sin buscar información en múltiples sistemas.

**RF-SEG-01**  
El sistema debe mostrar los documentos y evidencias asociados a un siniestro autorizado.

**RF-SEG-02**  
El sistema debe presentar el estado vigente y el historial de cambios del siniestro.

**RN-SEG-01**  
Cada documento debe conservar fecha de recepción, tipo y vínculo con el siniestro.

**CA-SEG-01**

- Dado un analista autorizado y un siniestro existente;
- cuando abre el expediente;
- entonces visualiza el estado vigente, historial y evidencias registradas.

**Preguntas abiertas:** periodo de retención, tipos documentales obligatorios y reglas para evidencias sensibles.

## Cadena de referencia — Retail

**Fuente:** entrevista de E-commerce: el cliente no debe comprar un producto que ya no está disponible.

**HU-RET-01**  
Como cliente digital, quiero conocer la disponibilidad real de un producto antes de confirmar la compra, para evitar cancelaciones posteriores.

**RF-RET-01**  
El sistema debe consultar la disponibilidad vendible del producto para la ubicación o modalidad seleccionada.

**RF-RET-02**  
Al confirmar el pedido, el sistema debe registrar una reserva de las unidades correspondientes.

**RN-RET-01**  
Una unidad reservada no debe considerarse disponible para otra venta durante la vigencia de la reserva.

**CA-RET-01**

- Dado un producto con una sola unidad vendible;
- cuando un pedido confirma la reserva;
- entonces una segunda solicitud no puede confirmar la misma unidad.

**Preguntas abiertas:** duración de reserva, tolerancia de sincronización y prioridad entre canales.

## Errores que deben penalizarse

- requisitos sin fuente;
- cifras inventadas;
- criterios no verificables;
- historias que describen componentes técnicos;
- contradicciones ocultas;
- RNF expresados únicamente como adjetivos;
- confundir reglas de negocio con validaciones de interfaz;
- seleccionar arquitectura o base de datos antes del modelado.

## Rúbrica breve — 20 puntos

| Criterio | Puntos |
|---|---:|
| Problema, objetivo y alcance | 3 |
| Actores, proceso e historias | 4 |
| Requisitos funcionales | 4 |
| RNF y reglas de negocio | 3 |
| Criterios de aceptación | 3 |
| Preguntas, contradicciones y trazabilidad | 3 |
| **Total** | **20** |

## Respuesta esperada a la pregunta esencial

Dos equipos construyen soluciones distintas porque una conversación no contiene por sí sola una interpretación única, verificable y compartida. La Specification reduce esa divergencia al separar categorías, declarar vacíos, conservar fuentes y establecer resultados observables.
