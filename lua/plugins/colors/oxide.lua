return {
	"oxidescheme/nvim",
	name = "oxide",
	lazy = false,
	priority = 1000,
	config = function()
		require("oxide").setup()
	end,
}
