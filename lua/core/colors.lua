local status, _ = pcall(require, 'catppuccin')
if not status then
	return {}
end

return require('catppuccin.palettes').get_palette 'macchiato'
