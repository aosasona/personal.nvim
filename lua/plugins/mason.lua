return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ensure_installed = {
					"codespell",
					"stylua",
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
				}
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

	{ "neovim/nvim-lspconfig", lazy = false },
}
