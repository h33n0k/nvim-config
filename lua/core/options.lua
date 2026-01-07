-- General
vim.opt.mouse = 'a' -- Enable mouse support
vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver20,r-cr-o:hor20'

-- Neovim UI
vim.opt.signcolumn = 'yes:2'
vim.opt.number = true -- Show line number
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.numberwidth = 3
vim.opt.cursorline = true -- Highlight hovered line
vim.opt.showmatch = true -- Highlight matching parenthesis
vim.opt.matchtime = 2 -- How long to show matching bracket
vim.opt.cmdheight = 1 -- Command line height
vim.opt.showmode = false -- Don't show mode in command line
vim.opt.pumheight = 10 -- Popup menu height
vim.opt.pumblend = 0 -- Popup menu transparency
vim.opt.winblend = 0 -- Floating window transparency
vim.opt.conceallevel = 0 -- Don't hide markup
vim.opt.concealcursor = '' -- Don't hide cursor line markup
vim.opt.linebreak = true -- Wrap on word boundary
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.laststatus = 3 -- Global statusline
vim.opt.completeopt = 'menuone,noinsert,noselect' -- Completion options
vim.opt.splitright = true -- Vertical splits go right
vim.opt.splitbelow = true -- Horizontal splits go below
vim.opt.inccommand = 'split'

-- Tabs, indent, fold, scroll
vim.opt.expandtab = false -- Use tabs instead of spaces
vim.opt.tabstop = 2 -- 1 tab = 2 spaces
vim.opt.shiftwidth = 2 -- Indent width
vim.opt.softtabstop = 2 -- Soft tab stop
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true -- Copy indent from current line
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.scrolloff = 5

-- File handling
local undodir = '~/.local/state/nvim/undodir'
vim.opt.backup = false -- Don't create backup files
vim.opt.writebackup = false -- Don't create backup before writing
vim.opt.swapfile = false -- Don't create swap files
vim.opt.undofile = true -- Persistent undo
vim.opt.undodir = vim.fn.expand(undodir) -- Undo directory
vim.opt.updatetime = 10 -- Fast update time for events (from base)
vim.opt.timeoutlen = 500 -- Mapped sequence timeout
vim.opt.ttimeoutlen = 0 -- Key code timeout
vim.opt.autoread = true -- Auto reload changed files
vim.opt.autowrite = false -- Don't auto save

-- Memory, CPU
vim.opt.hidden = true -- Enable background buffers
vim.opt.history = 100 -- Command history length
vim.opt.synmaxcol = 240 -- Max column for syntax highlight

-- Behavior settings
vim.opt.errorbells = false -- No error bells
vim.opt.backspace = 'indent,eol,start' -- Better backspace
vim.opt.autochdir = false -- Don't auto change directory
-- vim.opt.iskeyword:append '-' -- Treat dash as part of word
vim.opt.path:append '**' -- Search in subdirectories
vim.opt.modifiable = true -- Allow buffer modifications
vim.opt.encoding = 'UTF-8' -- Encoding

-- Disable automatic commenting behavior
vim.opt.formatoptions:remove 'c'
vim.opt.formatoptions:remove 'r'
vim.opt.formatoptions:remove 'o'

-- Disable intro message
vim.opt.shortmess:append 'sI'

-- Theme & Transparency
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })

-- Optionally enable clipboard integration
-- vim.opt.clipboard:append("unnamedplus")
