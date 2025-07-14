-- Install packer
local packerPath

local function isWindows()
	return vim.fn.has 'win32' == 1 or vim.fn.has 'win64' == 1
end

if isWindows() then
	local function get_env(var, default)
		local value = vim.fn.getenv(var)
		if value ~= nil and value ~= '' then
			return value
		else
			return default
		end
	end
	local local_appdata = get_env('LOCALAPPDATA', 'C:\\Users\\(nom_dutilisateur)\\AppData\\Local')
	packerPath = local_appdata .. '\\nvim-data\\site\\pack\\packer\\start\\packer.nvim'
else
	packerPath = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
end

local ensure_packer = function()
	if vim.fn.empty(vim.fn.glob(packerPath)) > 0 then
		vim.fn.system {
			'git',
			'clone',
			'--depth',
			'1',
			'https://github.com/wbthomason/packer.nvim',
			packerPath,
		}
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local bootstrap = ensure_packer()

-- Load plugins
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- packer itself

	-- Tools
	use {
		'iamcco/markdown-preview.nvim',
		run = function()
			vim.fn['mkdp#util#install']()
		end,
	}

	-- Theming
	use {
		'catppuccin/nvim',
		config = function()
			require 'core.configs.theme'
		end,
	}

	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require 'core.configs.indent-blankline'
		end,
	}

	-- Syntax / Highlighting
	-- use 'NvChad/nvim-colorizer.lua'
	use 'elkowar/yuck.vim'
	use { 'Fymyte/rasi.vim', ft = 'rasi' }

	use {
		'nvim-treesitter/nvim-treesitter-refactor',
		after = 'nvim-treesitter',
		requires = 'nvim-treesitter/nvim-treesitter',
	}

	use {
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
		requires = 'nvim-treesitter/nvim-treesitter',
		config = function()
			require 'core.configs.treesitter'
		end,
	}

	-- Writting
	use {
		'kevinhwang91/nvim-ufo',
		requires = 'kevinhwang91/promise-async',
		config = function()
			require('ufo').setup()
		end,
	}

	use {
		'chentoast/marks.nvim',
		config = function()
			require 'core.configs.marks'
		end,
	}

	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'
	use 'lambdalisue/suda.vim'
	use 'mg979/vim-visual-multi'
	use {
		'kevinhwang91/nvim-hlslens',
		config = function()
			require('hlslens').setup()
		end,
	}

	use {
		'phaazon/hop.nvim',
		branch = 'v2',
		config = function()
			require('hop').setup {
				keys = 'hjkl',
				uppercase_labels = true,
			}
		end,
	}

	use {
		'windwp/nvim-autopairs',
		config = function()
			require 'core.configs.autopairs'
		end,
	}

	-- LSP / Completions
	use {
		'hrsh7th/cmp-nvim-lsp',
		requires = {
			'L3MON4D3/LuaSnip',
			'nvim-lua/lsp-status.nvim',
			'hrsh7th/nvim-cmp',
			'folke/neodev.nvim',
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'neovim/nvim-lspconfig',
			'stevearc/conform.nvim',
		},
		config = function()
			require 'core.mason'
		end,
	}

	-- UI
	use 'tpope/vim-fugitive'
	use {
		'nvim-pack/nvim-spectre',
		config = function()
			require('spectre').setup()
		end,
	}

	use {
		'folke/noice.nvim',
		config = function()
			require 'core.configs.noice'
		end,
	}

	use {
		'goolord/alpha-nvim',
		requires = 'nvim-tree/nvim-web-devicons',
		config = function()
			require 'core.configs.alpha'
		end,
	}

	-- use 'preservim/tagbar'

	use {
		'akinsho/toggleterm.nvim',
		config = function()
			require 'core.configs.toggleterm'
		end,
	}

	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
		config = function()
			require('gitsigns').setup()
		end,
	}

	use {
		'utilyre/barbecue.nvim',
		requires = {
			'neovim/nvim-lspconfig',
			'SmiteshP/nvim-navic',
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require 'core.configs.barbecue'
		end,
	}

	use {
		'romgrk/barbar.nvim',
		requires = {
			'nvim-tree/nvim-web-devicons',
			'lewis6991/gitsigns.nvim',
		},
		config = function()
			require 'core.configs.barbar'
		end,
	}

	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-live-grep-args.nvim',
		},
		config = function()
			require 'core.configs.telescope'
		end,
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'nvim-tree/nvim-web-devicons',
			opt = true,
		},
		config = function()
			require 'core.configs.lualine'
		end,
	}

	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v2.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			'MunifTanjim/nui.nvim',
		},
		config = function()
			require 'core.configs.neo-tree'
		end,
	}

	if bootstrap then
		require('packer').sync()
	end
end)

vim.g.mapleader = ' '
require 'core.options'
require 'core.autocmds'
require 'core.keymaps'
