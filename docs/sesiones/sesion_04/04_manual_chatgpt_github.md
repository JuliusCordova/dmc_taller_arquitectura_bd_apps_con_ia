# Manual 1 — Configurar ChatGPT con GitHub

## Objetivo

Permitir que el alumno conecte ChatGPT con un repositorio GitHub para consultar código y documentación, y comprenda qué opción utilizar cuando además necesita editar archivos, crear commits o abrir Pull Requests.

> Regla importante: **la app de GitHub en ChatGPT está orientada a lectura, búsqueda y análisis del repositorio. Para editar y enviar cambios a GitHub se debe utilizar Codex o un entorno de desarrollo con Git autenticado.**

---

## 1. Requisitos previos

- Cuenta de ChatGPT con acceso a Apps/Plugins según el plan disponible.
- Cuenta de GitHub.
- Acceso al repositorio que se utilizará en el curso.
- Para repositorios de una organización, autorización del administrador si la política de GitHub lo requiere.

Repositorio de referencia del curso:

```text
JuliusCordova/dmc_taller_arquitectura_bd_apps_con_ia
```

---

# Parte A — Conectar GitHub para lectura y análisis

## 2. Abrir la configuración de ChatGPT

1. Inicia sesión en ChatGPT.
2. Abre **Configuración**.
3. Ingresa a **Apps** o al directorio de **Plugins**, según la interfaz disponible en tu cuenta.
4. Busca **GitHub**.
5. Selecciona la integración de GitHub.
6. Pulsa **Conectar**.

ChatGPT te redirigirá a GitHub para autorizar el acceso.

---

## 3. Autorizar la aplicación en GitHub

En GitHub:

1. Inicia sesión con la cuenta que tiene acceso a los repositorios del curso.
2. Autoriza la aplicación solicitada por ChatGPT.
3. Selecciona una de estas opciones:
   - todos los repositorios permitidos;
   - solo repositorios seleccionados.
4. Para el curso, selecciona únicamente el repositorio con el que trabajarás.
5. Confirma la instalación/autorización.

### Recomendación académica

Aplicar mínimo privilegio:

```text
Acceso solo al repositorio del ejercicio
```

Evitar habilitar todos los repositorios personales si no es necesario.

---

## 4. Verificar que el repositorio aparece

De regreso en ChatGPT:

1. Abre **Configuración → Apps → GitHub**.
2. Confirma que GitHub figura como conectado.
3. Verifica que el repositorio esperado se encuentra disponible.

Puede existir un pequeño retraso entre la autorización y la aparición del repositorio.

Si el repositorio no aparece:

- confirma que la aplicación tiene acceso al repo en GitHub;
- verifica si el repo pertenece a una organización que requiere aprobación;
- revisa si la organización usa SSO;
- espera unos minutos y vuelve a intentarlo.

---

## 5. Prueba mínima de lectura

En un chat que tenga acceso a GitHub, utiliza una instrucción similar:

```text
Analiza el repositorio JuliusCordova/dmc_taller_arquitectura_bd_apps_con_ia.

Ubica docs/plan_capacitacion/01_silabo_programa_19_sesiones.md
y resume únicamente el contenido de la Sesión 4.

No utilices conocimiento externo.
Indica el archivo fuente utilizado.
```

### Resultado esperado

ChatGPT debe poder:

- localizar contenido del repositorio;
- leerlo;
- responder basándose en él;
- citar o identificar la fuente usada.

---

# Parte B — Entender el límite de escritura

## 6. La conexión GitHub de ChatGPT no equivale a Git autenticado

La app de GitHub en ChatGPT permite principalmente:

- buscar archivos;
- analizar código;
- leer Markdown y README;
- responder preguntas sobre el repositorio.

No debe asumirse que esta conexión permite automáticamente:

- modificar archivos;
- ejecutar `git commit`;
- hacer `git push`;
- crear Pull Requests.

Para trabajar sobre el repositorio con escritura se utiliza **Codex** o un entorno de desarrollo con Git autenticado.

---

# Parte C — Flujo de escritura con Codex

## 7. Cuándo usar Codex

Usa Codex cuando el ejercicio requiere algo como:

```text
Lee la Specification.
Crea una rama.
Genera el modelo conceptual.
Escribe los archivos Markdown.
Ejecuta validaciones.
Crea commits.
Abre un Pull Request.
```

En este escenario ya no estamos solamente consultando información: estamos realizando trabajo de ingeniería sobre el repositorio.

---

## 8. Flujo recomendado para el curso

```text
GitHub
   ↓
ChatGPT / Codex lee el contexto
   ↓
Prompt ATLAS
   ↓
Crear rama
   ↓
Modificar artefactos
   ↓
Validar
   ↓
Commit
   ↓
Pull Request
   ↓
Revisión humana
```

> Automatizar la producción no significa automatizar la aprobación.

---

## 9. Prompt ATLAS de validación

```text
## ACTOR

Actúa como Arquitecto de Datos y especialista en SDD.

## TAREA

Lee la DMC Application Specification del caso y revisa si el modelo conceptual propuesto es trazable a requisitos y reglas.

## LÍMITES

No inventes entidades, cardinalidades ni reglas.
No selecciones tecnología.
Cuando falte evidencia, crea una pregunta abierta.

## AUTOVALIDACIÓN

Comprueba que cada entidad y relación tenga una fuente verificable.

## SALIDA

Entrega una lista de hallazgos y archivos afectados.
No realices merge sin aprobación humana.
```

---

# Parte D — Solución de problemas

## 10. El repositorio privado no aparece

Verifica en GitHub:

```text
Settings
→ Applications
→ Installed GitHub Apps / Authorized GitHub Apps
→ ChatGPT / OpenAI
→ Configure
```

Confirma que el repositorio esté autorizado.

Si pertenece a una organización, puede ser necesaria la aprobación del administrador.

---

## 11. ChatGPT puede leer pero no escribir

Eso puede ser el comportamiento correcto de la integración de GitHub.

No intentes resolverlo dando más permisos a una integración que solo está diseñada para lectura.

Para escritura utiliza:

- Codex con GitHub;
- Git local autenticado;
- Cloud Shell autenticado con GitHub;
- otro agente de desarrollo que trabaje sobre un checkout real del repositorio.

---

## 12. Checklist de finalización

- [ ] GitHub aparece conectado en ChatGPT.
- [ ] El repositorio del curso está autorizado.
- [ ] El alumno puede consultar archivos del repositorio.
- [ ] El alumno entiende la diferencia entre lectura y escritura.
- [ ] El alumno sabe que los cambios deben pasar por una rama y un Pull Request.
- [ ] Ningún merge se realiza automáticamente durante el ejercicio.

---

## Fuentes oficiales consultadas

- OpenAI Help Center — Connecting GitHub to ChatGPT: https://help.openai.com/en/articles/11145903-
- OpenAI Help Center — Apps in ChatGPT: https://help.openai.com/en/articles/11487775-connectors-in

> Las pantallas pueden cambiar con el tiempo. Si un nombre de menú no coincide exactamente, buscar las secciones equivalentes **Apps**, **Plugins**, **GitHub** o configuración del workspace.