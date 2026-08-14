# Validaciones y trazabilidad

## Validaciones de canal

- Campos requeridos, formatos y rangos definidos por configuración aprobada.
- No solicitar nuevamente datos disponibles y vigentes; permitir confirmación/actualización.
- Mensaje claro, acción siguiente y foco accesible ante error.
- Guardado de progreso antes de invocar integraciones.
- Deshabilitar repetición accidental y enviar clave de idempotencia.
- Archivos: tipo/tamaño/vigencia y análisis de seguridad quedan POR RESPONDER.

## Validaciones de dominio

- Cliente pertenece al alcance MVP.
- Producto/campaña y oferta están vigentes.
- Autorización requerida existe y corresponde a la versión vigente.
- Monto/plazo/tasa/condiciones respetan decisión; valores POR RESPONDER.
- Transición de estado permitida y actor autorizado.
- Excepción cumple matriz y segregación.
- Contrato corresponde a decisión vigente y cuenta confirmada.
- Desembolso solo desde `listo para desembolso`, con idempotencia.

## Validaciones de datos e IA

- Registrar fuente, tiempo, vigencia y calidad de cada dato usado.
- No sobrescribir snapshot histórico.
- Detectar duplicados e inconsistencias sin fusionar automáticamente hasta aprobar reglas.
- No completar campos ausentes; conservar documento origen, región/evidencia y confianza.
- Enviar a revisión bajo umbral aprobado y monitorear deriva/calidad.

## Estrategia de pruebas

| Nivel | Cobertura mínima |
|---|---|
| Unitarias | Reglas, transiciones, permisos, claves idempotentes, traducción de mensajes |
| Contrato | APIs/eventos y adaptadores internos, externos y core |
| Integración | Timeout, respuesta tardía, duplicado, reproceso, DLQ y recuperación |
| End-to-end | Caminos aprobado, rechazado, observado, revisión, excepción y desembolso |
| Seguridad | Autorización por rol, fuga de datos, cifrado, secretos, archivos y auditoría |
| Accesibilidad | Lector de pantalla, teclado/foco, errores, etiquetas y lenguaje claro |
| Rendimiento | Carga normal y campaña 5x con perfil horario por confirmar |
| Resiliencia | Caída de fuente, motor, notificador y core; no perder progreso ni duplicar efectos |
| IA | Extracción por tipo documental, ausencias, confianza, contradicciones, sesgo/deriva |

## Escenarios críticos de aceptación transversal

1. Un timeout seguido de doble clic/reintento conserva una solicitud y una evaluación.
2. Un timeout incierto del core no causa segundo desembolso; se consulta/reconcilia el resultado.
3. Cambiar un dato maestro no modifica la reconstrucción de una decisión pasada.
4. Un analista no autoriza su propia excepción cuando requiere supervisor.
5. Contact center consulta y registra incidencia, pero no cambia la decisión.
6. Un documento sin campo esperado produce `no encontrado`, nunca un valor inferido.
7. Correo/SMS no contienen monto, tasa, score ni otra información sensible.
8. Una fuente no disponible mueve el caso a procesamiento/reintento informado sin perder datos.

## Matriz de trazabilidad

| Historia | Requisitos | Evidencia de prueba |
|---|---|---|
| HU-01 | RF-01, RF-02; RNF-06, RNF-09 | E2E omnicanal + reintento |
| HU-03/04 | RF-04, RF-05; RNF-03/04 | Contrato maestro + consentimiento |
| HU-05 | RF-06/07/17; RNF-08/12 | Documento ausente/ilegible + reproceso |
| HU-06 | RF-08/09/10/19; RNF-01/02/12/13 | Reconstrucción histórica |
| HU-07/08 | RF-11; RNF-03 | RBAC + segregación |
| HU-09/10 | RF-12/13; RNF-10/12 | Accesibilidad + contenido seguro |
| HU-11/12 | RF-14/15; RNF-01/09/15 | Aceptación + timeout core |
| HU-13 | RF-18; RNF-04/11 | Catálogo y minimización de eventos |

## Puertas SDD

- **G0 Descubrimiento:** preguntas críticas asignadas.
- **G1 Especificación:** historias, estados, reglas, datos, APIs y NFR cuantificados/aprobados.
- **G2 Diseño:** arquitectura, amenazas, privacidad y prototipo validados.
- **G3 Construcción:** pruebas derivadas de criterios y contratos automatizados.
- **G4 Liberación:** performance 5x, resiliencia, seguridad, auditoría y rollback aprobados.

