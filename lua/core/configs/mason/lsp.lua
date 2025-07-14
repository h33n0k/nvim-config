local servers = require 'core.configs.mason.servers'.lsp

local navic = require 'nvim-navic'
local lspconfig = require 'lspconfig'
local lsp_status = require 'lsp-status'

lsp_status.register_progress()
local capabilities = vim.tbl_extend('keep', require 'cmp_nvim_lsp'.default_capabilities() or {}, lsp_status.capabilities)

require 'neodev'.setup()

local defaultSetup = {
	navic = true
}

local border = {
	{"┌", "FloatBorder"}, -- Top-left corner
	{"─", "FloatBorder"}, -- Top horizontal line
	{"┐", "FloatBorder"}, -- Top-right corner
	{"│", "FloatBorder"}, -- Right vertical line
	{"┘", "FloatBorder"}, -- Bottom-right corner
	{"─", "FloatBorder"}, -- Bottom horizontal line
	{"└", "FloatBorder"}, -- Bottom-left corner
	{"│", "FloatBorder"}  -- Left vertical line
}

local handlers = {
	["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

for _, server in pairs(servers)  do
	local setup = defaultSetup
	if (type(server) == 'table') then
		setup.server = server.server
		setup.navic = server.navic
	else
		setup.server = vim.split(server, '@')[1]
	end
	lspconfig[setup.server].setup({
		handlers = handlers,
		on_attach = function(client, bufnr)
			lsp_status.on_attach(client)
			if setup.navic then
				navic.attach(client, bufnr)
			end
		end,
		capabilities = capabilities,
	})
end
