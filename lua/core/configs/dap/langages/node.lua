local dap = require 'dap'

require 'dap-vscode-js'.setup {
	node_path = '/home/h33n0k/.config/nvm/versions/node/v18.18.0/bin/node',
	adapters = { 'pwa-node' }
}

for _, language in ipairs({ 'typescript', 'javascript' }) do
	dap.configurations[language] = {
			{
				type = 'pwa-node',
				request = 'launch',
				name = 'Launch file',
				program = '${file}',
				cwd = '${workspaceFolder}',
		}
	}
end
