-- General
vim.opt.mouse = 'a'																-- Enable mouse support
vim.opt.swapfile = true													-- Use swapfile
vim.opt.completeopt = 'menuone,noinsert,noselect'	-- Autocomplete options

-- Neovim UI
vim.opt.signcolumn = 'auto:3'
vim.opt.number = true						-- Show line number
vim.opt.relativenumber = true		-- Show relative line numbers
vim.opt.numberwidth = 3
vim.opt.cursorline = true				-- Highlight hovered line
vim.opt.showmatch = true        -- Highlight matching parenthesis
vim.opt.splitright = true       -- Vertical split to the right
vim.opt.splitbelow = true       -- Horizontal split to the bottom
vim.opt.ignorecase = true       -- Ignore case letters when search
vim.opt.smartcase = true        -- Ignore lowercase for the whole pattern
vim.opt.linebreak = true        -- Wrap on word boundary
vim.opt.termguicolors = true    -- Enable 24-bit RGB colors
vim.opt.laststatus=3            -- Set global statusline

-- Disable automatic commenting behavior
vim.opt.formatoptions:remove('c')
vim.opt.formatoptions:remove('r')
vim.opt.formatoptions:remove('o')

-- Tabs, indent, fold, scroll
vim.opt.expandtab = false       -- Use tabs instead of spaces
vim.opt.shiftwidth = 2          -- Shift 2 spaces when tab
vim.opt.tabstop = 2             -- 1 tab = 2 spaces
vim.opt.softtabstop = 2
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.scrolloff = 5

-- Memory, CPU
vim.opt.hidden = true           -- Enable background buffers
vim.opt.history = 100           -- Remember N lines in history
vim.opt.lazyredraw = true       -- Faster scrolling
vim.opt.synmaxcol = 240         -- Max column for syntax highlight
vim.opt.updatetime = 10					-- ms to wait for trigger an event

-- Disable nvim intro
vim.opt.shortmess:append 'sI'
