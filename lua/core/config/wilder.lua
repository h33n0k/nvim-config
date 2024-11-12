local wilder = require 'wilder'

wilder.set_option('renderer', wilder.popupmenu_renderer(
	wilder.popupmenu_border_theme {
		highlighter = wilder.basic_highlighter(),
		highlights = {
			border = "Normal",
		},
		border = 'rounded',
		max_height = '20%',
		prompt_position = 'top',
		left = {wilder.popupmenu_devicons()}
	}
))

wilder.setup {
	modes = {':', '/', '?'}
}
