local M = {}

function M.setup()
	-- Highlight on yank
	vim.api.nvim_create_autocmd("TextYankPost", {
		desc = "Highlight when yanking (copying) text",
		group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
		callback = function()
			vim.highlight.on_yank()
		end,
	})

	-- Session loading (on enter and on exit)
	local resession = require("resession")
	local session_name = require("utils").get_session_name

	-- Auto-load sesison for current directory or branch (depending on where we"re at)
	vim.api.nvim_create_autocmd("VimEnter", {
		callback = function()
			-- Only load the session if nvim was started with no args
			if vim.fn.argc(-1) == 0 then
				resession.load(session_name(), { dir = "dirsession", silence_errors = true })
			end
		end,
	})

	-- Autosave on exit
	vim.api.nvim_create_autocmd("VimLeavePre", {
		callback = function()
			resession.save(session_name(), { dir = "dirsession", notify = false })
		end,
	})

	-- Autoformat on save
	vim.api.nvim_create_autocmd("BufWritePre", {
		callback = function()
			vim.lsp.buf.format({ async = false })
		end,
	})
end

return M
