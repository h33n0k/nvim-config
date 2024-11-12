local cmp = require 'cmp'

cmp.setup {
	snippet = {
		expand = function(args)
			require 'luasnip'.lsp_expand(args.body)
		end
	},
	sources = cmp.config.sources(
		{ { name = 'nvim_lsp' }, { name = 'luasnip' } },
		{ { name = 'buffer' } }
	),
	mapping = cmp.mapping.preset.insert {
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm { select = true },
		['<Tab>'] = cmp.mapping.confirm { select = true },
	},
	window = {
		completion = {
			border = 'rounded',
			side_padding = 1
		}
	}
}
