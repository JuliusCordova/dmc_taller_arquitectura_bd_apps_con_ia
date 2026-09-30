# DMC Institute — Sesión 16

## Hardening y protección de bases de datos

**Duración:** 3 horas  
**Modalidad:** teórico-práctica  
**Programa:** Arquitectura y Bases de Datos con IA para Aplicaciones Modernas  
**Metodología:** Spec-Driven Development + framework ATLAS

## Pregunta guía

> La arquitectura es segura en diseño. ¿Cómo endurecemos realmente el servidor, las conexiones, las credenciales y la auditoría?

## Propósito

Aplicar hardening técnico sobre PostgreSQL y Linux, usando el modelo CIA como marco de control. La sesión traduce principios de seguridad a configuraciones verificables: puertos, listeners, autenticación, roles, extensiones, TLS, secretos, auditoría y logs.

## Contenido oficial

- Modelo CIA aplicado a bases de datos.
- Qué es hardening y cómo implementarlo.
- Puertos y listeners.
- Usuarios y privilegios.
- Logs y extensiones.
- Cifrado at-rest e in-transit.
- Introducción a Zero Trust.
- Taller: hardening de PostgreSQL en Linux.
- Taller: configuración TLS para conexiones.
- Taller: implementación de secrets manager.
- Taller: configuración de auditoría y logs.

## Resultado observable

Cada equipo termina con:

- baseline de configuración;
- mapa CIA → controles;
- checklist de hardening;
- listeners y acceso revisados;
- TLS habilitado y probado;
- estrategia de secretos implementada;
- auditoría/logging configurados;
- evidencia before/after;
- actualización de la DMC Application Specification.

## Idea fuerza

> Hardening no es agregar más herramientas. Es eliminar confianza innecesaria y reducir superficie de ataque.

## Conexión con la Sesión 17

La Sesión 16 implementa controles. La Sesión 17 verificará si esos controles realmente funcionan mediante auditoría, pruebas negativas, hardening score y evidencia.