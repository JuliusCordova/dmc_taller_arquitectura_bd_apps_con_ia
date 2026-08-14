# Manual 2 — Configurar Claude con GitHub

## Objetivo

Permitir que el alumno conecte Claude con GitHub para usar repositorios como contexto y distinguir entre:

1. **Claude web + integración GitHub** para lectura y análisis;
2. **Claude Code** para editar un repositorio real, ejecutar comandos, crear commits y preparar Pull Requests.

> Regla importante: conectar GitHub como fuente de contexto no significa automáticamente que Claude pueda escribir en el repositorio.

---

# Parte A — Claude web + GitHub

## 1. Requisitos previos

- Cuenta de Claude con acceso a la integración GitHub.
- Cuenta de GitHub.
- Acceso al repositorio que se desea utilizar.
- Aprobación del administrador cuando el repo pertenece a una organización con políticas restrictivas.

---

## 2. Agregar GitHub desde un chat

1. Abre Claude en el navegador.
2. Crea o abre un chat.
3. Presiona el botón **+** en la parte inferior izquierda.
4. Selecciona **Agregar desde GitHub**.
5. Si todavía no estás autenticado en GitHub, Claude te redirigirá para iniciar sesión y autorizar la integración.
6. Selecciona el repositorio.
7. Usa el explorador para elegir los archivos y carpetas relevantes.
8. Envía el mensaje.

### Recomendación

No agregues todo el repositorio por costumbre. Selecciona únicamente los archivos que necesita la tarea.

Ejemplo para la Sesión 4:

```text
docs/plan_capacitacion/
docs/sesiones/sesion_04/
casos_de_uso/specs/<solution_slug>/
```

---

## 3. Agregar GitHub a un Project de Claude

1. Abre un Project.
2. Ve a la sección de conocimiento del proyecto.
3. Pulsa **+**.
4. Selecciona **GitHub**.
5. Busca el repositorio o pega su URL.
6. Selecciona archivos y carpetas.
7. Confirma la incorporación al conocimiento del proyecto.

Cuando el repositorio cambie, utiliza **Sync / Sincronizar** para actualizar el contenido seleccionado.

---

## 4. Repositorios privados

Si Claude no puede ver un repositorio privado:

1. Sigue el enlace hacia la aplicación de GitHub de Claude.
2. Otorga acceso al repositorio si tienes permisos de administración.
3. Si no los tienes, solicita autorización al administrador de la organización.

Si la organización usa SSO:

```text
GitHub
→ Settings
→ Applications
→ Claude
→ Organization access
→ Grant / Request
```

---

## 5. Qué sincroniza la integración web

La integración GitHub de Claude está orientada al contenido de archivos de una rama específica.

No debe confundirse con un checkout Git completo.

Para un ejercicio de lectura puedes pedir:

```text
Usa exclusivamente los archivos seleccionados desde GitHub.

Revisa el modelo conceptual del caso y enumera:
- entidades sin fuente;
- relaciones sin verbo;
- cardinalidades no justificadas;
- conceptos tecnológicos introducidos antes de tiempo.
```

---

# Parte B — Claude Code para desarrollo real

## 6. Cuándo cambiar a Claude Code

Usa Claude Code cuando necesitas que la IA trabaje sobre archivos reales del workspace y pueda:

- editar archivos;
- crear archivos;
- ejecutar pruebas;
- ejecutar comandos Git;
- trabajar sobre una rama;
- preparar commits;
- hacer push cuando Git ya está autenticado.

---

## 7. Preparar GitHub en el equipo

Antes de iniciar Claude Code, verifica que Git funciona sin depender de Claude.

Ejemplo:

```bash
git --version
git config --global user.name "TU_NOMBRE"
git config --global user.email "TU_EMAIL_GITHUB"
```

Clona el repositorio:

```bash
git clone git@github.com:OWNER/REPOSITORY.git
cd REPOSITORY
```

Comprueba:

```bash
git status
git remote -v
```

---

## 8. Autenticar GitHub

Puedes usar SSH o GitHub CLI.

### Opción SSH

```bash
ssh -T git@github.com
```

Resultado esperado:

