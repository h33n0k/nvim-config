local keymap = vim.keymap

-- Exit Terminal Mode
keymap.set('t', '<A-Esc>', '<C-\\><C-n>')

-- Scroll up and down
keymap.set('', '<c-e>', '5<c-e>')
keymap.set('', '<c-y>', '5<c-y>')
keymap.set('', '<A-j>', '5j')
keymap.set('', '<A-k>', '5k')

-- Navigate vim panes
keymap.set('n', '<c-k>', ':wincmd k<CR>')
keymap.set('n', '<c-j>', ':wincmd j<CR>')
keymap.set('n', '<c-h>', ':wincmd h<CR>')
keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Resize vim panes
keymap.set('n', '<c-w>h', ':vertical resize -10<CR>')
keymap.set('n', '<c-o>j', ':horizontal resize -10<CR>')
keymap.set('n', '<c-w>k', ':horizontal resize +10<CR>')
keymap.set('n', '<c-w>l', ':vertical resize +10<CR>')

-- NeoTree
keymap.set('n', '<A-n>', ':NeoTreeFocusToggle<CR>')
keymap.set('n', '<A-f>', ':NeoTreeFloatToggle<CR>')

-- Barbar
keymap.set('', '<A-,>', ':BufferPrevious<CR>')
keymap.set('', '<A-;>', ':BufferNext<CR>')
keymap.set('', '<A-c>', ':BufferClose<CR>')
keymap.set('n', '<A-<>', ':BufferMovePrevious<CR>')
keymap.set('n', '<A->>', ':BufferMoveNext<CR>')

-- Telescope
keymap.set("n", "<c-p>", ":Telescope find_files<CR>")
keymap.set("n", "<Space>fh", ":Telescope live_grep<CR>")
keymap.set("n", "<Space><Space>", ":Telescope oldfiles<CR>")

-- Hop
keymap.set("n", "S", ":HopChar1<cr>")
keymap.set("n", "s", ":HopChar2<cr>")
