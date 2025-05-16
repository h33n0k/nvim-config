local mappings = {
	next = '<C-;>',
	prev = '<C-,>',
	preview = '<Leader>mp',
	set_next = '<Leader><Leader>m',
	delete = '<Leader>md',
	delete_line = '<Leader>ml',
	delete_buf = '<Leader>mL',
}

for i = 1, 9 do
	key = (i - 1)
	mappings['next_bookmark'..key] = '<Leader>'..key
	mappings['set_bookmark'..key] = '<Leader><Leader>'..key
	mappings['delete_bookmark'..key] = '<Leader>md'..key
end

require 'marks'.setup {
	cyclic = true,
	mappings = mappings
}

vim.cmd [[ au CursorHold * lua require 'marks'.refresh() ]]
