local M = {}

function M.setup()
	local exclude_servers = { "rust_analyzer" }
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	require("mason-lspconfig").setup_handlers({
		function(server_name)
			if vim.tbl_contains(exclude_servers, server_name) then
				return
			end

			local opts = require("language_servers.options").merge_opts(server_name, { capabilities = capabilities })
			require("lspconfig")[server_name].setup(opts)
		end,
	})
end

return M
