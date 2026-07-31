# Caso de uso 3 — Retail

## NovaRetail: Stock Único

### Contexto ficticio

NovaRetail opera 78 tiendas físicas, un canal de comercio electrónico y dos centros de distribución. Comercializa productos para el hogar, tecnología y cuidado personal. Su catálogo contiene cerca de 65,000 SKU y durante campañas puede procesar más de 12,000 pedidos por hora.

La empresa presenta diferencias frecuentes entre el stock mostrado en línea y la disponibilidad real. Cada canal consulta fuentes distintas, las reservas no siempre se sincronizan y algunas tiendas mantienen ajustes pendientes. Esto provoca cancelaciones, sobreventa, traslados urgentes y mala experiencia del cliente.

El proyecto propone una aplicación moderna denominada **Stock Único**, orientada a consolidar disponibilidad, administrar reservas y promesas de entrega, y permitir modalidades como despacho a domicilio, retiro en tienda y preparación desde tienda.

Las entrevistas siguientes constituyen el punto de partida del descubrimiento y no una solución ya diseñada.

---

## Entrevista 1 — CEO

**Entrevistada:** Claudia Rivas, CEO  
**Objetivo:** comprender la prioridad estratégica, el valor esperado y las restricciones comerciales.

### 1. ¿Por qué Stock Único es una prioridad?

**CEO:** Estamos invirtiendo en omnicanalidad, pero el cliente todavía experimenta canales separados. Ve un producto disponible, paga y horas después recibe una cancelación. Eso destruye confianza, incrementa el costo de atención y hace que perdamos ventas futuras.

### 2. ¿Cuál es el problema central?

**CEO:** No tenemos una única interpretación operativa de la disponibilidad. Tenemos existencias físicas, stock reservado, unidades en tránsito, productos dañados y pedidos pendientes, pero cada sistema calcula algo diferente. La discusión no es solo dónde almacenar datos, sino qué significa realmente “disponible para vender”.

### 3. ¿Qué resultado espera?

**CEO:** Reducir cancelaciones y sobreventa, mejorar la promesa de entrega y aprovechar mejor el inventario de tiendas. Quiero que una unidad disponible en una tienda pueda satisfacer un pedido digital cuando sea conveniente y rentable.

### 4. ¿Cómo medirá el éxito?

**CEO:** Tasa de cancelación por falta de stock, exactitud de inventario, pedidos entregados dentro de la promesa, porcentaje de ventas omnicanal, rotación, quiebres y costo de preparación por pedido. También debemos medir cuántas reservas vencen sin convertirse en venta.

### 5. ¿Cuál debe ser el alcance inicial?

**CEO:** Empezaría con tecnología y pequeños electrodomésticos en Lima, porque tienen alto valor, alta demanda digital y problemas visibles de disponibilidad. Después ampliaremos a otras categorías y ciudades.

### 6. ¿Qué experiencia espera para el cliente?

**CEO:** Una promesa confiable antes del pago. Debe conocer si recibirá hoy, mañana o si puede recoger en una tienda determinada. Si cambia la promesa, necesitamos comunicarlo y ofrecer alternativas, no simplemente cancelar.

### 7. ¿Qué riesgos no acepta?

**CEO:** Que el nuevo sistema interrumpa ventas en tiendas, que reserve inventario indefinidamente o que prometa unidades que no existen. Tampoco quiero reemplazar todos los sistemas actuales en una sola etapa. Debemos integrarnos y evolucionar gradualmente.

### 8. ¿Qué papel puede tener la IA?

**CEO:** Puede ayudar a anticipar demanda, sugerir redistribución y detectar comportamientos anómalos de inventario. Sin embargo, la reserva y el descuento de stock deben ser transacciones controladas. Una predicción puede recomendar, pero no inventar existencias.

### 9. ¿Qué condición comercial es importante?

**CEO:** En campañas, la velocidad es crítica. No podemos demorar demasiado el checkout para obtener una disponibilidad perfecta. Necesitamos una respuesta rápida, seguida de controles que mantengan coherencia.

### 10. ¿Qué decisión espera del equipo?

**CEO:** Una arquitectura que nos permita saber qué dato es autoridad para cada operación, procesar eventos de inventario casi en tiempo real y continuar vendiendo de manera segura si alguna integración se retrasa.

