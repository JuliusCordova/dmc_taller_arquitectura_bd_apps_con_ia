# NovaRetail — Stock Único

## 1. Objetivo

Ofrecer una vista confiable del inventario disponible para promesa, permitir compra omnicanal y coordinar reserva, preparación, entrega o recojo sin sobreventa.

## 2. Actores

Cliente, operador de tienda, planner de inventarios, responsable de e-commerce, personal de almacén, supervisor de atención y administrador comercial.

## 3. Épicas

1. Catálogo y disponibilidad.
2. Carrito y promesa.
3. Reserva de inventario.
4. Preparación y despacho.
5. Recojo en tienda.
6. Excepciones, devoluciones y control.

## 4. Historias de usuario

### HU-RET-01 — Consultar disponibilidad real
**Como** cliente, **quiero** ver disponibilidad por modalidad y ubicación, **para** elegir una promesa que pueda cumplirse.

**Criterios de aceptación**
- La disponibilidad distingue stock físico, reservado, comprometido y disponible para promesa.
- La pantalla indica fecha de actualización y modalidad disponible.
- Un inventario incierto se muestra como “por confirmar”, no como disponible.

### HU-RET-02 — Construir carrito omnicanal
**Como** cliente, **quiero** agregar productos y combinar entrega o recojo, **para** completar una compra conveniente.

**Criterios de aceptación**
- El carrito recalcula disponibilidad, precio y promoción ante cada cambio relevante.
- Se informa cuando los productos requieren entregas separadas.
- El carrito puede recuperarse de forma segura en otro dispositivo.

### HU-RET-03 — Obtener una promesa confiable
**Como** cliente, **quiero** conocer fecha, costo y lugar antes de pagar, **para** decidir con información clara.

**Criterios de aceptación**
- La promesa considera inventario, capacidad, corte, distancia y feriados.
- Cada alternativa conserva vigencia y condiciones.
- Si la promesa vence antes del pago, se recalcula y solicita aceptación.

### HU-RET-04 — Reservar sin sobreventa
**Como** responsable de e-commerce, **quiero** reservar inventario de forma atómica, **para** evitar vender la misma unidad dos veces.

**Criterios de aceptación**
- La reserva tiene identificador, cantidad, origen, expiración y estado.
- Operaciones repetidas con la misma clave no duplican la reserva.
- Una reserva vencida libera inventario y genera evento trazable.

### HU-RET-05 — Preparar el pedido
**Como** operador de tienda o almacén, **quiero** recibir tareas de picking priorizadas, **para** preparar pedidos dentro del SLA.

**Criterios de aceptación**
- La tarea muestra ubicación, producto, cantidad, SLA y sustituciones permitidas.
- Un faltante físico registra causa y activa replanificación.
- El escaneo valida producto y evita cerrar cantidades incorrectas.

### HU-RET-06 — Retirar en tienda
**Como** cliente, **quiero** recibir aviso y retirar con validación segura, **para** completar mi compra rápidamente.

**Criterios de aceptación**
- Solo se notifica cuando todos los paquetes requeridos están listos.
- La entrega valida código temporal e identidad según nivel de riesgo.
- Se registra quién entregó, quién retiró, fecha y evidencia.

### HU-RET-07 — Resolver quiebres y replanificar
**Como** supervisor, **quiero** ver excepciones y alternativas, **para** mantener la promesa o contactar al cliente oportunamente.

**Criterios de aceptación**
- Las excepciones se priorizan por impacto, SLA y valor del pedido.
- El sistema propone otra tienda, despacho parcial, sustitución o cancelación.
- Toda modificación de promesa exige comunicación y aceptación cuando corresponda.

### HU-RET-08 — Ajustar inventario con trazabilidad
**Como** planner, **quiero** registrar ajustes y consultar movimientos, **para** mejorar la exactitud del stock.

**Criterios de aceptación**
- Cada ajuste exige motivo, ubicación, cantidad y responsable.
- Ajustes sobre umbral requieren aprobación adicional.
- El kardex conserva referencia al pedido, reserva, recepción o conteo que originó el movimiento.

## 5. Requisitos funcionales

| ID | Requisito |
|---|---|
| RF-RET-01 | Consolidar inventario por SKU, ubicación y estado. |
| RF-RET-02 | Calcular disponible para promesa con reglas configurables. |
| RF-RET-03 | Exponer disponibilidad por canal y modalidad. |
| RF-RET-04 | Crear y recuperar carritos omnicanal. |
| RF-RET-05 | Recalcular precios, promociones y disponibilidad. |
| RF-RET-06 | Calcular alternativas de promesa con vigencia. |
| RF-RET-07 | Crear reservas atómicas e idempotentes. |
| RF-RET-08 | Expirar, consumir y liberar reservas mediante eventos. |
| RF-RET-09 | Crear pedidos y dividirlos en grupos de cumplimiento. |
| RF-RET-10 | Generar tareas de picking priorizadas. |
| RF-RET-11 | Validar picking y packing mediante escaneo. |
| RF-RET-12 | Registrar faltantes y activar replanificación. |
| RF-RET-13 | Gestionar despacho y trazabilidad de paquetes. |
| RF-RET-14 | Gestionar recojo en tienda con código seguro. |
| RF-RET-15 | Notificar hitos y cambios de promesa. |
| RF-RET-16 | Gestionar bandeja de excepciones y alternativas. |
| RF-RET-17 | Registrar movimientos y ajustes de inventario. |
| RF-RET-18 | Mantener auditoría de reservas, pedidos y ajustes. |

## 6. Requisitos no funcionales

| ID | Categoría | Requisito medible |
|---|---|---|
| RNF-RET-01 | Disponibilidad | 99.95% mensual para consulta, reserva y checkout. |
| RNF-RET-02 | Rendimiento | p95 menor a 500 ms para disponibilidad y menor a 2 s para promesa. |
| RNF-RET-03 | Consistencia | Reserva y consumo con consistencia fuerte por SKU–ubicación. |
| RNF-RET-04 | Escalabilidad | Soportar 15 veces la carga promedio durante campañas. |
| RNF-RET-05 | Resiliencia | Colas, reintentos, compensación e idempotencia en operaciones distribuidas. |
| RNF-RET-06 | Seguridad | Cifrado, autorización por rol y protección de datos de cliente y pago. |
| RNF-RET-07 | Observabilidad | Trazas por carrito, reserva, pedido, paquete y movimiento. |
| RNF-RET-08 | Frescura | 95% de cambios de inventario visibles en menos de 5 segundos. |
| RNF-RET-09 | Accesibilidad | WCAG 2.2 AA en e-commerce y aplicaciones internas esenciales. |
| RNF-RET-10 | Recuperación | RPO menor a 5 minutos y RTO menor a 30 minutos para funciones críticas. |

## 7. Diseño en Figma

Archivo: [DMC Taller — Casos de uso](https://www.figma.com/design/HZaI8Iec3Qm77zfvQAa1Nk)

### Pantallas
1. Catálogo con disponibilidad y modalidades.
2. Carrito con promesa y selección de cumplimiento.
3. Confirmación y seguimiento del pedido.
4. Consola de picking de tienda/almacén.
5. Bandeja de excepciones omnicanal.
6. Panel de inventario, reservas y movimientos.

| Pantalla | Historias |
|---|---|
| Catálogo | HU-RET-01 |
| Carrito y promesa | HU-RET-02, HU-RET-03, HU-RET-04 |
| Seguimiento | HU-RET-06, HU-RET-07 |
| Picking | HU-RET-05 |
| Excepciones | HU-RET-07 |
| Inventario | HU-RET-08 |
