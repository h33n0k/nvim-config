local _theme = require 'core.configs.theme'
local noice = require 'noice'

local transparent = {}
transparent.theme = function()
	local modes = {
		{ 'normal', _theme.palette.mauve },
		{ 'visual', _theme.palette.peach },
		{ 'insert', _theme.palette.sky },
		{ 'command', _theme.palette.yellow },
		{ 'replace', _theme.palette.red },
	}

	local theme = {}
	for i = 1, #modes do
		theme[modes[i][1]] = {
			a = { fg = _theme.palette.base, bg = modes[i][2], gui = 'bold' },
			b = { fg = _theme.palette.rosewater, bg = nil, gui = 'bold' },
			c = { fg = _theme.palette.overlay1, bg = nil },
			x = { fg = _theme.palette.overlay1, bg = nil },
			y = { fg = _theme.palette.overlay1, bg = nil },
			z = { fg = _theme.palette.text, bg = nil },
		}
	end

	return theme
end

require('lualine').setup {
	options = {
		section_separators = '',
		component_separators = '',
		disabled_filetypes = {
			'packer',
			'neo-tree',
		},
		theme = transparent.theme(),
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff' },
		lualine_c = {
			{ 'filename', color = { fg = _theme.palette.flamingo } },
			'diagnostics',
			'filetype',
			'location',
			'progress',
			{ noice.api.status.command.get, cond = noice.api.status.command.has },
		},
		lualine_x = {
			{ noice.api.status.message.get, cond = noice.api.status.message.has },
			{ noice.api.status.search.get, cond = noice.api.status.search.has },
		},
		lualine_y = {},
		lualine_z = { 'lsp_status' },
	},
}
