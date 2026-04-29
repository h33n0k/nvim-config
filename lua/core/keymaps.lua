local M = {}

-- Exit Terminal Mode
vim.keymap.set('t', '<A-ESC>', '<C-\\><C-N>')

-- Clipboard
vim.keymap.set('', '<Leader>y', '"+y', { noremap = true, desc = 'Copy to system clipboard' }) -- yank to clipboard
vim.keymap.set('n', 'Y', 'y$', { desc = 'Yank to end of line' })
vim.keymap.set('x', '<A-p>', '"_dP', { desc = 'Paste without yanking' })
vim.keymap.set({ 'n', 'v' }, '<A-d>', '"_d', { desc = 'Delete without yanking' })

for _, key in pairs { 'p', 'P' } do -- remap paste command
	vim.keymap.set({ 'n', 'v' }, key, function()
		local count = vim.v.count1
		for _ = 1, count do
			vim.cmd('normal! ' .. key)
			vim.cmd 'normal! `[v`]' -- allow `gv` to select pasted content
			vim.cmd 'normal! =='
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, true, true), 'n', true)
		end
	end)
end

for _, key in pairs { 'p', 'P' } do -- paste from clipboard
	vim.keymap.set({ 'n', 'v' }, '<Leader>' .. key, function()
		local count = vim.v.count1
		for _ = 1, count do
			vim.cmd('normal! "+' .. key)
			vim.cmd 'normal! `[v`]' -- allow `gv` to select pasted content
			vim.cmd 'normal! =='
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, true, true), 'n', true)
		end
	end)
end

-- Select inner line
vim.keymap.set('n', '<A-v>', '^vg_', { noremap = true })
vim.keymap.set('v', '$', 'g_', { noremap = true }) -- Prevent selecting the newline (\n) at the end of the line

-- Move line
vim.keymap.set('n', '<Leader>j', function()
	vim.cmd('m .+' .. vim.v.count1)
end, { noremap = true, silent = true })

vim.keymap.set('n', '<Leader>k', function()
	vim.cmd('m .-' .. (vim.v.count1 + 1))
end, { noremap = true, silent = true })

-- Clear Highlights
vim.keymap.set('n', '<A-SPACE>', ':nohlsearch<CR>', { desc = 'Clear search highlights' })
vim.keymap.set('n', '<leader>ff', ':find ', { desc = 'Find file' })

-- Scroll up and down
vim.keymap.set('', '<C-e>', '10<C-E>', { desc = 'Scroll page down' })
vim.keymap.set('', '<C-y>', '10<C-Y>', { desc = 'Scroll page up' })
vim.keymap.set('', '<A-h>', '5h', { desc = 'Move 5 left' })
vim.keymap.set('', '<A-l>', '5l', { desc = 'Move 5 right' })
vim.keymap.set('', '<A-j>', '5j', { desc = 'Move 5 down' })
vim.keymap.set('', '<A-k>', '5k', { desc = 'Move 5 up' })

-- Panes
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { desc = 'Navigate top pane' })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { desc = 'Navigate bottom pane' })
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { desc = 'Navigate left pane' })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { desc = 'Navigate right pane' })
vim.keymap.set('n', '<C-A-h>', ':vertical resize -15<CR>', { desc = 'Shrink pane horizontaly' })
vim.keymap.set('n', '<C-A-j>', ':horizontal resize -5<CR>', { desc = 'Shrink pane verticaly' })
vim.keymap.set('n', '<C-A-k>', ':horizontal resize +5<CR>', { desc = 'Expand pane verticaly' })
vim.keymap.set('n', '<C-A-l>', ':vertical resize +15<CR>', { desc = 'Expand pane horizontaly' })
vim.keymap.set('n', '<Leader>v', ':vs<CR>', { desc = 'Vertical split' })
vim.keymap.set('n', '<Leader>s', ':split<CR>', { desc = 'Horizontal split' })

