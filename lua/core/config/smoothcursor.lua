local palette = require 'core.colors'

require 'smoothcursor'.setup {
	type = 'default',
	cursor = '',
	texthl = 'SmoothCursor',
	autostart = true,
	speed = 25,
	intervals = 35,
	priority = 10,
}

vim.api.nvim_set_hl(0, 'SmoothCursor', {
	fg = palette.pink,
	bg = nil,
})
