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
		}
	},
	telescope = {
		deps = { 'telescope' },
		maps = {
			{ 'n', '<C-P>', ':Telescope find_files<CR>', { desc = 'Find files' } },
			{ 'n', '<Leader>fh', ':Telescope live_grep<CR>', { desc = 'Grep find' } },
			{ 'n', '<Leader>r', ':Telescope oldfiles<CR>', { desc = 'Find recent files' } },
		}
	},
	toggleterm = {
		deps = { 'toggleterm' },
		maps = {
			{ 'n', '<A-g>', ':lua term_lazygit()<CR>', { desc = 'Open lazygit' } },
			{ 'n', '<A-d>', ':lua term_lazydocker()<CR>', { desc = 'Open lazydocker' } },
			{ 'n', '<A-y>', ':lua term_yazi()<CR>', { desc = 'Open yazi' } },
			{ 'n', '<A-s>', ':lua term_spt()<CR>', { desc = 'Open spt' } },
		}
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
				{ 'n', 'd', function()
					vim.diagnostic.open_float(nil, { border = 'rounded' })
					end, { desc = 'Open floating diagnostic' },
				},
			}
		end
	},
	spectre = {
		deps = { 'spectre' },
		leader = '<Leader>!',
		maps = function(spectre)
			return {
				{ 'n', 'o', spectre.toggle, { desc = 'Toggle spectre' } },
				{ 'n', 'p', function()
					spectre.open_file_search { select_word = true }
					end, {},
				},
				{ 'n', 'v', spectre.open_visual, {} },
				{ 'n', 'w', function()
					spectre.open_visual { select_word = true }
				end, {},
				},
			}
		end
	},
	hop = {
		deps = { 'hop', 'hop.hint' },
		maps = function(hop, hint)
			return {
				{ 'n', 'S', ':HopChar1<CR>', { desc = 'Find char' } },
				{ 'n', 's', ':HopChar2<CR>', { desc = 'Find chars' } },
				{ '', '<Leader>f', function()
					hop.hint_char1 {
						direction = modules[2].HintDirection.AFTER_CURSOR,
						current_line_only = true,
					}
					end, { remap = true, desc = 'Fined inline char' },
				},
				{
					'',
					'<Leader>F',
					function()
						hop.hint_char1 {
							direction = modules[2].HintDirection.BEFORE_CURSOR,
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
		end
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
		end
	}
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
