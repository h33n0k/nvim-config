local theme = require 'core.configs.theme'

local servers = require('core.configs.mason.servers').lsp

local navic = require 'nvim-navic'
local lsp_status = require 'lsp-status'

lsp_status.register_progress()
local capabilities =
	vim.tbl_extend('keep', require('cmp_nvim_lsp').default_capabilities() or {}, lsp_status.capabilities)

require('neodev').setup()

local defaultSetup = {
	navic = true,
}

local handlers = {
	['textDocument/hover'] = function(...)
		vim.lsp.handlers.hover(..., {
			border = theme.border,
		})
	end,
	['textDocument/signatureHelp'] = function(...)
		vim.lsp.handlers.signature_help(..., {
			border = theme.border,
		})
	end,
}

for _, server in pairs(servers) do
	local setup = defaultSetup
	local server_name

	if type(server) == 'table' then
		server_name = server.server
		setup.navic = server.navic
	else
		server_name = vim.split(server, '@')[1]
	end

	vim.lsp.config(server_name, {
		handlers = handlers,
		on_attach = function(client, bufnr)
			lsp_status.on_attach(client)
			if setup.navic then
				navic.attach(client, bufnr)
			end
		end,
		capabilities = capabilities,
	})

	vim.lsp.enable(server_name)
end
