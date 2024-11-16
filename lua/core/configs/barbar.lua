local palette = require 'core.colors'

require 'barbar'.setup {
	auto_hide = true,
	animation = false,
	no_name_title = nil,
	maximum_length = 10,
	minimum_length = 0,
	focus_on_close = 'right',
	insert_at_end = true,
  insert_at_start = false,
	icons = {
		separator = {left = '', right = ''},
		separator_at_end = false,
		filetype = {
			enabled = true,
			custom_colors = true,
		}
	},
	sidebar_filetypes = {
		['neo-tree'] = { event = 'BufWipeout' }
	}
}

local currentColor = palette.sapphire
local normalColor = palette.overlay1

local status = {
	'STATUS',
	'Alternate',
	'Current',
	'Inactive',
	'Visible'
}

local parts = {
	'ADDED',
	'CHANGED',
	'DELETED',
	'ERROR',
	'HINT',
	'Icon',
	'Index',
	'INFO',
	'Mod',
	'Number',
	'Sign',
	'SignRight',
	'Target',
	'WARN'
}

for _, s  in pairs(status) do

	vim.cmd(string.format('hi Buffer%s guibg=default', s))
	if s == 'Current' then
		vim.cmd(string.format('hi Buffer%s guifg=%s', s, currentColor))
	else
		vim.cmd(string.format('hi Buffer%s guifg=%s', s, normalColor))
	end

	for _, p in pairs(parts) do
		vim.cmd(string.format('hi Buffer%s%s guibg=default', s, p))
		if s == 'Current' then
			vim.cmd(string.format('hi Buffer%s%s guifg=%s', s, p, currentColor))
		else
			vim.cmd(string.format('hi Buffer%s%s guifg=%s', s, p, normalColor))
		end
	end
end
