return {
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
	},
	{
		'saecki/crates.nvim',
		tag = 'stable',
		config = function()
			require('crates').setup()
		end,
	}
}
