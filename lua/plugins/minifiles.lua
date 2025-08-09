return {{
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
        local mini_files = require("mini.files")

        mini_files.setup({
            -- Configuración específica
            windows = {
                preview = true,
                width_focus = 50
            }
        })

        -- Función personalizada para abrir mini.files en el directorio raíz
        local function open_in_project_root()
            local root = vim.fn.getcwd() -- Obtén el directorio raíz actual
            mini_files.open(root) -- Abre mini.files en ese directorio
        end

        -- Atajo de teclado para abrir en el directorio raíz
        vim.keymap.set("n", "<leader>mf", open_in_project_root, {
            desc = "Abrir mini.files en el proyecto actual"
        })
    end
}}
