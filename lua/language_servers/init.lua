local M = {}

function M.setup()
	vim.lsp.inlay_hint.enable(true) -- Enable inlay hints globally
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	-- For nvim-ufo
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	-- Setup local servers (i.e. not installed with mason)
	local local_servers = require("language_servers.options").local_servers()
	for _, server_name in ipairs(local_servers) do
		local opts = require("language_servers.options").merge_opts(server_name, { capabilities = capabilities })
		-- require("lspconfig")[server_name].setup(opts)
		vim.lsp.config(server_name, opts)
		vim.lsp.enable(server_name)
	end
end

return M
