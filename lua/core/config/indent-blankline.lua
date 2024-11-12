local highlight = { 'blue', 'sapphire', 'sky', 'teal' }

local hooks = require 'ibl.hooks'
local palette = require 'core.colors'

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	for _, color in pairs(highlight) do
		vim.api.nvim_set_hl(0, color, { fg = palette[color] })
	end
end)

require 'ibl'.setup { indent = { highlight = highlight } }
