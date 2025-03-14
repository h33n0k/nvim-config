-- Exit Terminal Mode
vim.keymap.set('t', '<A-ESC>', '<C-\\><C-N>')

-- Remap numbers for AZERTY keyboards
for i, key in pairs({ 'à', '&', 'é', '"', "'", '(', '-', 'è', '_', 'ç' }) do
	vim.keymap.set('n', key, ''..(i - 1), { noremap = true, silent = true })
	vim.keymap.set('n', ''..(i - 1), key, { noremap = true, silent = true })
end

-- Clipboard
vim.keymap.set('', '<Leader>y', '"+y', { noremap = true, desc = 'Copy to system clipboard' }) -- yank to clipboard
for _, key in pairs({ 'p', 'P' }) do -- remap paste command
	vim.keymap.set({ 'n', 'v' }, key, function ()
		local count = vim.v.count1
		for _ = 1, count do
			vim.cmd('normal! ' ..key)
			vim.cmd('normal! `[v`]') -- allow `gv` to select pasted content
			vim.cmd('normal! ==')
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, true, true), 'n', true)
		end
	end)
end

for _, key in pairs({ 'p', 'P' }) do -- paste from clipboard
	vim.keymap.set({ 'n', 'v' }, '<Leader>'..key, function ()
		local count = vim.v.count1
		for _ = 1, count do
			vim.cmd('normal! "+' ..key)
			vim.cmd('normal! `[v`]') -- allow `gv` to select pasted content
			vim.cmd('normal! ==')
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, true, true), 'n', true)
		end
	end)
end

-- Select inner line
vim.keymap.set('n', '<A-v>', '^vg_', { noremap = true })

