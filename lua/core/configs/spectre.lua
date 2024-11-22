local spectre = require 'spectre'
spectre.setup()

local prefix = '<Leader>f'
for _, map in pairs({
	'o', spectre.toggle,
	'p', function () spectre.open_file_search({ select_word = true }) end,
	'v', spectre.open_visual,
	'w', function () spectre.open_visual({ select_word = true }) end
}) do
	vim.keymap.set('n', prefix ..map[1], map[2])
end