-- Tabs
vim.api.nvim_create_autocmd('VimEnter', {
	callback = function()
		vim.keymap.set('n', '<A-,>', ':BufferPrevious<CR>', { noremap = true, silent = true, desc = 'Previous buffer' })
		vim.keymap.set('n', '<A-;>', ':BufferNext<CR>', { noremap = true, silent = true, desc = 'Next buffer' })
		vim.keymap.set('n', '<A-c>', ':BufferClose<CR>', { desc = 'Close tab' })
		vim.keymap.set('n', '<AS-c>', ':BufferCloseAllButCurrent<CR>', { desc = 'Close all other tabs' })
		vim.keymap.set('n', '<AS-;>;', ':BufferMoveNext<CR>', { desc = 'Move tab right' })
		vim.keymap.set('n', '<AS-,>', ':BufferMovePrevious<CR>', { desc = 'Move tab left' })
	end,
})

-- Buffers
vim.keymap.set('n', '<Leader>q', ':q<CR>', { desc = 'Quit buffer' })
vim.keymap.set('n', '<Leader>Q', ':qall<CR>', { desc = 'Quit all buffers' })
vim.keymap.set('n', '<Leader>w', ':w<CR>', { desc = 'Write buffer' })
vim.keymap.set('n', '<Leader>x', ':wqa<CR>', { desc = 'Write and quit all buffers' })
vim.keymap.set('n', '<Leader>R', ':e!<CR>', { desc = 'Reload buffer' })

-- Plugins Keymaps

