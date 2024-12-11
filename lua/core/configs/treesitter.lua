require 'nvim-treesitter.configs'.setup {
	ignore_install = {},
	auto_install = true,
	modules = {},
	ensure_installed = {
		'c',
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
		'rust',
		'php'
	},
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
	refactor = {
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = 'grr',
			},
		},
		navigation = {
			enable = false,
			keymaps = {
				goto_definition = 'gnd',
				list_definitions = 'gnD',
				list_definitions_toc = 'gO',
				goto_next_usage = '<a-*>',
				goto_previous_usage = '<a-#>',
			}
		}
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- Assignment
				['a='] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
				['i='] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
				['l='] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
				['r='] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },
				-- Property
				['a:'] = { query = '@property.outer', desc = 'Select outer part of an object property' },
				['i:'] = { query = '@property.inner', desc = 'Select inner part of an object property' },
				['l:'] = { query = '@property.lhs', desc = 'Select left part of an object property' },
				['r:'] = { query = '@property.rhs', desc = 'Select right part of an object property' },
				-- Argument
				['aa'] = { query = '@parameter.outer', desc = 'Select outer part of a parameter/argument' },
				['ia'] = { query = '@parameter.inner', desc = 'Select inner part of a parameter/argument' },
				-- Conditional
				['ai'] = { query = '@conditional.outer', desc = 'Select outer part of a conditional' },
				['ii'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional' },
				-- Loop
				['al'] = { query = '@loop.outer', desc = 'Select outer part of a loop' },
				['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop' },
				-- Function call
				['af'] = { query = '@call.outer', desc = 'Select outer part of a function call' },
				['if'] = { query = '@call.inner', desc = 'Select inner part of a function call' },
				-- Function definition
				['am'] = { query = '@function.outer', desc = 'Select outer part of a method/function definition' },
				['im'] = { query = '@function.inner', desc = 'Select inner part of a method/function definition' },
				-- Class
				['ac'] = { query = '@class.outer', desc = 'Select outer part of a class' },
				['ic'] = { query = '@class.inner', desc = 'Select inner part of a class' },
			}
		},
		swap = {
			enable = true,
			swap_next = {
				['<leader>na'] = '@parameter.inner', -- swap parameters/argument with next
				['<leader>n:'] = '@property.outer', -- swap object property with next
				['<leader>nm'] = '@function.outer', -- swap function with next
			},
			swap_previous = {
				['<leader>pa'] = '@parameter.inner', -- swap parameters/argument with prev
				['<leader>p:'] = '@property.outer', -- swap object property with prev
				['<leader>pm'] = '@function.outer', -- swap function with previous
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				[']f'] = { query = '@call.outer', desc = 'Next function call start' },
				[']m'] = { query = '@function.outer', desc = 'Next method/function def start' },
				[']c'] = { query = '@class.outer', desc = 'Next class start' },
				[']i'] = { query = '@conditional.outer', desc = 'Next conditional start' },
				[']l'] = { query = '@loop.outer', desc = 'Next loop start' },
				[']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
			},
			goto_next_end = {
				[']F'] = { query = '@call.outer', desc = 'Next function call end' },
				[']M'] = { query = '@function.outer', desc = 'Next method/function def end' },
				[']C'] = { query = '@class.outer', desc = 'Next class end' },
				[']I'] = { query = '@conditional.outer', desc = 'Next conditional end' },
				[']L'] = { query = '@loop.outer', desc = 'Next loop end' },
			},
			goto_previous_start = {
				['[f'] = { query = '@call.outer', desc = 'Prev function call start' },
				['[m'] = { query = '@function.outer', desc = 'Prev method/function def start' },
				['[c'] = { query = '@class.outer', desc = 'Prev class start' },
				['[i'] = { query = '@conditional.outer', desc = 'Prev conditional start' },
				['[l'] = { query = '@loop.outer', desc = 'Prev loop start' },
			},
			goto_previous_end = {
				['[F'] = { query = '@call.outer', desc = 'Prev function call end' },
				['[M'] = { query = '@function.outer', desc = 'Prev method/function def end' },
				['[C'] = { query = '@class.outer', desc = 'Prev class end' },
				['[I'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
				['[L'] = { query = '@loop.outer', desc = 'Prev loop end' },
			},
		}
	}
}

local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'
vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)
vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })

-- Git Hunks
local gs = require 'gitsigns'
local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(
	function () gs.nav_hunk 'next' end,
	function () gs.nav_hunk 'prev' end
)
vim.keymap.set({ 'n', 'x', 'o' }, ']g', next_hunk_repeat)
vim.keymap.set({ 'n', 'x', 'o' }, '[g', prev_hunk_repeat)

-- LSP diagnostics
local next_diagnostic_repeat, prev_diagnostic_repeat = ts_repeat_move.make_repeatable_move_pair(vim.diagnostic.goto_next, vim.diagnostic.goto_prev)
vim.keymap.set({ 'n', 'x', 'o' }, ']e', next_diagnostic_repeat)
vim.keymap.set({ 'n', 'x', 'o' }, '[e', prev_diagnostic_repeat)