---

## Entrevista 2 — Área crítica: Supply Chain e Inventarios

**Entrevistado:** Javier Montalvo, gerente de Supply Chain e Inventarios  
**Objetivo:** comprender movimientos, disponibilidad, conciliación y reglas de reserva.

### 1. ¿Qué representa el inventario para ustedes?

**Supply Chain:** No es un solo número. Por SKU y ubicación tenemos stock físico, disponible, reservado, comprometido, bloqueado, dañado, en tránsito y pendiente de recepción. Además, hay productos serializados y otros manejados por lote.

### 2. ¿De dónde provienen los movimientos?

**Supply Chain:** Ventas en caja, pedidos web, recepciones de proveedores, transferencias, devoluciones, anulaciones, conteos, ajustes, daños, robos y cambios de estado. Algunos llegan en tiempo real y otros por lotes desde sistemas antiguos.

### 3. ¿Cómo debería calcularse la disponibilidad?

**Supply Chain:** Como principio, stock utilizable menos reservas y compromisos, considerando un stock de seguridad. Pero la fórmula varía por categoría, tienda, campaña y modalidad de entrega. Una unidad puede estar físicamente en tienda, pero no ser apta para venta digital.

### 4. ¿Qué es una reserva?

**Supply Chain:** Es una asignación temporal de unidades a una intención de compra o pedido. Debe tener origen, cantidad, ubicación, fecha de creación, expiración y estado. Una reserva puede confirmarse, liberarse, vencer o trasladarse a otra ubicación según reglas controladas.

### 5. ¿Cómo evitan reservar dos veces la misma unidad?

**Supply Chain:** Ese es uno de nuestros problemas actuales. Necesitamos control de concurrencia y operaciones idempotentes. Un reintento del checkout no debe generar otra reserva. Para productos serializados, eventualmente debemos identificar la unidad exacta.

### 6. ¿Qué ocurre si el stock físico no coincide con el sistema?

**Supply Chain:** Se genera una diferencia que debe investigarse. La aplicación debe permitir conteos y ajustes autorizados, conservando motivo, usuario y evidencia. No queremos corregir el número sin historial porque perdemos la causa del problema.

### 7. ¿Qué reglas existen para elegir una ubicación?

**Supply Chain:** Disponibilidad, distancia al cliente, capacidad de preparación, horario, costo, prioridad de tienda, fecha prometida y restricciones del producto. Algunas tiendas pueden vender en línea pero no preparar pedidos durante ciertas horas.

### 8. ¿Cómo se manejan transferencias y tránsito?

**Supply Chain:** Una transferencia tiene origen, destino, unidades solicitadas, despachadas, recibidas y diferencias. El inventario en tránsito no debe aparecer como disponible hasta la recepción, salvo un modelo futuro de promesa sobre stock en camino con suficiente confianza.

### 9. ¿Qué latencia es aceptable?

**Supply Chain:** Para ventas y reservas, segundos. Para indicadores analíticos puede ser mayor. En campañas, un retraso de varios minutos genera sobreventa. También necesitamos saber si un dato está actualizado o si estamos operando con una vista degradada.

### 10. ¿Qué necesita auditar?

**Supply Chain:** Cada cambio de cantidad, con evento de origen, documento relacionado, usuario o sistema, momento, cantidad anterior, cantidad nueva y razón. También la secuencia de eventos para detectar llegadas duplicadas o fuera de orden.

---

## Entrevista 3 — Área crítica: E-commerce y Operaciones de Tienda

**Entrevistada:** Paola Fernández, directora de E-commerce y Tiendas  
**Objetivo:** comprender el checkout, la promesa de entrega, la preparación y la continuidad entre canales.

### 1. ¿Cómo consulta hoy la web la disponibilidad?

**E-commerce:** Utiliza una réplica que se actualiza cada varios minutos. En días normales funciona razonablemente, pero durante campañas el stock cambia más rápido que la réplica. El cliente puede ver diez unidades cuando ya están reservadas en otro canal.

### 2. ¿En qué momento debe reservarse el producto?

