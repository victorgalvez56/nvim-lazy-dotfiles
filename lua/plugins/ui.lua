return { -- messages, cmdline and the popupmenu
{
    "folke/noice.nvim",
    opts = function(_, opts)
        opts = opts or {}
        opts.routes = opts.routes or {}
        table.insert(opts.routes, {
            filter = {
                event = "notify",
                find = "No information available"
            },
            opts = {
                skip = true
            }
        })

        local focused = true
        vim.api.nvim_create_autocmd("FocusGained", {
            callback = function()
                focused = true
            end
        })
        vim.api.nvim_create_autocmd("FocusLost", {
            callback = function()
                focused = false
            end
        })

        table.insert(opts.routes, 1, {
            filter = {
                cond = function()
                    return not focused
                end
            },
            view = "notify_send",
            opts = {
                stop = false
            }
        })

        opts.commands = {
            all = {
                view = "split",
                opts = {
                    enter = true,
                    format = "details"
                },
                filter = {}
            }
        }

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function(event)
                vim.schedule(function()
                    local ok, markdown = pcall(require, "noice.text.markdown")
                    if ok then
                        markdown.keys(event.buf)
                    else
                        vim.notify("Error loading noice.text.markdown", vim.log.levels.ERROR)
                    end
                end)
            end
        })

        opts.presets = opts.presets or {}
        opts.presets.lsp_doc_border = true
    end
}, {
    "rcarriga/nvim-notify",
    opts = {
        timeout = 5000
    }
}, {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
        opts = opts or {}
        opts.scroll = {
            enable = false
        }
    end
}, {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {{
        "<Tab>",
        "<Cmd>BufferLineCycleNext<CR>",
        desc = "Next tab"
    }, {
        "<S-Tab>",
        "<Cmd>BufferLineCyclePrev<CR>",
        desc = "Prev tab"
    }},
    opts = {
        options = {
            mode = "tabs",
            show_buffer_close_icons = false,
            show_close_icon = false
        }
    }
}, {
    "b0o/incline.nvim",
    dependencies = {"craftzdog/solarized-osaka.nvim"},
    event = "BufReadPre",
    priority = 1200,
    config = function()
        local ok, colors = pcall(require, "solarized-osaka.colors")
        if not ok then
            vim.notify("Error: solarized-osaka.colors not found", vim.log.levels.ERROR)
            return
        end

        colors = colors.setup()
        require("incline").setup({
            highlight = {
                groups = {
                    InclineNormal = {
                        guibg = colors.magenta500,
                        guifg = colors.base04
                    },
                    InclineNormalNC = {
                        guifg = colors.violet500,
                        guibg = colors.base03
                    }
                }
            },
            window = {
                margin = {
                    vertical = 0,
                    horizontal = 1
                }
            },
            hide = {
                cursorline = true
            },
            render = function(props)
                local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                if vim.bo[props.buf].modified then
                    filename = "[+] " .. filename
                end

                local icon, color = require("nvim-web-devicons").get_icon_color(filename)
                return {{
                    icon,
                    guifg = color
                }, {" "}, {filename}}
            end
        })
    end
}, {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
        opts = opts or {}
        local LazyVim = require("lazyvim.util")
        opts.sections = opts.sections or {}
        opts.sections.lualine_c = opts.sections.lualine_c or {}
        opts.sections.lualine_c[4] = {LazyVim.lualine.pretty_path({
            length = 0,
            relative = "cwd",
            modified_hl = "MatchParen",
            directory_hl = "",
            filename_hl = "Bold",
            modified_sign = "",
            readonly_icon = " 󰌾 "
        })}
    end
}, {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
        plugins = {
            gitsigns = true,
            tmux = true,
            kitty = {
                enabled = false,
                font = "+2"
            }
        }
    },
    keys = {{
        "<leader>z",
        "<cmd>ZenMode<cr>",
        desc = "Zen Mode"
    }}
}}
