local servers = require 'core.configs.completion.lsp.servers'

local navic = require 'nvim-navic'
local lspconfig = require 'lspconfig'
local lsp_status = require 'lsp-status'

lsp_status.register_progress()
local capabilities = vim.tbl_extend('keep', require 'cmp_nvim_lsp'.default_capabilities() or {}, lsp_status.capabilities)
require 'mason-lspconfig'.setup {
	automatic_installation = true,
	ensure_installed = servers
}

for _, server in pairs(servers)  do
	server = vim.split(server, '@')[1]
	lspconfig[server].setup({
		on_attach = function(client, bufnr)
			local opts = { buffer = bufnr }
			lsp_status.on_attach(client)
			navic.attach(client, bufnr)
			vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		end,
		capabilities = capabilities,
	})
end
