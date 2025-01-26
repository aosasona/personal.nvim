return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("codecompanion").setup({
			adapters = {
				deepseek_r1 = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "deepseek_r1",
						schema = {
							model = { default = "deepseek-r1:8b" },
							num_ctx = { default = 131072 },
							num_predict = { default = -1 },
						},
					})
				end,
				llama3 = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "llama3",
						schema = {
							model = { default = "llama3.2:latest" },
							num_ctx = { default = 16384 },
							num_predict = { default = -1 },
						},
					})
				end,
			},
			strategies = {
				chat = { adapter = "llama3" },
				inline = { adapter = "llama3" },
			},
		})

		require("which-key").add({
			{ "<leader>a", group = "CodeCompanion" },
			{
				mode = { "n", "v" },
				{ "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "Open the action palette" },
				{ "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion Chat" },
				{ "<leader>ax", "<cmd>CodeCompanionChat<cr>", desc = "Clear chat buffer" },
				{ "<leader>ae", "<cmd>CodeCompanionChat /explain<cr>", desc = "Explain selected code" },
				{ "<leader>af", "<cmd>CodeCompanionChat /fix<cr>", desc = "Fix the selected code" },
			},
			{
				mode = { "v" },
				{
					"<leader>av",
					"<cmd>CodeCompanionChat Add<cr>",
					desc = "Add selected chat to the current chat buffer",
				},
				{
					"ga",
					"<cmd>CodeCompanionChat Add<cr>",
					desc = "Add selected chat to the current chat buffer",
				},
			},
		})
	end,
}
