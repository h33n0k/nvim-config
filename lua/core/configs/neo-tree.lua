local inputs = require 'neo-tree.ui.inputs'

require 'neo-tree'.setup {
	enable_git_status = true,
	window = {
		mappings = {
			['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = false } }
		}
	},
	filesystem = {
		commands = {
			delete = function(state)
				local path = state.tree:get_node().path
				inputs.confirm('Delete \'' ..path .. '\'?', function(confirmed)
					if not confirmed then return end

					vim.fn.system { 'trash', vim.fn.fnameescape(path) }
					require 'neo-tree.sources.manager'.refresh(state.name)
					print('moved \'' ..path ..'\' into trash.')
				end)
			end
		},
		filtered_items = {
			visible = false,
			show_hidden_count = false,
			hide_dotfiles = false,
			hide_gitignored = true,
			always_show = {
				'target',
				'.env'
			},
			hide_by_name = {
				'.git',
				'node_modules'
			}
		}
	},
	default_component_configs = {
		icon = {
			folder_empty = "󰜌",
		},
		git_status = {
			symbols = {
				added     = "",
				modified  = "",
				-- Status type
				untracked = "󱀶",
				ignored   = "󱗤",
				unstaged  = "",
				staged    = "",
				conflict  = "",
			}
		}
	}
}
