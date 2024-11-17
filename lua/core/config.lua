-- Plugins configuration
--------
-- Example :
-- return {
--	'plugin_name', -- load file named `plugin_name`.lua if exists or automaticly calls 'require(`plugin_name`).setup()' if plugin is loadable (pcall)
--	{
--		{
--			'required_plugin_1',
--			'required_plugin_2'
--		}, 'plugin_name' -- load file named `plugin_name`.lua if all required_plugins are loadable (pcall)
--	}
-- }
--------

local configs = {
	-- Theming
	{ { 'catppuccin' }, 'theme' },
	'smoothcursor',
	{ { 'ibl' }, 'indent-blankline' },
	-- Syntax / HighLighting
	'colorizer',
	{
		{ 'nvim-treesitter.configs' },
		'treesitter'
	},
	-- Writting
	'ufo',
	'marks',
	'hop',
	{ { 'nvim-autopairs' }, 'autopairs' },
	-- LSP / Completions
	{ { 'cmp', 'luasnip', 'lsp-status', 'cmp_nvim_lsp', 'mason-lspconfig', 'lspconfig', 'mason' },
		'completion' },
	'lsp_lines',
	-- DAP
	{ { 'dap', 'dapui' },
		'dap' },
	-- UI
	'alpha',
	'hlslens',
	'toggleterm',
	'gitsigns',
	'wilder',
	'barbecue',
	'barbar',
	'telescope',
	'lualine',
	'neo-tree',
}

-- Load plugins configurations
for i = 1, #configs do

	local modules
	local file

	if type(configs[i]) == 'table' then
		if type(configs[i][1]) == 'table' then
			modules = configs[i][1]
		else
			modules = {configs[i][1]}
		end
		file = configs[i][2]
	else
		modules = {configs[i]}
		file = configs[i]
	end

	local pluginStatus = true
	for _, module in pairs(modules) do
		local module_status, _ = pcall(require, module)
		pluginStatus = module_status
	end

	file = 'core.configs.'..file

	if pluginStatus then
		if not pcall(require, file) then
			if #modules == 1 then
				require(modules[1]).setup()
			end
		end
	end

end
