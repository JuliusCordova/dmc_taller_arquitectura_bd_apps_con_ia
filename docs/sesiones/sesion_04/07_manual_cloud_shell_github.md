# Manual 4 — Configurar Google Cloud Shell con GitHub

## Objetivo

Configurar Google Cloud Shell como entorno de trabajo para el curso, conectarlo de forma segura con GitHub y permitir al alumno clonar, editar, crear ramas, hacer commits y abrir Pull Requests.

> Cloud Shell ya incluye muchas herramientas de desarrollo y autentica automáticamente al usuario contra Google Cloud, pero **GitHub requiere su propia autenticación**.

---

# Parte A — Abrir Cloud Shell

## 1. Requisitos previos

- Cuenta de Google con acceso a Google Cloud.
- Proyecto Google Cloud accesible.
- Cuenta GitHub.
- Acceso al repositorio del curso.

---

## 2. Iniciar Cloud Shell

1. Abre Google Cloud Console.
2. Selecciona el proyecto que utilizarás.
3. Pulsa el icono **Activate Cloud Shell / Activar Cloud Shell**.
4. Espera a que aparezca el terminal.

Cloud Shell incluye herramientas como `gcloud`, Git y otras utilidades comunes ya instaladas.

Comprueba:

```bash
gcloud --version
git --version
```

---

## 3. Confirmar el proyecto Google Cloud

```bash
gcloud config get-value project
```

Si necesitas cambiarlo:

```bash
gcloud config set project TU_PROJECT_ID
```

Verifica otra vez:

```bash
gcloud config get-value project
```

---

# Parte B — Configurar identidad Git

## 4. Configurar nombre y correo

Usa el nombre y correo asociados a tu identidad de desarrollo.

```bash
git config --global user.name "TU_NOMBRE"
git config --global user.email "TU_EMAIL_GITHUB"
```

Verifica:

```bash
git config --global --list
```

---

# Parte C — Autenticar Cloud Shell con GitHub mediante SSH

## 5. Verificar si ya existe una clave SSH

```bash
ls -la ~/.ssh
```

Busca archivos como:

```text
id_ed25519
id_ed25519.pub
```

Si no existen, genera una clave nueva.

---

## 6. Generar una clave SSH

Ejecuta:

```bash
ssh-keygen -t ed25519 -C "TU_EMAIL_GITHUB"
```

Cuando pregunte dónde guardar la clave, para el laboratorio puedes aceptar la ruta propuesta:

```text
~/.ssh/id_ed25519
```

Puedes definir una passphrase para proteger la clave privada.

> Nunca compartas `id_ed25519`. El archivo que se copia a GitHub es únicamente el archivo `.pub`.

---

## 7. Iniciar ssh-agent

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Comprueba las claves cargadas:

```bash
ssh-add -l
```

---

## 8. Mostrar la clave pública

```bash
cat ~/.ssh/id_ed25519.pub
```

Copia todo el contenido mostrado.

Debe comenzar normalmente con algo similar a:

```text
ssh-ed25519 AAAA...
```

---

## 9. Agregar la clave pública en GitHub

En GitHub:

```text
Settings
→ SSH and GPG keys
→ New SSH key
```

Completa:

```text
Title: Google Cloud Shell - DMC
Key type: Authentication Key
Key: pegar el contenido de id_ed25519.pub
```

Guarda la clave.

---

## 10. Probar la conexión

En Cloud Shell:

```bash
ssh -T git@github.com
```

La primera vez puedes recibir una pregunta sobre la autenticidad del host.

Verifica la huella publicada por GitHub antes de aceptar.

Si todo funciona, recibirás un mensaje similar a:

```text
Hi TU_USUARIO! You've successfully authenticated, but GitHub does not provide shell access.
```

Ese mensaje significa que la autenticación SSH funciona.

---

# Parte D — Clonar el repositorio

## 11. Obtener la URL SSH

En GitHub abre el repositorio:

```text
Code
→ SSH
```

Ejemplo:

```text
git@github.com:JuliusCordova/dmc_taller_arquitectura_bd_apps_con_ia.git
```

---

## 12. Crear una carpeta de trabajo

```bash
mkdir -p ~/code
cd ~/code
```

Clona:

```bash
git clone git@github.com:JuliusCordova/dmc_taller_arquitectura_bd_apps_con_ia.git
```

Entra al repo:

```bash
cd dmc_taller_arquitectura_bd_apps_con_ia
```

Verifica:

```bash
git status
git remote -v
```

---

# Parte E — Flujo Git para los talleres

## 13. Actualizar `main`

```bash
git checkout main
git pull origin main
```

---

## 14. Crear rama

Ejemplo para la Sesión 4:

```bash
git checkout -b feature/modelo-conceptual-mi-equipo
```

Verifica:

```bash
git branch --show-current
```

Nunca realizar el taller directamente sobre `main`.

---

## 15. Editar archivos

Puedes usar:

- Cloud Shell Editor;
- `nano`;
- `vim`;
- Gemini CLI;
- Claude Code si está instalado y configurado;
- otras herramientas disponibles en el entorno.

Para abrir el editor integrado puedes utilizar la interfaz de Cloud Shell Editor.

---

## 16. Revisar cambios

```bash
git status
git diff
```

