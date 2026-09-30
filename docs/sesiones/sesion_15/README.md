# DMC Institute — Sesión 15

## Arquitectura segura de bases de datos

**Duración:** 3 horas  
**Modalidad:** teórico-práctica  
**Programa:** Arquitectura y Bases de Datos con IA para Aplicaciones Modernas  
**Metodología:** Spec-Driven Development + framework ATLAS

## Pregunta guía

> La base funciona y ya está desplegada. ¿Cómo evitamos que sea el punto más débil de la aplicación?

## Propósito

Introducir la seguridad de bases de datos desde una mirada de arquitectura: amenazas, superficie de ataque, mínimo privilegio, protección de secretos, prevención de inyección, trazabilidad, backups y replicación. La sesión conecta el despliegue multi-nube con la necesidad de proteger datos, identidades y operaciones antes de pasar al hardening técnico profundo.

## Contenido oficial

- Principales vulnerabilidades en bases de datos y técnicas de detección y mitigación.
- SQL Injection.
- NoSQL Injection.
- Exfiltración de datos.
- Privilege escalation.
- Secrets exposure.
- Taller: explotación y mitigación de SQL Injection en ambiente controlado.
- Taller: usuarios, roles y permisos en PostgreSQL.
- Taller: diseño de backups protegidos/inmutables.
- Taller: replicación básica y diferencia entre réplica y backup.

## Resultado observable

Cada equipo termina con:

- threat model básico de la solución;
- matriz de vulnerabilidades y controles;
- SQL Injection reproducido y mitigado en laboratorio;
- matriz de roles y permisos;
- estrategia de secretos;
- estrategia de backup;
- estrategia de replicación;
- evidencias before/after;
- actualización de la DMC Application Specification.

## Idea fuerza

> Una base de datos no es segura porque tenga contraseña. Es segura cuando un error, un atacante o una credencial comprometida no pueden llevarse todo.

## Conexión con la Sesión 16

La Sesión 15 responde **qué debemos proteger y por qué**. La Sesión 16 llevará esos principios a configuraciones concretas de hardening sobre PostgreSQL y Linux.