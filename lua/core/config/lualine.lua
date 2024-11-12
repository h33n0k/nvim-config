local palette = require 'core.colors'

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
			b = { fg = modes[i][2], bg = nil, gui = 'bold' },
			c = { fg = palette.lavender, bg = nil },
			x = { fg = palette.overlay1, bg = nil },
			y = { fg = palette.overlay1, bg = nil },
			z = { fg = palette.overlay1, bg = nil }
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
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'filename', 'location', 'progress' },
		lualine_x = { 'encoding' },
		lualine_y = {
			function()
				return require 'lsp-status'.status()
			end
		},
		lualine_z = { 'filetype' }
	}
}
