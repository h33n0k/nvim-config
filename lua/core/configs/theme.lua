local palette = require 'core.colors'
require'catppuccin'.setup {
	flavour = 'macchiato',
	transparent_background = true
}

vim.cmd('colorscheme catppuccin')

for _, m in pairs {
	{ 'Normal', { bg = nil, ctermgb = nil } },
	{ 'IncSearch', { fg = palette.base, bg = palette.flamingo, bold = false } },
	{ 'LineNr', { fg = palette.overlay2, bg = nil, bold = false } },
	{ 'CursorLineNr', { fg = palette.lavender, bg = nil, bold = false } },
	{ 'FoldColumn', { fg = palette.blue, bg = nil, bold = false } },
	{ 'SignColumn', { fg = palette.sky, bg = nil, bold = false } },
	{ 'VertSplit', { fg = palette.sky, bg = nil, bold = false } },
	{ 'Visual', { fg = nil, bg = palette.surface1, bold = true } },
	{ 'FloatBorder', { fg = palette.sky, bg = nil } },
	{ 'CmpBorder', { fg = palette.mauve, bg = nil, bold = true } },
	{ 'CmpDocBorder', { fg = palette.pink, bg = nil, bold = true } },
	{ 'CursorLine', { bg = palette.surface0 } },
	{ 'TSDefinition', { bg = palette.surface1, fg = palette.sapphire, bold = true } },
	{ 'TSDefinitionUsage', { bg = palette.surface1, fg = palette.yellow, bold = true } }
} do
	vim.api.nvim_set_hl(0, m[1], m[2])
end
