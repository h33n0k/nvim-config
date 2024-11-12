local status, catppuccin = pcall(require, 'catppuccin')
if not status then
	return {}
end

local palette = require 'catppuccin.palettes'.get_palette 'macchiato'
return palette
