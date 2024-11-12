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

return {
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
	-- UI
	'alpha',
	'toggleterm',
	'gitsigns',
	'wilder',
	'barbecue',
	'barbar',
	'telescope',
	'lualine',
	'neo-tree',
}
