return {
	-- Tools
	{ "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, },
	-- Theming
	'catppuccin/nvim',
	'gen740/SmoothCursor.nvim',
	'lukas-reineke/indent-blankline.nvim',
	-- Syntax / Highlighting
	'NvChad/nvim-colorizer.lua',
	'elkowar/yuck.vim',
	{ 'Fymyte/rasi.vim', ft = 'rasi' },
	'nvim-treesitter/nvim-treesitter',
	{ 'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
		requires = 'nvim-treesitter/nvim-treesitter'
	},
	-- Writting
	{ 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' },
	'chentoast/marks.nvim',
	'tpope/vim-commentary',
	'tpope/vim-surround',
	'lambdalisue/suda.vim',
	'mg979/vim-visual-multi',
	{	'kevinhwang91/nvim-hlslens', config = function () require 'hlslens'.setup() end }, -- prevent their anoying warning
	{ 'phaazon/hop.nvim', branch = 'v2' },
	'windwp/nvim-autopairs',
	-- LSP / Completions
	'L3MON4D3/LuaSnip',
	'nvim-lua/lsp-status.nvim',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
	-- UI
	{ 'goolord/alpha-nvim', requires = 'nvim-tree/nvim-web-devicons' },
	'preservim/tagbar',
	'akinsho/toggleterm.nvim',
	'lewis6991/gitsigns.nvim',
	'gelguy/wilder.nvim',
	{ 'utilyre/barbecue.nvim', requires = {
		'neovim/nvim-lspconfig',
		'SmiteshP/nvim-navic',
		'nvim-tree/nvim-web-devicons' } },
	{ 'romgrk/barbar.nvim', requires = {
		'nvim-tree/nvim-web-devicons',
		'lewis6991/gitsigns.nvim' } },
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.5', requires = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-live-grep-args.nvim' } },
	{ 'nvim-lualine/lualine.nvim', requires = {
		'nvim-tree/nvim-web-devicons', opt = true } },
	{ 'nvim-neo-tree/neo-tree.nvim', branch = 'v2.x', requires = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim', } }
}
