local cmdline_height = 1
local popupmenu_height = 8
local rows = vim.api.nvim_win_get_height(0)

require('noice').setup({
  presets = {
    bottom_search = false,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
	cmdline = { view = 'cmdline' },
	routes = {
		{
			filter = {
				event = 'msg_show',
			},
			opts = { skip = true }
		}
	},
	messages = { enabled = true },
	notify = { enabled = false },
	views = {
		cmdline_popupmenu = {
			position = {
				row = rows - cmdline_height - popupmenu_height,
				col = 0
			},
			size = {
				width = 'auto',
				height = popupmenu_height
			}
		},
		cmdline = {
			position = {
				row = -1,
				col = 0
			},
			size = {
				width = 'auto',
				height = cmdline_height
			}
		}
	}
})
