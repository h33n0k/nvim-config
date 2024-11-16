local hop = require 'hop'
local directions = require 'hop.hint'.HintDirection

hop.setup {
	keys = 'hjkl',
	uppercase_labels = true
}

local keymap = vim.keymap
keymap.set('', '<SPACE>f', function () hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) end, { remap = true })
keymap.set('', '<SPACE>F', function () hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }) end, { remap = true })
keymap.set('', '<SPACE>t', function () hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end, { remap = true })
keymap.set('', '<SPACE>T', function () hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end, { remap = true })
