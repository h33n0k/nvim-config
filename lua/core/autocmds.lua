local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Prevent auto commenting new line
autocmd('Filetype', {
	pattern = '*',
	callback = function ()
		vim.opt_local.formatoptions:remove('o')
	end
})

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
  end
})

-- Set indentation to 2 spaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'yaml' },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

-- Set correct file formats
for _, format in pairs({
	{ '*.zsh', 'bash' }
}) do
	autocmd({ 'BufRead', 'BufNewFile' }, {
		pattern = format[1],
		command = 'setfiletype' ..format[2],
	})
end
