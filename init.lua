-- Install packer
local packerPath = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

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

local bootstrap = ensure_packer()

-- Load plugins
require 'packer'.startup(function(use)
	use 'wbthomason/packer.nvim' -- packer itself

	local plugins = require 'core.plugins'
	for _, plugin in pairs(plugins) do use(plugin) end

	if bootstrap then require 'packer'.sync() end

end)

require 'core.config'
require 'core.options'
require 'core.autocmds'
require 'core.keymaps'
