return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"elixir",
				"javascript",
				"html",
				"sql",
				"ruby",
				"typescript",
				"yaml",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			endwise = { enable = true },
		},
		dependencies = {
			{ "RRethy/nvim-treesitter-endwise" },
		},
	},
}
