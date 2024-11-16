require 'mason'.setup()

require 'core.configs.completion.cmp'
require 'core.configs.completion.lsp'

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded", -- Border style: "single", "double", "rounded", "solid", or "shadow"
})
