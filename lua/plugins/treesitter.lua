return {
	-- Playground for Treesitter, provides a way to inspect parsed trees
	{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			filters = {
				dotfiles = true,
			},
			-- List of languages to be installed automatically
			ensure_installed = {
				"astro",
				"cmake",
				"cpp",
				"css",
				"dart", -- Añadir Dart para soporte de Flutter
				"fish",
				"gitignore",
				"go",
				"graphql",
				"http",
				"java",
				"php",
				"rust",
				"scss",
				"sql",
				"svelte",
			},

			-- Enable query linter (helps with writing queries in Playground)
			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			},

			-- Configuration for the Treesitter Playground
			playground = {
				enable = true,
				disable = {}, -- List of disabled languages for Playground (empty means no disabled)
				updatetime = 25, -- Debounced time for highlighting nodes in Playground
				persist_queries = true, -- Keep queries across Neovim sessions
				keybindings = {
					toggle_query_editor = "o", -- Toggle the query editor
					toggle_hl_groups = "i", -- Toggle highlighting groups
					toggle_injected_languages = "t", -- Toggle injected languages
					toggle_anonymous_nodes = "a", -- Toggle anonymous nodes
					toggle_language_display = "I", -- Toggle language display
					focus_language = "f", -- Focus on a language
					unfocus_language = "F", -- Unfocus a language
					update = "R", -- Update the Playground
					goto_node = "<cr>", -- Go to the current node
					show_help = "?", -- Show help
				},
			},
		},
		config = function(_, opts)
			-- Apply the Treesitter configuration
			require("nvim-treesitter.configs").setup(opts)

			-- Add custom filetype for MDX
			vim.filetype.add({
				extension = {
					mdx = "mdx",
				},
			})

			-- Register the markdown parser for MDX files
			vim.treesitter.language.register("markdown", "mdx")
		end,
	},
}
