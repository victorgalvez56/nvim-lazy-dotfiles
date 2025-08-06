---

title: 🧠 Vim Keymaps & LazyVim Setup Summary
-------------------

## 📦 Plugin-Specific Keymaps

### 🧩 Plugin File Overview

* `lspconfig.lua` — LSP & Diagnóstico
* `nvimtree.lua` — Explorador de Archivos
* `telescope.lua` — Búsqueda en Proyecto
* `nvim-cmp.lua` — Autocompletado
* `dap_js.lua` — Depuración
* `lazy.lua` — Gestión de Plugins
* `formating.lua` — Formateo de Código
* `mason.lua` — Gestor de LSPs
* `comment.lua` — Comentado Rápido

### ⚙️ `lspconfig.lua`

* `<space>d` — Diagnóstico flotante
* `[d` / `]d` — Diagnóstico anterior / siguiente
* `<space>q` — Añadir diagnósticos a la lista
* `gD` / `gd` — Ir a declaración / definición
* `K` — Mostrar documentación
* `gi` — Ir a implementación
* `<C-k>` — Ayuda de firma
* `<space>wa`, `wr`, `wl` — Añadir / Eliminar / Listar carpetas del workspace
* `<space>D` — Ir a tipo
* `<space>rn` — Renombrar
* `<space>ca` — Acciones de código
* `gr` — Referencias
* `<space>f` — Formatear código

### 📁 `nvimtree.lua`

* `<leader>e` — Abrir/cerrar explorador
* `a`, `r`, `d` — Añadir, renombrar, eliminar
* `x`, `p`, `y` — Cortar, pegar, copiar
* `<CR>`, `o` — Abrir archivo
* `s` — Abrir en split horizontal

### 🔭 `telescope.lua`

* `<leader>ff` — Buscar archivos
* `<leader>fg` — Buscar texto (grep)
* `<leader>fb` — Buffers abiertos
* `<leader>fh` — Historial de archivos
* `<leader>fr` — Archivos recientes
* `<leader>fd` — Buscar en sistema
* `<leader>fP` — Archivos de plugins
* `;f` / `;r` — Buscar archivos / texto (respetando `.gitignore`)
* `\` — Buffers
* `;;` — Reanudar última búsqueda
* `;s` — Símbolos con Treesitter

### ✨ `nvim-cmp.lua`

* `<C-Space>` — Abrir menú
* `<Tab>` / `<S-Tab>` — Navegar en el menú
* `<CR>` — Confirmar selección
* `<C-e>` — Cerrar menú

### 🔧 `mason.lua`

* `:Mason` — Abrir Mason UI para LSPs

### 🧹 `formating.lua`

* `<space>f` — Formatear el archivo actual

### 🐞 `dap_js.lua`

* `<F5>` — Iniciar/continuar debug
* `<F10>` / `<F11>` / `<F12>` — Step over / into / out
* `<leader>db` — Toggle breakpoint

### 📦 `lazy.lua`

* `:Lazy` — Abrir interfaz de Lazy
* `:Lazy update` — Actualizar plugins

### 💬 `comment.lua`

* `gcc` — Comentar/descomentar línea

---

## ⚔️ Vim Motion Mastery

### 1. 📐 Categorías de Movimientos

* **Caracteres**: `h`, `l`, `Space`, `Backspace`
* **Palabras**: `w`, `e`, `b`, `ge`
* **Líneas**: `0`, `^`, `$`
* **Párrafos**: `{`, `}`
* **Búsqueda**: `/pattern`, `?pattern`
* **Objetos de texto**: `iw`, `aw`, `ip`, `ap`, etc.
* **Pantalla**: `H`, `M`, `L`

### 2. 🧱 Acciones + Movimientos

* `dw` — Eliminar hasta la siguiente palabra
* `d$` — Eliminar hasta el final de la línea
* `c}` — Cambiar hasta final de párrafo
* `yip` — Copiar párrafo completo

💡 **Usa `.` para repetir la última acción.**

### 3. 🧠 Objetos de Texto

* `iw`, `aw` — Palabras
* `is`, `as` — Frases
* `ip`, `ap` — Párrafos
* `i"`, `a(` — Dentro de comillas, paréntesis

Ejemplos útiles:

* `ciw` — Cambiar palabra
* `yi"` — Copiar contenido entre comillas
* `da(` — Eliminar bloque con paréntesis

### 4. ✂️ Comandos por Línea

* `dd`, `D` — Eliminar línea o desde el cursor
* `cc`, `C` — Cambiar línea o desde el cursor

### 5. 🏃‍♂️ Navegación Rápida

* `fx`, `tx`, `Fx`, `Tx` — Buscar caracteres hacia adelante o atrás
* `;`, `,` — Repetir búsqueda
* `%` — Saltar entre paréntesis, llaves, corchetes
* `G$` — Último carácter del último renglón

### 6. 🔍 Usar Búsqueda como Movimiento

* `/word`, `n`, `N` — Buscar siguiente / anterior
* `d/word` — Eliminar hasta la palabra
* `c?pattern` — Cambiar hasta patrón previo

### 7. 👀 Visual Mode

* `v`, `V`, `<C-v>` — Selección por carácter, línea o columna
* Combina con: `d`, `>`, `=` para borrar, indentar o autoformatear

### 8. 🧪 Ejercicios de Práctica

* `d,` — Eliminar hasta la próxima coma
* `ci{` — Cambiar todo dentro de llaves
* `2y}` — Copiar 2 párrafos
* `d/foo` — Eliminar hasta la palabra `foo`

---

## ✅ Consejos Finales

* Usa prefijos numéricos: `3w`, `5dd`, etc.
* Aprende de a pocos: domina 1-2 movimientos a la vez
* Aprovecha los registros (`"a`, `"b`) para reutilizar texto
