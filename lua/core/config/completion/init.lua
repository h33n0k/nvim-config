require 'core.config.completion.cmp'
require 'core.config.completion.lsp'

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded", -- Border style: "single", "double", "rounded", "solid", or "shadow"
})
