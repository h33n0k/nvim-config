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

require 'neodev'.setup()

local prefix = '<Leader>l'
for _, server in pairs(servers)  do
	server = vim.split(server, '@')[1]
	lspconfig[server].setup({
		on_attach = function(client, bufnr)
			lsp_status.on_attach(client)
			navic.attach(client, bufnr)
			for _, map in pairs {
				{ 'd', vim.diagnostic.open_float },
				{ 'gr', require 'telescope.builtin'.lsp_references },
				{ 'r', vim.lsp.buf.rename },
				{ 'ca', vim.lsp.buf.code_action },
				{ 'd', vim.lsp.buf.definition },
				{ 'i', vim.lsp.buf.implementation },
				{ 'l', vim.lsp.buf.hover },
				{ 'd', function () vim.diagnostic.open_float(nil, { border = 'rounded' }) end }
			} do
				vim.keymap.set('n', prefix ..map[1], map[2], { buffer = bufnr })
			end
		end,
		capabilities = capabilities,
	})
end