local keymaps = {
	neotree = {
		deps = { 'neo-tree' },
		maps = {
			{ 'n', '<A-n>', ':NeoTreeFocusToggle<CR>', { desc = 'Open file tree' } },
			{ 'n', '<A-f>', ':NeoTreeFloatToggle<CR>', { desc = 'Open floating file tree' } },
		},
	},
	telescope = {
		deps = { 'telescope' },
		maps = {
			{ 'n', '<C-P>', ':Telescope find_files<CR>', { desc = 'Find files' } },
			{ 'n', '<Leader>fh', ':Telescope live_grep<CR>', { desc = 'Grep find' } },
			{ 'n', '<Leader>r', ':Telescope oldfiles<CR>', { desc = 'Find recent files' } },
		},
	},
	toggleterm = {
		deps = { 'toggleterm' },
		maps = {
			{ 'n', '<A-g>', ':lua term_lazygit()<CR>', { desc = 'Open lazygit' } },
			{ 'n', '<A-d>', ':lua term_lazydocker()<CR>', { desc = 'Open lazydocker' } },
			{ 'n', '<A-y>', ':lua term_yazi()<CR>', { desc = 'Open yazi' } },
			{ 'n', '<A-s>', ':lua term_spt()<CR>', { desc = 'Open spt' } },
		},
	},
	cmp = {
		deps = { 'cmp', 'telescope.builtin' },
		leader = '<Leader>l',
		maps = function(cmp, telescope)
			return {
				{ 'n', 'gr', require('telescope.builtin').lsp_references, { desc = 'Browse references' } },
				{ 'n', 'r', vim.lsp.buf.rename, { desc = 'LSP rename' } },
				{ 'n', 'ca', vim.lsp.buf.code_action, { desc = 'Code action' } },
				{ 'n', 'D', vim.lsp.buf.definition, { desc = 'See definition' } },
				{ 'n', 'i', vim.lsp.buf.implementation, { desc = 'Goto implementation' } },
				{ 'n', 'l', vim.lsp.buf.hover, { desc = 'LSP documentation' } },
				{
					'n',
					'd',
					function()
						vim.diagnostic.open_float(nil, { border = 'rounded' })
					end,
					{ desc = 'Open floating diagnostic' },
				},
			}
		end,
	},
	spectre = {
		deps = { 'spectre' },
		leader = '<Leader>!',
		maps = function(spectre)
			return {
				{ 'n', 'o', spectre.toggle, { desc = 'Toggle spectre' } },
				{
					'n',
					'p',
					function()
						spectre.open_file_search { select_word = true }
					end,
					{},
				},
				{ 'n', 'v', spectre.open_visual, {} },
				{
					'n',
					'w',
					function()
						spectre.open_visual { select_word = true }
					end,
					{},
				},
			}
		end,
	},
	hop = {
		deps = { 'hop', 'hop.hint' },
		maps = function(hop, hint)
			return {
				{ 'n', 'S', ':HopChar1<CR>', { desc = 'Find char' } },
				{ 'n', 's', ':HopChar2<CR>', { desc = 'Find chars' } },
				{
					'',
					'<Leader>f',
					function(_, hint)
						hop.hint_char1 {
							direction = hint.HintDirection.AFTER_CURSOR,
							current_line_only = true,
						}
					end,
					{ remap = true, desc = 'Fined inline char' },
				},
				{
					'',
					'<Leader>F',
					function()
						hop.hint_char1 {
							direction = hint.HintDirection.BEFORE_CURSOR,
							current_line_only = true,
						}
					end,
					{ remap = true, desc = 'Find inline char' },
				},
				{
					'',
					'<Leader>t',
					function()
						hop.hint_char1 {
							direction = hint.HintDirection.AFTER_CURSOR,
							current_line_only = true,
							hint_offset = -1,
						}
					end,
					{ remap = true, desc = 'To inline char' },
				},
				{
					'',
					'<Leader>T',
					function()
						hop.hint_char1 {
							direction = hint.HintDirection.BEFORE_CURSOR,
							current_line_only = true,
							hint_offset = 1,
						}
					end,
					{ remap = true, desc = 'To inline char previous' },
				},
			}
		end,
	},
	gitsigns = {
		deps = { 'gitsigns' },
		leader = '<Leader>g',
		maps = function(gitsigns)
			return {
				{ 'n', 'w', ':Gwrite<CR>', { desc = 'Add file' } },
				{ 'n', 'h', gitsigns.preview_hunk, { desc = 'Preview hunk' } },
				{ 'n', 'i', gitsigns.preview_hunk_inline, { desc = 'Preview Inline hunk' } },
				{
					'n',
					'b',
					function()
						gitsigns.blame_line { full = true }
					end,
					{ desc = 'Toggle Line Blame' },
				},
				{ 'n', 's', gitsigns.stage_hunk, { desc = 'Stage hunk' } },
				{ 'n', 'r', gitsigns.reset_hunk, { desc = 'Reset hunk' } },
				{ 'n', 'dv', ':Gvdiffsplit<CR>', { desc = 'Vertical Diff' } },
				{ 'n', 'ds', ':Ghdiffsplit<CR>', { desc = 'Horizontal Diff' } },
				{ 'n', 's', gitsigns.stage_hunk, { desc = 'Stage hunk' } },
				{ 'n', 'r', gitsigns.reset_hunk, { desc = 'Reset hunk' } },
				{
					'v',
					's',
					function()
						gitsigns.stage_hunk { vim.fn.line 'v', vim.fn.line '.' }
					end,
					{ desc = 'Stage selection' },
				},
				{
					'v',
					'r',
					function()
						gitsigns.reset_hunk { vim.fn.line 'v', vim.fn.line '.' }
					end,
					{ desc = 'Reset selection' },
				},
			}
		end,
	},
	treesitter = {
		deps = {
			'nvim-treesitter',
			'nvim-treesitter-textobjects.select',
			'nvim-treesitter-textobjects.swap',
			'nvim-treesitter-textobjects.move',
			'nvim-treesitter-textobjects.repeatable_move',
			'repeatable_move',
			'gitsigns',
		},
		maps = function(_, select, swap, move, to_repeat, repeat_move, gs)
			-- Git hunks
			local next_hunk, prev_hunk = repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
			local next_diagnostic, prev_diagnostic =
				repeat_move.make_repeatable_move_pair(vim.diagnostic.goto_next, vim.diagnostic.goto_prev)

			return {
				-- Object select/jump
				{
					{ 'x', 'o' },
					'a=',
					function()
						select.select_textobject('@assignment.outer', 'textobjects')
					end,
					{ desc = 'Select outer part of an assignment' },
				},

				{
					{ 'x', 'o' },
					'i=',
					function()
						select.select_textobject('@assignment.inner', 'textobjects')
					end,
					{ desc = 'Select inner part of an assignment' },
				},

				{
					{ 'x', 'o' },
					'l=',
					function()
						select.select_textobject('@assignment.lhs', 'textobjects')
					end,
					{ desc = 'Select left hand side of an assignment' },
				},

				{
					{ 'x', 'o' },
					'r=',
					function()
						select.select_textobject('@assignment.rhs', 'textobjects')
					end,
					{ desc = 'Select right hand side of an assignment' },
				},

				-- Property
				{
					{ 'x', 'o' },
					'ao',
					function()
						select.select_textobject('@property.outer', 'textobjects')
					end,
					{ desc = 'Select outer part of an object property' },
				},

				{
					{ 'x', 'o' },
					'io',
					function()
						select.select_textobject('@property.inner', 'textobjects')
					end,
					{ desc = 'Select inner part of an object property' },
				},

				{
					{ 'x', 'o' },
					'lo',
					function()
						select.select_textobject('@property.lhs', 'textobjects')
					end,
					{ desc = 'Select left part of an object property' },
				},

				{
					{ 'x', 'o' },
					'ro',
					function()
						select.select_textobject('@property.rhs', 'textobjects')
					end,
					{ desc = 'Select right part of an object property' },
				},

				-- Argument/Parameter
				{
					{ 'x', 'o' },
					'aa',
					function()
						select.select_textobject('@parameter.outer', 'textobjects')
					end,
					{ desc = 'Select outer part of a parameter/argument' },
				},

				{
					{ 'x', 'o' },
					'ia',
					function()
						select.select_textobject('@parameter.inner', 'textobjects')
					end,
					{ desc = 'Select inner part of a parameter/argument' },
				},

				-- Conditional
				{
					{ 'x', 'o' },
					'ai',
					function()
						select.select_textobject('@conditional.outer', 'textobjects')
					end,
					{ desc = 'Select outer part of a conditional' },
				},

				{
					{ 'x', 'o' },
					'ii',
					function()
						select.select_textobject('@conditional.inner', 'textobjects')
					end,
					{ desc = 'Select inner part of a conditional' },
				},

				-- Loop
				{
					{ 'x', 'o' },
					'al',
					function()
						select.select_textobject('@loop.outer', 'textobjects')
					end,
					{ desc = 'Select outer part of a loop' },
				},

				{
					{ 'x', 'o' },
					'il',
					function()
						select.select_textobject('@loop.inner', 'textobjects')
					end,
					{ desc = 'Select inner part of a loop' },
				},

				-- Function call
				{
					{ 'x', 'o' },
					'af',
					function()
						select.select_textobject('@call.outer', 'textobjects')
					end,
					{ desc = 'Select outer part of a function call' },
				},

				{
					{ 'x', 'o' },
					'if',
					function()
						select.select_textobject('@call.inner', 'textobjects')
					end,
					{ desc = 'Select inner part of a function call' },
				},

				-- Function definition
				{
					{ 'x', 'o' },
					'am',
					function()
						select.select_textobject('@function.outer', 'textobjects')
					end,
					{ desc = 'Select outer part of a method/function definition' },
				},

				{
					{ 'x', 'o' },
					'im',
					function()
						select.select_textobject('@function.inner', 'textobjects')
					end,
					{ desc = 'Select inner part of a method/function definition' },
				},

				-- Class
				{
					{ 'x', 'o' },
					'ac',
					function()
						select.select_textobject('@class.outer', 'textobjects')
					end,
					{ desc = 'Select outer part of a class' },
				},

				{
					{ 'x', 'o' },
					'ic',
					function()
						select.select_textobject('@class.inner', 'textobjects')
					end,
					{ desc = 'Select inner part of a class' },
				},

				-- Comment
				{
					{ 'x', 'o' },
					'ah',
					function()
						select.select_textobject('@comment.outer', 'textobjects')
					end,
					{ desc = 'Select outer part of a comment' },
				},

				{
					{ 'x', 'o' },
					'ih',
					function()
						select.select_textobject('@comment.inner', 'textobjects')
					end,
					{ desc = 'Select inner part of a comment' },
				},

				-- ===== SWAP =====

				{
					'n',
					'<leader>na',
					function()
						swap.swap_next '@parameter.inner'
					end,
					{ desc = 'Swap parameter with next' },
				},

				{
					'n',
					'<leader>n:',
					function()
						swap.swap_next '@property.outer'
					end,
					{ desc = 'Swap object property with next' },
				},

				{
					'n',
					'<leader>nm',
					function()
						swap.swap_next '@function.outer'
					end,
					{ desc = 'Swap function with next' },
				},

				{
					'n',
					'<leader>pa',
					function()
						swap.swap_previous '@parameter.inner'
					end,
					{ desc = 'Swap parameter with previous' },
				},

				{
					'n',
					'<leader>p:',
					function()
						swap.swap_previous '@property.outer'
					end,
					{ desc = 'Swap object property with previous' },
				},

				{
					'n',
					'<leader>pm',
					function()
						swap.swap_previous '@function.outer'
					end,
					{ desc = 'Swap function with previous' },
				},

				-- ===== MOVE =====

				-- Next start
				{
					{ 'n', 'x', 'o' },
					']f',
					function()
						move.goto_next_start('@call.outer', 'textobjects')
					end,
					{ desc = 'Next function call start' },
				},

				{
					{ 'n', 'x', 'o' },
					']m',
					function()
						move.goto_next_start('@function.outer', 'textobjects')
					end,
					{ desc = 'Next method/function def start' },
				},

				{
					{ 'n', 'x', 'o' },
					']c',
					function()
						move.goto_next_start('@class.outer', 'textobjects')
					end,
					{ desc = 'Next class start' },
				},

				{
					{ 'n', 'x', 'o' },
					']i',
					function()
						move.goto_next_start('@conditional.outer', 'textobjects')
					end,
					{ desc = 'Next conditional start' },
				},

				{
					{ 'n', 'x', 'o' },
					']l',
					function()
						move.goto_next_start('@loop.outer', 'textobjects')
					end,
					{ desc = 'Next loop start' },
				},

				{
					{ 'n', 'x', 'o' },
					']z',
					function()
						move.goto_next_start('@fold', 'folds')
					end,
					{ desc = 'Next fold' },
				},

				{
					{ 'n', 'x', 'o' },
					']h',
					function()
						move.goto_next_start('@comment.outer', 'textobjects')
					end,
					{ desc = 'Next comment start' },
				},

				-- Next end
				{
					{ 'n', 'x', 'o' },
					']F',
					function()
						move.goto_next_end('@call.outer', 'textobjects')
					end,
					{ desc = 'Next function call end' },
				},

				{
					{ 'n', 'x', 'o' },
					']M',
					function()
						move.goto_next_end('@function.outer', 'textobjects')
					end,
					{ desc = 'Next method/function def end' },
				},

				{
					{ 'n', 'x', 'o' },
					']C',
					function()
						move.goto_next_end('@class.outer', 'textobjects')
					end,
					{ desc = 'Next class end' },
				},

				{
					{ 'n', 'x', 'o' },
					']I',
					function()
						move.goto_next_end('@conditional.outer', 'textobjects')
					end,
					{ desc = 'Next conditional end' },
				},

				{
					{ 'n', 'x', 'o' },
					']L',
					function()
						move.goto_next_end('@loop.outer', 'textobjects')
					end,
					{ desc = 'Next loop end' },
				},

				{
					{ 'n', 'x', 'o' },
					']H',
					function()
						move.goto_next_end('@comment.outer', 'textobjects')
					end,
					{ desc = 'Next comment end' },
				},

				-- Previous start
				{
					{ 'n', 'x', 'o' },
					'[f',
					function()
						move.goto_previous_start('@call.outer', 'textobjects')
					end,
					{ desc = 'Previous function call start' },
				},

				{
					{ 'n', 'x', 'o' },
					'[m',
					function()
						move.goto_previous_start('@function.outer', 'textobjects')
					end,
					{ desc = 'Previous method/function def start' },
				},

				{
					{ 'n', 'x', 'o' },
					'[c',
					function()
						move.goto_previous_start('@class.outer', 'textobjects')
					end,
					{ desc = 'Previous class start' },
				},

				{
					{ 'n', 'x', 'o' },
					'[i',
					function()
						move.goto_previous_start('@conditional.outer', 'textobjects')
					end,
					{ desc = 'Previous conditional start' },
				},

				{
					{ 'n', 'x', 'o' },
					'[l',
					function()
						move.goto_previous_start('@loop.outer', 'textobjects')
					end,
					{ desc = 'Previous loop start' },
				},

				{
					{ 'n', 'x', 'o' },
					'[h',
					function()
						move.goto_previous_start('@comment.outer', 'textobjects')
					end,
					{ desc = 'Previous comment start' },
				},

				-- Previous end
				{
					{ 'n', 'x', 'o' },
					'[F',
					function()
						move.goto_previous_end('@call.outer', 'textobjects')
					end,
					{ desc = 'Previous function call end' },
				},

				{
					{ 'n', 'x', 'o' },
					'[M',
					function()
						move.goto_previous_end('@function.outer', 'textobjects')
					end,
					{ desc = 'Previous method/function def end' },
				},

				{
					{ 'n', 'x', 'o' },
					'[C',
					function()
						move.goto_previous_end('@class.outer', 'textobjects')
					end,
					{ desc = 'Previous class end' },
				},

				{
					{ 'n', 'x', 'o' },
					'[I',
					function()
						move.goto_previous_end('@conditional.outer', 'textobjects')
					end,
					{ desc = 'Previous conditional end' },
				},

				{
					{ 'n', 'x', 'o' },
					'[L',
					function()
						move.goto_previous_end('@loop.outer', 'textobjects')
					end,
					{ desc = 'Previous loop end' },
				},

				{
					{ 'n', 'x', 'o' },
					'[H',
					function()
						move.goto_previous_end('@comment.outer', 'textobjects')
					end,
					{ desc = 'Previous comment end' },
				},

				-- Repeatable Moves
				{ { 'n', 'x', 'o' }, ';', to_repeat.repeat_last_move_next, {} },
				{ { 'n', 'x', 'o' }, ',', to_repeat.repeat_last_move_previous, {} },
				{ { 'n', 'x', 'o' }, 'f', to_repeat.builtin_f_expr, { expr = true } },
				{ { 'n', 'x', 'o' }, 'F', to_repeat.builtin_F_expr, { expr = true } },
				{ { 'n', 'x', 'o' }, 't', to_repeat.builtin_t_expr, { expr = true } },
				{ { 'n', 'x', 'o' }, 'T', to_repeat.builtin_T_expr, { expr = true } },
				{ { 'n', 'x', 'o' }, ']g', next_hunk, {} },
				{ { 'n', 'x', 'o' }, '[g', prev_hunk, {} },
				{ { 'n', 'x', 'o' }, ']d', next_diagnostic, {} },
				{ { 'n', 'x', 'o' }, '[d', prev_diagnostic, {} },
			}
		end,
	},
}

function M.load(key)
	local kb = keymaps[key]
	if kb then
		-- Check dependencies
		local err_deps = ''
		local deps = {}
		for _, dep in pairs(kb.deps) do
			local status, d = pcall(require, dep)
			table.insert(deps, d)

			if not status then
				err_deps = err_deps .. (err_deps == '' and '' or ', ') .. '"' .. dep .. '"'
			end
		end

		if err_deps ~= '' then
			return vim.notify('Could not load keymaps for plugins ' .. err_deps .. '.', vim.log.levels.ERROR)
		end

		local mappings = kb.maps
		if type(mappings) == 'function' then
			mappings = mappings(unpack(deps))
		end

		for _, map in pairs(mappings) do
			local bind = map[2]
			if kb.leader then
				bind = kb.leader .. map[2]
			end
			vim.keymap.set(map[1], bind, map[3], map[4])
		end
	end
end

return M
