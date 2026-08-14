# Manual 3 — Configurar Gemini con GitHub

## Objetivo

Permitir que el alumno utilice GitHub como fuente de código en Gemini y distinga entre:

1. **Gemini web + app GitHub** para importar y analizar un repositorio;
2. **Gemini CLI** para trabajar sobre un checkout real del repositorio, editar archivos y ejecutar comandos Git.

> Regla importante: la importación de GitHub en Gemini web es una copia del estado del repositorio al momento de importarlo y no habilita escritura directa en GitHub.

---

# Parte A — Importar un repositorio en Gemini web

## 1. Requisitos previos

- Cuenta de Google con acceso a Gemini.
- Uso desde computadora.
- Cuenta de GitHub para repositorios privados.
- Si es una cuenta laboral o educativa, el administrador de Google Workspace puede tener que habilitar las apps conectadas.

---

## 2. Importar un repositorio

1. Abre Gemini en el navegador.
2. En el cuadro de prompt selecciona **Agregar archivo**.
3. Selecciona **Más cargas**.
4. Selecciona **Importar código**.
5. Ingresa la URL del repositorio o de una rama GitHub.
6. Pulsa **Importar**.
7. Si el repositorio es privado, sigue el flujo para vincular la cuenta de GitHub que tiene acceso.
8. Cuando termine la importación, escribe tu prompt.

Ejemplo:

```text
Analiza únicamente el repositorio importado.

Ubica la DMC Application Specification del caso de Seguros.
Identifica las entidades candidatas para un modelo conceptual.
No inventes cardinalidades.
No generes SQL.
Convierte los vacíos en preguntas abiertas.
```

---

## 3. Límites que el alumno debe conocer

En Gemini web:

- el repositorio importado no se sincroniza automáticamente con cambios posteriores;
- solo se agrega un repositorio por conversación según los límites vigentes;
- existen límites de tamaño y número de archivos;
- la app no recupera todo el historial Git, PRs y otros metadatos;
- la app no escribe directamente en el repositorio.

Si el repositorio cambia, vuelve a importarlo cuando necesites trabajar con la versión nueva.

---

## 4. Repositorio privado

Para un repo privado:

1. Usa una cuenta de GitHub que tenga acceso.
2. Vincúlala a tu cuenta Google cuando Gemini lo solicite.
3. Autoriza los repositorios necesarios.
4. Evita autorizar repositorios que no forman parte del curso.

---

# Parte B — Gemini CLI para desarrollo asistido

## 5. Cuándo usar Gemini CLI

Usa Gemini CLI cuando necesitas trabajar sobre una carpeta real y realizar actividades de ingeniería como:

- leer múltiples archivos locales;
- editar Markdown o código;
- ejecutar comandos;
- revisar Git;
- validar artefactos;
- preparar cambios que luego serán commit/push.

---

## 6. Instalar Gemini CLI

Gemini CLI requiere Node.js compatible.

Instalación típica:

```bash
npm install -g @google/gemini-cli
```

Ejecutar:

```bash
gemini
```

En Cloud Shell y Cloud Workstations Gemini CLI puede estar preinstalado.

---

## 7. Autenticar Gemini CLI

La forma más simple para muchos alumnos es:

```bash
gemini
```

Luego seleccionar:

```text
Sign in with Google
```

Según el tipo de cuenta, puede requerirse configurar un proyecto Google Cloud.

También existen opciones mediante Gemini API Key o Vertex AI.

### Regla de seguridad

No pegues claves API en:

- prompts;
- archivos Markdown versionados;
- commits;
- capturas compartidas.

---

# Parte C — Combinar Gemini CLI + GitHub

## 8. Preparar Git antes de abrir Gemini

Git debe funcionar de forma independiente.

```bash
git --version
git config --global user.name "TU_NOMBRE"
git config --global user.email "TU_EMAIL"
```

Clona el repo:

```bash
git clone git@github.com:OWNER/REPOSITORY.git
cd REPOSITORY
```

Verifica:

```bash
git status
git remote -v
```

---

## 9. Crear una rama de trabajo

```bash
git checkout main
git pull
git checkout -b feature/modelo-conceptual-<slug>
```

Ahora ejecuta Gemini desde la raíz:

```bash
gemini
```

El contexto de trabajo queda asociado al proyecto local.

---

## 10. Shell desde Gemini CLI

Gemini CLI permite ejecutar comandos shell con el prefijo `!`.

Ejemplos:

```text
!git status
!git diff
!ls docs/sesiones/sesion_04
```

Estos comandos tienen los mismos permisos e impacto que ejecutarlos directamente en la terminal.

Por eso:

> No ejecutes comandos destructivos o de merge sin entenderlos y aprobarlos.

---

## 11. Prompt ATLAS para Gemini CLI

```text
## ACTOR

Actúa como Arquitecto de Datos Senior y especialista en SDD.

## TAREA

Lee la Specification vigente del caso y construye los artefactos del modelo conceptual de la Sesión 4.

## LÍMITES

No generes SQL.
No selecciones PostgreSQL ni MongoDB.
No inventes cardinalidades.
No modifiques archivos fuera de docs/modelos y docs/prompts.
Cuando falte evidencia, registra una pregunta abierta.

## AUTOVALIDACIÓN

Verifica:
- cada entidad tiene fuente;
- cada relación tiene verbo;
- cada cardinalidad está sustentada o marcada pendiente;
- no hay tecnología introducida prematuramente.

## SALIDA

Genera los archivos definidos por la Sesión 4.
Muestra un resumen del diff.
No hagas merge.
```

---

## 12. Revisar antes de commit

Desde Gemini CLI:

```text
!git status
!git diff
```

O desde la terminal:

```bash
git status
git diff
```

El alumno debe revisar todo cambio antes de versionarlo.

---

## 13. Commit y push

Después de la revisión humana:

```bash
git add docs/modelos docs/prompts
git commit -m "docs: agregar modelo conceptual del caso"
git push -u origin feature/modelo-conceptual-<slug>
```

Si está instalado GitHub CLI:

```bash
gh pr create
```

---

# Parte D — Diferencia entre Gemini web y Gemini CLI

| Capacidad | Gemini web + GitHub | Gemini CLI + Git local |
|---|---|---|
| Leer repo | Sí, mediante importación | Sí |
| Repo actualizado automáticamente | No | Sí, mediante `git pull` |
| Editar archivos reales | No directamente en GitHub | Sí |
| Ejecutar shell | No como repo local | Sí |
| Commit/push | No | Sí, si Git está autenticado |
| Ideal para | Comprensión y análisis | Desarrollo asistido |

---

## 14. Checklist de finalización

- [ ] El alumno puede importar un repo en Gemini web.
- [ ] Entiende que la importación es un snapshot y no una sincronización permanente.
- [ ] Entiende que Gemini web no escribe en GitHub.
- [ ] Gemini CLI está disponible cuando se necesita editar.
- [ ] Git funciona antes de iniciar Gemini CLI.
- [ ] Se trabaja en rama.
- [ ] Se revisa `git diff`.
- [ ] El Pull Request requiere revisión humana.

---

## Fuentes oficiales consultadas

- Google Gemini Help — Importar un repositorio de GitHub: https://support.google.com/gemini/answer/16176929?hl=es-419
- Gemini CLI — Get started: https://github.com/google-gemini/gemini-cli/blob/main/docs/get-started/index.md
- Gemini CLI — Authentication: https://github.com/google-gemini/gemini-cli/blob/main/docs/get-started/authentication.mdx
- Gemini CLI — Commands: https://github.com/google-gemini/gemini-cli/blob/main/docs/reference/commands.md
