local dap = require 'dap'
local dapui = require 'dapui'

dapui.setup()
dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end

require 'nvim-dap-virtual-text'.setup {
	enabled = true,
	enabled_commands = true,
	highlight_changed_variables = true,
	highlight_new_as_changed = false,
	show_stop_reason = true,
	commented = false,
	only_first_definition = true,
	all_references = false,
	filter_references_pattern = '<module',
	virt_text_pos = 'eol',
	all_frames = false,
	virt_lines = false,
	virt_text_win_col = nil
}

require 'core.configs.dap.langages'

local map = function(k, f)
	vim.keymap.set('n', '<A-b>'..k, f)
end

map('<ESC>', dapui.close)
map('o', dapui.open)
map('c', dap.continue)
map('t', dap.toggle_breakpoint)
map('k', dap.repl.open)
