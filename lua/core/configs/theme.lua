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
} do
	vim.api.nvim_set_hl(0, m[1], m[2])
end

-- -- LSP windows (not working..)
-- local _border = "single"

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
--   vim.lsp.handlers.hover, {
--     border = _border
--   }
-- )

-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
--   vim.lsp.handlers.signature_help, {
--     border = _border
--   }
-- )

-- vim.diagnostic.config{
--   float={border=_border}
-- }
