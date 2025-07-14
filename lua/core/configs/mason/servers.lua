return {
	formatters = {
		'prettier',
		'stylua',
		'isort',
		'black',
	},
	lsp = {
		-- Bash
		'bashls',
		'awk_ls',

		-- Python
		'pylsp',

		'lua_ls', -- lua

		-- Web
		{ server = 'emmet_ls', navic = false },

		-- C
		'clangd',
		'ast_grep',

		-- Typescript
		'biome',
		'ts_ls',
	},
}
