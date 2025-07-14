local servers = require 'core.configs.mason.servers'

require 'mason'.setup {
	ui = {
		border = 'rounded'
	}
}

merged = {}

-- Add formatters
for _, formatter in ipairs(servers.formatters or {}) do
	table.insert(merged, formatter)
end

-- Add lsp tools
for _, entry in ipairs(servers.lsp or {}) do
	if type(entry) == "string" then
		table.insert(merged, entry)
	elseif type(entry) == "table" and entry.server then
		table.insert(merged, entry.server)
	end
end

require 'mason-tool-installer'.setup {
	ensure_installed = merged,
	auto_update = true,
  run_on_start = true
}

require 'core.configs.mason.cmp'
require 'core.configs.mason.lsp'
require 'core.configs.mason.formatter'
