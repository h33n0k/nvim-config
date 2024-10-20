local telescope = require "telescope"

telescope.setup {
	defaults = {
		file_ignore_patterns = { "node_modules", ".git" },
		vimgrep_arguments = {
			"rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
			"--ignore"
		}
	},
}

telescope.load_extension("live_grep_args")
