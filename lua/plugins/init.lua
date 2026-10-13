local plugins = {}

local function is_plugin_list(tbl)
	return type(tbl) == "table" and type(tbl[1]) == "table"
end

-- Load plugin definitions from a given folder (e.g. plugins or colors)
local function load_plugins_from(dir_name)
	local base_path = vim.fn.stdpath("config") .. "/lua/" .. dir_name

	-- Check outside of the lua folder
	if vim.fn.isdirectory(base_path) == 0 then
		base_path = vim.fn.stdpath("config") .. "/" .. dir_name
	end

	local files = vim.fn.globpath(base_path, "*.lua", false, true)

	for _, file in ipairs(files) do
		if not file:match("init.lua") then
			local plugin_name = file:match(dir_name .. "/(.*)"):gsub(".lua", "")
			local plugin = require(dir_name .. "." .. plugin_name)

			if is_plugin_list(plugin) then
				for _, plugin_definition in ipairs(plugin) do
					table.insert(plugins, plugin_definition)
				end
			else
				table.insert(plugins, plugin)
			end
		end
	end
end

-- Load plugins from both plugins and colors folders
load_plugins_from("plugins")
load_plugins_from("plugins/colors")

return plugins
