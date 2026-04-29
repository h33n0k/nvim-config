require('nvim-treesitter').install {
	'bash',
	'comment',
	'lua',
	'gitignore',
	'javascript',
	'json',
	'python',
	'scss',
	'sql',
	'tsx',
	'typescript',
}

vim.api.nvim_create_autocmd('FileType', {
	pattern = {
		'sh',
		'bash',
		'zsh',
		'svg',
		'html',
		'xml',
		'typescript',
		'typescriptreact',
		'gitignore',
		'javascript',
		'json',
		'sql',
		'css',
		'scss',
	},
	callback = function()
		vim.treesitter.start() -- highlighting
		vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- folds
		vim.wo.foldmethod = 'expr'
		vim.bo.indentexpr = 'v:lua.require\'nvim-treesitter\'.indentexpr()' -- indentation
	end,
})

require('nvim-treesitter-textobjects').setup {
	select = {
		lookahead = true,
		selection_modes = {
			['@parameter.outer'] = 'v', -- charwise
			['@function.outer'] = 'V', -- linewise
		},
		include_surrounding_whitespace = false,
	},
	move = {
		set_jumps = true,
	},
}
