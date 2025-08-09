local discipline = require("yolo.discipline")

discipline.cowboy()

local keymap = vim.keymap
local opts = {
    noremap = true,
    silent = true
}
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
keymap.set("i", "<Leader>bt", "`", {
    noremap = true,
    silent = true
})

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete back word
keymap.set("n", "dw", 'vb"_d')

-- Select all 
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Disable continuos
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- List of jumps
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move beetween tabs
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize windows
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
    vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<Leader>r", function()
    require("yolo.hsl").replaceHexWithHSL()
end)

keymap.set("n", "<Leader>i", function()
    require("yolo.lsp").toggleInlayHints()
end)

-- Format and save file current
keymap.set("n", "ff", function()
    vim.lsp.buf.format({
        async = true
    })
    vim.cmd("w")
end, opts)

-- Terminal floatting
keymap.set("n", "<Leader>t¿", function()
    vim.cmd("ToggleTerm direction=float")
end, opts)
