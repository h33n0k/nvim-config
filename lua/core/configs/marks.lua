local mappings = {
	next = '<C-;>',
	prev = '<C-,>',
	preview = '<Leader>mp',
	set_next = '<Leader><Leader>m',
	delete = '<Leader>md',
	delete_line = '<Leader>ml',
	delete_buf = '<Leader>mL',
}

for i, key in pairs({ 'à', '&', 'é', '"', "'", '(', '-', 'è', '_', 'ç' }) do
	mappings['next_bookmark'..(i - 1)] = '<Leader>'..key
	mappings['set_bookmark'..(i - 1)] = '<Leader><Leader>'..key
	mappings['delete_bookmark'..(i - 1)] = '<Leader>md'..key
end

require 'marks'.setup {
	cyclic = true,
	mappings = mappings
}

vim.cmd [[ au CursorHold * lua require'marks'.refresh() ]]
