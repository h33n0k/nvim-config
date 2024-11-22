local palette = require 'core.colors'

require 'toggleterm'.setup {
	size = 10,
	open_mapping = [[<A-:>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
}

local Terminal = require "toggleterm.terminal".Terminal

local lazygitTerminal = Terminal:new { cmd = "lazygit", direction = "float" }
function _G.term_lazygit() lazygitTerminal:toggle() end
vim.keymap.set("n", "<A-g>", ":lua term_lazygit()<CR>")

local lazydockerTerminal = Terminal:new { cmd = "lazydocker", direction = "float" }
function _G.term_lazydocker() lazydockerTerminal:toggle() end
vim.keymap.set("n", "<A-d>", ":lua term_lazydocker()<CR>")

local yaziTerminal = Terminal:new { cmd = "yazi", direction = "float" }
function _G.term_yazi() yaziTerminal:toggle() end
vim.keymap.set("n", "<A-y>", ":lua term_yazi()<CR>")

local sptTerminal = Terminal:new { cmd = "spt", direction = "float" }
function _G.term_spt() sptTerminal:toggle() end
vim.keymap.set("n", "<A-s>", ":lua term_spt()<CR>")
