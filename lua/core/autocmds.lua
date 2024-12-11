local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '',
  command = ':%s/\\s\\+$//e'
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

-- Close help buffer with q
autocmd('Filetype', {
	pattern = 'help',
	callback = function ()
		vim.api.nvim_buf_set_keymap(0, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
	end
})

-- Auto insert template in new files
autocmd('BufNewFile', {
  pattern = '*.sh',
  callback = function()
    vim.api.nvim_buf_set_lines(0, 0, 0, false, {
			'#!/bin/bash',
			''
    })
  end,
})

-- Auto format JSON files
autocmd('BufWritePre', {
  pattern = '*.json',
  callback = function()
    vim.cmd '%!jq .'
  end,
})

-- Auto insert in terminal
autocmd('TermOpen', {
  pattern = '*',
  command = 'startinsert'
})

-- Automaticaly ask to reload file when changed
autocmd('FocusGained', {
  command = 'checktime'
})

-- Set vertical cursor when exiting
autocmd('VimLeave', {
  command = 'set guicursor=a:ver25'
})