Antes de versionar, verifica:

- solo cambiaron los archivos esperados;
- no existen claves ni secretos;
- no existen archivos temporales;
- no se modificó `main` directamente.

---

## 17. Crear commit

```bash
git add docs/modelos docs/prompts
git status
```

Luego:

```bash
git commit -m "docs: agregar modelo conceptual"
```

---

## 18. Push de la rama

```bash
git push -u origin feature/modelo-conceptual-mi-equipo
```

Después del primer push bastará normalmente:

```bash
git push
```

---

# Parte F — Crear Pull Request

## 19. Opción desde GitHub web

1. Abre el repositorio en GitHub.
2. GitHub normalmente detectará la rama recién publicada.
3. Pulsa **Compare & pull request**.
4. Revisa que:
   - base = `main`;
   - compare = tu rama.
5. Escribe el objetivo del cambio.
6. Incluye validaciones realizadas.
7. Crea el PR.

No lo fusiones hasta terminar la revisión.

---

## 20. Opción mediante GitHub CLI

Si `gh` está disponible y autenticado:

```bash
gh auth login
gh auth status
```

Luego:

```bash
gh pr create
```

Sigue las preguntas de la CLI.

---

# Parte G — Flujo recomendado con Gemini CLI en Cloud Shell

## 21. Verificar Gemini CLI

Cloud Shell puede incluir Gemini CLI preinstalado según el entorno disponible.

Prueba:

```bash
gemini --version
```

Si está disponible:

```bash
cd ~/code/dmc_taller_arquitectura_bd_apps_con_ia
gemini
```

Gemini CLI en Cloud Shell suele aprovechar las credenciales del entorno Google Cloud; la configuración exacta puede depender del tipo de cuenta.

---

## 22. Usar ATLAS dentro del repositorio

Ejemplo:

```text
## ACTOR
Actúa como Arquitecto de Datos y especialista SDD.

## TAREA
Lee la Specification del caso y construye el modelo conceptual.

## LÍMITES
No generes SQL.
No inventes cardinalidades.
No edites fuera de docs/modelos y docs/prompts.

## AUTOVALIDACIÓN
Revisa trazabilidad, relaciones y preguntas pendientes.

## SALIDA
Escribe los artefactos de la Sesión 4.
Muestra git diff.
No realices commit, push o merge sin autorización.
```

---

# Parte H — Problemas frecuentes

## 23. `Permission denied (publickey)`

Revisa:

```bash
ls -la ~/.ssh
ssh-add -l
```

Si la clave no está cargada:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Verifica que `id_ed25519.pub` esté registrado en GitHub.

Prueba nuevamente:

```bash
ssh -T git@github.com
```

---

## 24. Cloné con HTTPS y Git me pide autenticación

Para el laboratorio, si ya configuraste SSH, cambia el remoto:

```bash
git remote set-url origin git@github.com:OWNER/REPOSITORY.git
```

Confirma:

```bash
git remote -v
```

---

## 25. Hice cambios en `main`

No hagas push todavía.

Crea una rama conservando tus cambios:

```bash
git switch -c feature/mi-cambio
```

Luego revisa:

```bash
git status
```

---

## 26. El push fue rechazado

Primero entiende la causa.

No uses `--force` como solución automática.

Verifica:

```bash
git status
git branch --show-current
git remote -v
```

Si el remoto tiene cambios, sincroniza de forma controlada y resuelve conflictos conscientemente.

---

# Parte I — Checklist del alumno

- [ ] Cloud Shell abre correctamente.
- [ ] El proyecto GCP correcto está seleccionado.
- [ ] `git --version` funciona.
- [ ] Nombre y correo Git están configurados.
- [ ] Existe una clave SSH.
- [ ] Solo la clave pública fue agregada a GitHub.
- [ ] `ssh -T git@github.com` reconoce al usuario.
- [ ] El repo fue clonado mediante SSH.
- [ ] `git remote -v` muestra el remoto correcto.
- [ ] Se creó una rama de trabajo.
- [ ] `git diff` se revisa antes del commit.
- [ ] El push se realiza sobre la rama.
- [ ] El PR apunta hacia `main`.
- [ ] No se realiza merge sin revisión.

---

# Parte J — Evidencia de laboratorio

El alumno debe guardar:

```text
evidence/github_setup/
├── git_status.txt
├── git_remote.txt
├── branch.txt
└── README.md
```

Sin almacenar:

- claves privadas;
- tokens;
- API keys;
- secretos;
- credenciales.

Ejemplo:

```bash
mkdir -p evidence/github_setup
git status > evidence/github_setup/git_status.txt
git remote -v > evidence/github_setup/git_remote.txt
git branch --show-current > evidence/github_setup/branch.txt
```

Antes de commit revisa que los archivos no contengan información sensible.

---

## Fuentes oficiales consultadas

- Google Cloud — Cloud Shell documentation: https://docs.cloud.google.com/shell/docs
- Google Cloud — Use version control with Cloud Shell Editor: https://docs.cloud.google.com/shell/docs/version-control
- GitHub Docs — Adding a new SSH key: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
- GitHub Docs — Testing your SSH connection: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection
- Gemini CLI — Authentication setup: https://github.com/google-gemini/gemini-cli/blob/main/docs/get-started/authentication.mdx