-- Clear Highlights
vim.keymap.set('n', '<A-SPACE>', ':nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Scroll up and down
vim.keymap.set('', '<C-e>', '10<C-E>', { desc = 'Scroll page down' })
vim.keymap.set('', '<C-y>', '10<C-Y>', { desc = 'Scroll page up' })
vim.keymap.set('', '<A-h>', '5h')
vim.keymap.set('', '<A-l>', '5l')
vim.keymap.set('', '<A-j>', '5j')
vim.keymap.set('', '<A-k>', '5k')

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
vim.keymap.set('n', '<Leader>q', ':q<CR>', { desc = 'Quit buffer' })

-- Plugins Keymaps
for _, config in pairs {
	{ 'cmp', function ()
		local prefix = '<Leader>l'
		return {
			{ 'n', prefix ..'gr', require 'telescope.builtin'.lsp_references, { desc = 'Browse references' } },
			{ 'n', prefix ..'r', vim.lsp.buf.rename, { desc = 'LSP rename' } },
			{ 'n', prefix ..'ca', vim.lsp.buf.code_action, { desc = 'Code action' } },
			{ 'n', prefix ..'d', vim.lsp.buf.definition, { desc = 'See definition' } },
			{ 'n', prefix ..'i', vim.lsp.buf.implementation, { desc = 'Goto implementation' } },
			{ 'n', prefix ..'l', vim.lsp.buf.hover, { desc = 'LSP documentation' } },
			{ 'n', prefix ..'d', function () vim.diagnostic.open_float(nil, { border = 'rounded' }) end, { desc = 'Open floating diagnostic' } }
		}
	end },
	{ 'barbar', function()
		return {
			{ 'n', '<A-,>', ':BufferPrevious<CR>', { desc = 'Go to previous tab' } },
			{ 'n', '<A-;>', ':BufferNext<CR>', { desc = 'Go to next tab' } },
			{ 'n', '<A-c>', ':BufferClose<CR>', { desc = 'Close tab' } },
			{ 'n', '<AS-c>', ':BufferCloseAllButCurrent<CR>', { desc = 'Close all other tabs' } },
			{ 'n', '<AS-,>', ':BufferMovePrevious<CR>', { desc = 'Move tab left' } },
			{ 'n', '<AS-;>', ':BufferMoveNext<CR>', { desc = 'Move tab right' } }
		}
	end },
	{ 'telescope', function()
		return {
			{ 'n', '<C-P>', ':Telescope find_files<CR>', { desc = 'Find files' } },
			{ 'n', '<Leader>fh', ':Telescope live_grep<CR>', { desc = 'Grep find' } },
			{ 'n', '<Leader>r', ':Telescope oldfiles<CR>', { desc = 'Find recent files' } }
		}
	end },
	{ 'neo-tree', function()
		return {
			{ 'n', '<A-n>', ':NeoTreeFocusToggle<CR>', { desc = 'Open file tree' } },
			{ 'n', '<A-f>', ':NeoTreeFloatToggle<CR>', { desc = 'Open floating file tree' } }
		}
	end },
	{ 'spectre', function(modules)
		local prefix = '<Leader>!'
		return {
			{ 'n', prefix ..'o', modules[1].toggle, { desc = 'Toggle spectre' } },
			{ 'n', prefix ..'p', function () modules[1].open_file_search({ select_word = true }) end, {} },
			{ 'n', prefix ..'v', modules[1].open_visual, {} },
			{ 'n', prefix ..'w', function () modules[1].open_visual({ select_word = true }) end, {} }
		}
	end },
	{ { 'hop', 'hop.hint' }, function(modules)
		return {
			{ 'n', 'S', ':HopChar1<CR>', { desc = 'Find char' } },
			{ 'n', 's', ':HopChar2<CR>', { desc = 'Find chars' } },
			{ '', '<Leader>f', function ()
				modules[1].hint_char1({
					direction = modules[2].HintDirection.AFTER_CURSOR,
					current_line_only = true
				})
			end, { remap = true, desc = 'Fined inline char' } },
			{ '', '<Leader>F', function ()
				modules[1].hint_char1({
					direction = modules[2].HintDirection.BEFORE_CURSOR,
					current_line_only = true
				})
			end, { remap = true, desc = 'Find inline char' } },
			{ '', '<Leader>t', function ()
				modules[1].hint_char1({
					direction = modules[2].HintDirection.AFTER_CURSOR,
					current_line_only = true,
					hint_offset = -1
				})
			end, { remap = true, desc = 'To inline char' } },
			{ '', '<Leader>T', function ()
				modules[1].hint_char1({
					direction = modules[2].HintDirection.BEFORE_CURSOR,
					current_line_only = true,
					hint_offset = 1
				})
			end, { remap = true, desc = 'To inline char previous' } }
		}
	end },
	{ 'toggleterm', function()
		return {
			{ 'n', '<A-g>', ':lua term_lazygit()<CR>', { desc = 'Open lazygit' } },
			{ 'n', '<A-d>', ':lua term_lazydocker()<CR>', { desc = 'Open lazydocker' } },
			{ 'n', '<A-y>', ':lua term_yazi()<CR>', { desc = 'Open yazi' } },
			{ 'n', '<A-s>', ':lua term_spt()<CR>', { desc = 'Open spt' } },
		}
	end },
	{ 'gitsigns', function (modules)
		local prefix = '<Leader>g'
		return {
			{ 'n', prefix ..'w', ':Gwrite<CR>', { desc = 'Add file' } },
			{ 'n', prefix ..'h', modules[1].preview_hunk, { desc = 'Preview hunk' } },
			{ 'n', prefix ..'i', modules[1].preview_hunk_inline, { desc = 'Preview Inline hunk' } },
			{ 'n', prefix ..'b', function () modules[1].blame_line { full = true } end, { desc = 'Toggle Line Blame' } },
			{ 'n', prefix ..'s', modules[1].stage_hunk, { desc = 'Stage hunk' } },
			{ 'n', prefix ..'r', modules[1].reset_hunk, { desc = 'Reset hunk' } },
			{ 'n', prefix ..'dv', ':Gvdiffsplit<CR>', { desc = 'Vertical Diff' } },
			{ 'n', prefix ..'ds', ':Ghdiffsplit<CR>', { desc = 'Horizontal Diff' } },
			{ 'n', prefix ..'s', modules[1].stage_hunk, { desc = 'Stage hunk' } },
			{ 'n', prefix ..'r', modules[1].reset_hunk, { desc = 'Reset hunk' } },
			{ 'v', prefix ..'s', function () modules[1].stage_hunk({ vim.fn.line('v'), vim.fn.line('.') }) end, { desc = 'Stage selection' } },
			{ 'v', prefix ..'r', function () modules[1].reset_hunk({ vim.fn.line('v'), vim.fn.line('.') }) end, { desc = 'Reset selection' } }
		}
	end }
} do

	local dependencies = config[1]
	if type(config[1]) == 'string' then
		dependencies = { config[1] }
	end

	local status = true
	local modules = {}
	local err_dependencies = ''
	for _, dependency in pairs(dependencies) do
		local module_status, module = pcall(require, dependency)
		status = status and module_status
		table.insert(modules, module)
		if err_dependencies == '' then
			err_dependencies = '"' ..dependency ..'"'
		else
			err_dependencies = err_dependencies ..', "' ..dependency .. '"'
		end
	end

	if status then
		local mappings = config[2](modules)
		for _, map in pairs(mappings) do
			vim.keymap.set(map[1], map[2], map[3], map[4])
		end
	else
		vim.notify('Could not load keymaps for plugins ' ..err_dependencies ..'.', vim.log.levels.ERROR)
	end
end
