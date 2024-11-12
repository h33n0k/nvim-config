require 'nvim-treesitter.configs'.setup {
	ensure_installed = require 'core.config.treesitter.langages',
	sync_install = false,
	autopairs = { enable = true },
	highlight = {
		enable = true,
		disable = { '' },
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { 'yaml' } },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<C-b>',
			node_incremental = '<C-b>',
			scope_incremental = false,
			node_decremental = '<bs>',
		},
	},
	refactor = require 'core.config.treesitter.refactor',
	textobjects = require 'core.config.treesitter.textobjects',
}
