local palette = require 'core.colors'
local noice = require 'noice'

local transparent = {}
transparent.theme = function()
	local modes = {
		{ 'normal', palette.mauve },
		{ 'visual', palette.peach },
		{ 'insert', palette.sky },
		{ 'command', palette.yellow },
		{ 'replace', palette.red },
	}

	local theme = {}
	for i = 1, #modes do
		theme[modes[i][1]] = {
			a = { fg = palette.base, bg = modes[i][2], gui = 'bold' },
			b = { fg = palette.rosewater, bg = nil, gui = 'bold' },
			c = { fg = palette.overlay1, bg = nil },
			x = { fg = palette.overlay1, bg = nil },
			y = { fg = palette.overlay1, bg = nil },
			z = { fg = palette.text, bg = nil }
		}
	end

	return theme

end

require 'lualine'.setup {
	options = {
		section_separators = '',
		component_separators = '',
		disabled_filetypes = {
			'packer',
			'neo-tree'
		},
		theme = transparent.theme()
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff' },
		lualine_c = {
			{ 'filename', color = { fg = palette.flamingo }},
			'diagnostics', 'filetype', 'location', 'progress',
      { noice.api.status.command.get, cond = noice.api.status.command.has, }},
		lualine_x = {
      { noice.api.status.message.get, cond = noice.api.status.message.has, },
      { noice.api.status.search.get, cond = noice.api.status.search.has, },
    },
		lualine_y = {},
		lualine_z = {
			function()
				return require 'lsp-status'.status()
			end
		}
	}
}
