local M = {}

M.flavour = 'macchiato'
M.palette = require('catppuccin.palettes').get_palette(flavour)

M.border = {
	{ '┌', 'FloatBorder' }, -- Top-left corner
	{ '─', 'FloatBorder' }, -- Top horizontal line
	{ '┐', 'FloatBorder' }, -- Top-right corner
	{ '│', 'FloatBorder' }, -- Right vertical line
	{ '┘', 'FloatBorder' }, -- Bottom-right corner
	{ '─', 'FloatBorder' }, -- Bottom horizontal line
	{ '└', 'FloatBorder' }, -- Bottom-left corner
	{ '│', 'FloatBorder' }, -- Left vertical line
}

require('catppuccin').setup {
	flavour = M.flavour,
	color_overrides = {},
	transparent_background = true,
	float = {
		transparent = true,
		-- solid = true,
	},
	integrations = {
		alpha = true,
		gitsigns = true,
		hop = true,
		noice = true,
		treesitter_context = true,
		treesitter = true,
		ufo = true,
		telescope = true,
	},
}

vim.cmd 'colorscheme catppuccin'

for _, m in pairs {
	{ 'Normal', { bg = nil, ctermgb = nil } },
	{ 'IncSearch', { fg = M.palette.base, bg = M.palette.flamingo, bold = false } },
	{ 'LineNr', { fg = M.palette.overlay2, bg = nil, bold = false } },
	{ 'CursorLineNr', { fg = M.palette.lavender, bg = nil, bold = false } },
	{ 'FoldColumn', { fg = M.palette.blue, bg = nil, bold = false } },
	{ 'SignColumn', { fg = M.palette.sky, bg = nil, bold = false } },
	{ 'VertSplit', { fg = M.palette.sky, bg = nil, bold = false } },
	{ 'Visual', { fg = nil, bg = M.palette.surface1, bold = true } },
	{ 'FloatBorder', { fg = M.palette.sky, bg = nil } },
	{ 'CmpBorder', { fg = M.palette.mauve, bg = nil, bold = true } },
	{ 'CmpDocBorder', { fg = M.palette.pink, bg = nil, bold = true } },
	{ 'CursorLine', { bg = '#25221f' } },
	{ 'TSDefinition', { bg = M.palette.surface1, fg = M.palette.sapphire, bold = true } },
	{ 'TSDefinitionUsage', { bg = M.palette.surface1, fg = M.palette.yellow, bold = true } },
} do
	vim.api.nvim_set_hl(0, m[1], m[2])
end

return M