```text
Hi TU_USUARIO! You've successfully authenticated, but GitHub does not provide shell access.
```

### Opción GitHub CLI

Si `gh` está instalado:

```bash
gh auth login
gh auth status
```

---

## 9. Instalar y abrir Claude Code

Sigue el mecanismo de instalación oficial disponible para tu sistema.

Una vez instalado:

```bash
cd ruta/al/repositorio
claude
```

Claude Code ofrece autenticación con Anthropic Console, cuenta Claude compatible o plataformas empresariales según la configuración disponible.

---

## 10. Regla esencial

Claude Code **hereda los permisos del entorno donde se ejecuta**.

Si desde el terminal esto funciona:

```bash
git push
```

Claude Code puede trabajar dentro de ese contexto cuando le autorizas las acciones correspondientes.

Si Git no está autenticado, Claude Code no puede resolver mágicamente ese problema.

---

## 11. Flujo recomendado del curso

```bash
git checkout main
git pull
git checkout -b feature/modelo-conceptual-<slug>
claude
```

Prompt sugerido:

```text
Usa el framework ATLAS de la Sesión 3.

Lee primero la Specification del caso.
No modifiques ningún archivo hasta haber identificado:
1. fuentes;
2. entidades candidatas;
3. relaciones;
4. cardinalidades confirmadas;
5. preguntas abiertas.

Luego crea únicamente los artefactos de modelo conceptual definidos para la Sesión 4.

No generes SQL, PK/FK físicas, tipos ni decisiones de motor.

Al terminar:
- revisa el diff;
- informa archivos creados;
- no hagas merge.
```

Después revisa:

```bash
git status
git diff
```

---

## 12. Commit y push

Solo después de revisar el resultado:

```bash
git add docs/modelos docs/prompts
git commit -m "docs: agregar modelo conceptual del caso"
git push -u origin feature/modelo-conceptual-<slug>
```

Con GitHub CLI puedes abrir el PR:

```bash
gh pr create
```

---

# Parte C — Claude Code en la web

## 13. Otra opción: Claude Code remoto

Claude Code en la web puede trabajar sobre repositorios GitHub en un entorno remoto. El alumno selecciona un repositorio, describe la tarea y Claude puede preparar cambios y un Pull Request para revisión.

Es útil cuando no se quiere preparar un entorno local.

La regla del curso se mantiene:

> El agente puede producir el cambio; el alumno debe revisar el PR antes de aprobarlo.

---

# Parte D — Problemas frecuentes

## 14. Claude web puede leer pero no escribir

No es necesariamente un error.

La integración web sirve para proporcionar contexto del repositorio.

Para editar usa Claude Code trabajando sobre un repo real o Claude Code en la web cuando esté disponible.

---

## 15. Repositorio de organización no visible

Revisa:

- permisos de GitHub App;
- autorización SSO;
- aprobación de la organización;
- acceso al repositorio específico.

---

## 16. Claude Code modifica demasiado

El problema debe controlarse con ATLAS:

```text
LÍMITES
- modifica solo docs/modelos/;
- no cambies código;
- no generes DDL;
- no modifiques la Specification salvo para registrar preguntas;
- muestra el diff antes de commit.
```

---

## 17. Checklist de finalización

- [ ] Claude web puede acceder al repo o archivos seleccionados.
- [ ] El alumno sabe usar Sync cuando el repo cambia.
- [ ] Git funciona en el terminal antes de abrir Claude Code.
- [ ] La autenticación SSH o `gh` está validada.
- [ ] Claude Code se ejecuta desde la raíz del repositorio.
- [ ] Se trabaja en una rama, nunca directamente sobre `main` durante el taller.
- [ ] Se revisa `git diff` antes del commit.
- [ ] El PR queda sujeto a revisión humana.

---

## Fuentes oficiales consultadas

- Claude Help Center — Use the GitHub integration: https://support.claude.com/en/articles/10167454-use-the-github-integration
- Anthropic Docs — Set up Claude Code: https://docs.anthropic.com/en/docs/claude-code/getting-started
- Claude Help Center — Claude Code on the web: https://support.claude.com/es/articles/12618689-claude-code-en-la-web