**E-commerce:** No queremos reservar por solo visitar la página. La reserva debería ocurrir cuando el cliente inicia el pago o confirma el pedido, con una expiración corta. Si el medio de pago tarda, necesitamos coordinar ambos procesos sin bloquear inventario indefinidamente.

### 3. ¿Qué información necesita el checkout?

**E-commerce:** Productos, cantidades, ubicación candidata, modalidad de entrega, costo, fecha prometida y vigencia de la oferta. Si un carrito tiene varios productos, debemos decidir si salen juntos, desde ubicaciones distintas o si se propone una alternativa.

### 4. ¿Qué ocurre después de la compra?

**E-commerce:** Se confirma el pedido, se asigna una ubicación, se genera una tarea de preparación y la tienda o centro de distribución acepta. El personal recoge los productos, valida SKU y cantidad, embala y marca listo para despacho o recojo.

### 5. ¿Qué pasa si la tienda no encuentra una unidad reservada?

**E-commerce:** Debe registrar una excepción, buscar otra ubicación y recalcular la promesa. El cliente debería recibir opciones: nueva fecha, cambio de tienda, producto sustituto o devolución. Hoy muchas veces solo se cancela.

### 6. ¿Cómo funciona el retiro en tienda?

**E-commerce:** El cliente elige una tienda con disponibilidad, recibe una promesa y luego un código de recojo cuando el pedido está listo. Necesitamos validar quién retira, registrar la entrega y liberar la reserva si el cliente no recoge dentro del plazo.

### 7. ¿Qué necesita el personal de tienda?

**E-commerce:** Una cola priorizada de tareas, ubicación interna del producto cuando exista, tiempo objetivo, capacidad para reportar faltantes o daños y una forma simple de escanear el SKU. No deben ver datos personales del cliente que no necesiten para preparar el pedido.

### 8. ¿Qué problemas aparecen con reintentos y pagos?

**E-commerce:** El cliente puede presionar varias veces, cerrar la aplicación o recibir una respuesta tardía del medio de pago. Necesitamos correlacionar intento, pago, pedido y reserva. Un pago aprobado no puede terminar sin pedido, ni una reserva confirmada quedar sin trazabilidad.

### 9. ¿Qué volumen y disponibilidad espera?

**E-commerce:** En una campaña podemos recibir miles de consultas por segundo y picos de 12,000 pedidos por hora. El catálogo puede tolerar cierta eventualidad, pero la confirmación de reserva necesita mayor consistencia. El sitio debe degradar de manera controlada, no mostrar datos engañosos.

### 10. ¿Qué datos necesita para mejorar la operación?

**E-commerce:** Conversión, abandono, productos sin disponibilidad, promesas incumplidas, tiempo de preparación, reasignaciones, cancelaciones y sustituciones. También necesitamos distinguir si el problema se originó en inventario, pago, logística o tienda.

---

## Evidencias iniciales extraídas de las entrevistas

| Categoría | Elementos mencionados |
|---|---|
| Actores | Cliente, cajero, preparador de tienda, supervisor, operador logístico, sistema de pagos, sistemas de inventario |
| Objetos de negocio | Producto, SKU, ubicación, saldo de inventario, movimiento, reserva, carrito, pedido, pago, promesa, tarea de preparación, transferencia |
| Eventos posibles | Stock recibido, venta registrada, reserva creada, reserva vencida, pago aprobado, pedido confirmado, preparación iniciada, faltante reportado, pedido entregado |
| Restricciones | Concurrencia, idempotencia, alto volumen, latencia baja, auditoría, operación degradada, protección de datos del cliente |
| Incertidumbres | Fórmula exacta de disponibilidad, duración de reservas, estrategia de partición de pedidos, autoridad por sistema, compensación ante fallas de pago |

## Reto para el equipo

Convertir las entrevistas en una especificación inicial de **Stock Único**, haciendo explícitas las decisiones sobre:

- consistencia fuerte frente a consistencia eventual;
- consulta de disponibilidad frente a confirmación de reserva;
- inventario agregado frente a unidades serializadas;
- transacciones distribuidas entre reserva, pago y pedido;
- expiración y compensación de reservas;
- operación normal frente a modo degradado;
- datos operativos en tiempo real frente a analítica histórica.