return {
	{ "sainnhe/gruvbox-material", as = "gruvbox-material", lazy = false },
	{ "nyoom-engineering/oxocarbon.nvim", lazy = false },
	{ "projekt0n/github-nvim-theme", lazy = false },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"AlexvZyl/nordic.nvim",
		config = function()
			require("nordic").load()
		end,
	},
	{
		"cdmill/neomodern.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("neomodern").setup({
				-- transparent = true,
			})
			require("neomodern").load()
		end,
	},
}
