-- Exit Terminal Mode
vim.keymap.set('t', '<A-ESC>', '<C-\\><C-N>')

-- Clipboard
vim.keymap.set('v', '<Leader>y', '"+y') -- yank to clipboard
vim.keymap.set('n', '<Leader>gv', '`[v`]') -- selected pasted command
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

-- Clear Highlights
vim.keymap.set('n', '<A-SPACE>', ':nohlsearch<CR>')

-- Scroll up and down
vim.keymap.set('', '<C-e>', '10<C-E>')
vim.keymap.set('', '<C-y>', '10<C-Y>')
vim.keymap.set('', '<A-h>', '5h')
vim.keymap.set('', '<A-l>', '5l')
vim.keymap.set('', '<A-j>', '5j')
vim.keymap.set('', '<A-k>', '5k')

-- Panes
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<Leader>h', ':vertical resize -15<CR>')
vim.keymap.set('n', '<Leader>j', ':horizontal resize -5<CR>')
vim.keymap.set('n', '<Leader>k', ':horizontal resize +5<CR>')
vim.keymap.set('n', '<Leader>l', ':vertical resize +15<CR>')
vim.keymap.set('n', '<Leader>v', ':vs<CR>')
vim.keymap.set('n', '<Leader>s', ':split<CR>')
vim.keymap.set('n', '<Leader>q', ':q<CR>')

-- NeoTree
vim.keymap.set('n', '<A-n>', ':NeoTreeFocusToggle<CR>')
vim.keymap.set('n', '<A-f>', ':NeoTreeFloatToggle<CR>')

-- Barbar
vim.keymap.set('', '<A-,>', ':BufferPrevious<CR>')
vim.keymap.set('', '<A-;>', ':BufferNext<CR>')
vim.keymap.set('', '<A-c>', ':BufferClose<CR>')
vim.keymap.set('', '<AS-c>', ':BufferCloseAllButCurrent<CR>')
vim.keymap.set('n', '<AS-,>', ':BufferMovePrevious<CR>')
vim.keymap.set('n', '<AS-;>', ':BufferMoveNext<CR>')

-- Telescope
vim.keymap.set('n', '<C-P>', ':Telescope find_files<CR>')
vim.keymap.set('n', '<Leader>fh', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<Leader>r', ':Telescope oldfiles<CR>')

-- Hop
vim.keymap.set('n', 'S', ':HopChar1<CR>')
vim.keymap.set('n', 's', ':HopChar2<CR>')
