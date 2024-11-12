-- Install packer
local packerPath

local function isWindows()
	return vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1
end

if isWindows() then
	local function get_env(var, default)
		local value = vim.fn.getenv(var)
		if value ~= nil and value ~= '' then
			return value
		else
			return default
		end
	end
	local local_appdata = get_env('LOCALAPPDATA', 'C:\\Users\\(nom_dutilisateur)\\AppData\\Local')
	packerPath = local_appdata .. '\\nvim-data\\site\\pack\\packer\\start\\packer.nvim'
else
	packerPath = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
end

local ensure_packer = function()
	if vim.fn.empty(vim.fn.glob(packerPath)) > 0 then
		vim.fn.system({
			'git',
			'clone',
			'--depth',
			'1',
			'https://github.com/wbthomason/packer.nvim',
			packerPath
		})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

ensure_packer()

-- Load plugins
require 'packer'.startup(function(use)
	use 'wbthomason/packer.nvim' -- packer itself

	local plugins = require 'core.plugins'
	for _, plugin in pairs(plugins) do use(plugin) end

end)

-- Load plugins configurations
local configs = require 'core.config'
for i = 1, #configs do

	local modules
	local file

	if type(configs[i]) == 'table' then
		if type(configs[i][1]) == 'table' then
			modules = configs[i][1]
		else
			modules = {configs[i][1]}
		end
		file = configs[i][2]
	else
		modules = {configs[i]}
		file = configs[i]
	end

	local pluginStatus = true
	for _, module in pairs(modules) do
		local module_status, _ = pcall(require, module)
		pluginStatus = module_status
	end

	file = 'core.config.'..file

	if pluginStatus then
		if not pcall(require, file) then
			if #modules == 1 then
				require(modules[1]).setup()
			end
		end
	end

end

require 'core.options'
require 'core.autocmds'
require 'core.keymaps'
