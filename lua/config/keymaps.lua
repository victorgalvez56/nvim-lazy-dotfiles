local discipline = require("craftzdog.discipline")

discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }
-- Me shortcuts

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')
keymap.set("i", "<Leader>bt", "`", { noremap = true, silent = true })

-- Incrementar/decrementar
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Borrar una palabra hacia atrás
keymap.set("n", "dw", 'vb"_d')

-- Seleccionar todo
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Guardar con permisos de root (no funciona por ahora)
-- vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Deshabilitar continuaciones
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Lista de saltos
keymap.set("n", "<C-m>", "<C-i>", opts)

-- Nueva pestaña
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Dividir ventana
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Mover entre ventanas
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Redimensionar ventana
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnósticos
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<Leader>r", function()
	require("craftzdog.hsl").replaceHexWithHSL()
end)

keymap.set("n", "<Leader>i", function()
	require("craftzdog.lsp").toggleInlayHints()
end)

-- Formatear y guardar el archivo actual
keymap.set("n", "ff", function()
	vim.lsp.buf.format({ async = true })
	vim.cmd("w")
end, opts)

-- Terminal floatting
keymap.set("n", "<Leader>t¿", function()
	vim.cmd("ToggleTerm direction=float")
end, opts)
