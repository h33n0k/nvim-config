local keymap = vim.keymap

-- Exit Terminal Mode
keymap.set('t', '<A-ESC>', '<C-\\><C-N>')

-- Clear Highlights
keymap.set('n', '<A-SPACE>', ':nohlsearch<CR>')

-- Scroll up and down
keymap.set('', '<C-e>', '10<C-E>')
keymap.set('', '<C-y>', '10<C-Y>')
keymap.set('', '<A-j>', '5j')
keymap.set('', '<A-k>', '5k')

keymap.set('n', '<C-k>', ':wincmd k<CR>')
keymap.set('n', '<C-j>', ':wincmd j<CR>')
keymap.set('n', '<C-h>', ':wincmd h<CR>')
keymap.set('n', '<C-l>', ':wincmd l<CR>')

-- Resize vim panes
keymap.set('n', '<C-W>h', ':vertical resize -10<CR>')
keymap.set('n', '<C-W>j', ':horizontal resize -10<CR>')
keymap.set('n', '<C-W>k', ':horizontal resize +10<CR>')
keymap.set('n', '<C-W>l', ':vertical resize +10<CR>')

-- NeoTree
keymap.set('n', '<A-n>', ':NeoTreeFocusToggle<CR>')
keymap.set('n', '<A-f>', ':NeoTreeFloatToggle<CR>')

-- Barbar
keymap.set('', '<A-,>', ':BufferPrevious<CR>')
keymap.set('', '<A-;>', ':BufferNext<CR>')
keymap.set('', '<A-c>', ':BufferClose<CR>')
keymap.set('n', '<AS-,>', ':BufferMovePrevious<CR>')
keymap.set('n', '<AS-;>', ':BufferMoveNext<CR>')

-- Telescope
keymap.set('n', '<C-P>', ':Telescope find_files<CR>')
keymap.set('n', '<SPACE>fh', ':Telescope live_grep<CR>')
keymap.set('n', '<SPACE><SPACE>', ':Telescope oldfiles<CR>')

-- Hop
keymap.set('n', 'S', ':HopChar1<CR>')
keymap.set('n', 's', ':HopChar2<CR>')
