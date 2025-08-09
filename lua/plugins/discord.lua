return {{
    "andweeb/presence.nvim",
    config = function()
        require("presence"):setup({
            auto_update = true,
            debounce_timeout = 10,
            main_image = "neovim",
            neovim_image_text = "Mastering Neovim!",

            -- Textos dinámicos
            editing_text = "Hacking a lot %s",
            file_explorer_text = "Exploring %s",
            git_commit_text = "Crafting a commit",
            reading_text = "Reading %s",
            workspace_text = "In %s workspace",
            line_number_text = "Line %s of %s",

            -- Botones y tiempo
            buttons = true,
            show_time = true
        })
    end
}}
