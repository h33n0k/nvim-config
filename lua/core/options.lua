local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-- General
opt.mouse = 'a'																-- Enable mouse support
opt.swapfile = false													-- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'	-- Autocomplete options

-- Neovim UI
opt.number = true						-- Show line number
opt.relativenumber = true		-- Show relative line numbers
opt.cursorline = true				-- Highlight hovered line
opt.showmatch = true        -- Highlight matching parenthesis
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.linebreak = true        -- Wrap on word boundary
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus=3            -- Set global statusline

-- Tabs, indent, fold, scroll
opt.expandtab = false       -- Use tabs instead of spaces
opt.shiftwidth = 2          -- Shift 4 spaces when tab
opt.tabstop = 2             -- 1 tab == 4 spaces
opt.softtabstop = 2
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.scrolloff = 5
-- opt.smartindent = true      -- Autoindent new lines

-- Memory, CPU
opt.hidden = true           -- Enable background buffers
opt.history = 100           -- Remember N lines in history
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 10					-- ms to wait for trigger an event

-- Disable nvim intro
opt.shortmess:append "sI"

-- Set default filetypes
vim.cmd("autocmd BufRead,BufNewFile *.zsh setfiletype bash")
vim.cmd("autocmd BufRead,BufNewFile *.ejs setfiletype html")

-- Transparency
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
vim.cmd('hi SignColumn guibg=NONE ctermbg=NONE')
vim.cmd('hi VertSplit guibg=NONE ctermbg=NONE')
