local config = {
	options = {
		["lua_ls"] = {
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
						return
					end
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						version = "LuaJIT",
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				})
			end,

			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
						path = vim.split(package.path, ";"),
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		},
		["tinymist"] = {
			settings = {
				offset_encoding = "utf-8",
				exportPdf = "onSave",
			},
		},
		["v_analyzer"] = {},
		["sqls"] = {
			cmd = { "sqls", "--config", "/Users/ayodeji/.config/sqls/config.yml" },
		},
		["gleam"] = {},
		["sourcekit"] = {
			capabilities = {
				workspace = {
					didChangeWatchedFiles = {
						dynamicRegistration = true,
					},
				},
			},
			root_dir = function(filename, _)
				local util = require("lspconfig.util")
				return util.root_pattern("buildServer.json")(filename)
					or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
					or util.root_pattern("Package.swift")(filename)
					or util.find_git_ancestor(filename)
			end,
		},
	},

	-- List of servers that are installed locally (i.e. not installed with mason)
	local_servers = {
		"v_analyzer",
		"sqls",
		"gleam",
		"sourcekit",
	},
}

local M = {}

function M.get_opts(server_name)
	return config.options[server_name]
end

function M.merge_opts(server_name, opts)
	if config.options[server_name] then
		return vim.tbl_deep_extend("force", config.options[server_name], opts)
	end

	return opts
end

function M.local_servers()
	return config.local_servers
end

return M
