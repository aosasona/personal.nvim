return {
	{ "neovim/nvim-lspconfig", lazy = false },

	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ensure_installed = {
					"biome",
					"black",
					"codespell",
					"isort",
					"prettier",
					"prettierd",
					"stylua",
					"typstfmt",
					"yamlfmt",
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ast_grep",
					"astro",
					"biome",
					"css_variables",
					"cssmodules_ls",
					"cssls",
					"dockerls",
					"docker_compose_language_service",
					"emmet_ls",
					"gopls",
					"html",
					"jsonls",
					"lua_ls",
					"mdx_analyzer",
					"phpactor",
					"ruff_lsp",
					"sqls",
					"tailwindcss",
					"tinymist",
					"ts_ls",
					"yamlls",
					"vimls",
				},
			})
		end,
	},

	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({})
		end,
	},

	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascript = { "biome" },
					typescript = { "biome" },
					javascriptreact = { "biome" },
					typescriptreact = { "biome" },
					svelte = { "biome" },
					css = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					yaml = { "yamlfmt" },
					markdown = { "prettier" },
					graphql = { "prettier" },
					lua = { "stylua" },
					python = { "isort", "black" },
				},

				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				},
			})
		end,
	},
}
