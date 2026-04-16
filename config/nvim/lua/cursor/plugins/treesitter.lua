return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install({
				"bash",
				"diff",
				"elixir",
				"git_config",
				"gitcommit",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"graphql",
				"html",
				"javascript",
				"json",
				"lua",
				"make",
				"query",
				"ruby",
				"sql",
				"toml",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
				"terraform",
			})
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})
		end,
		dependencies = {
			{ "RRethy/nvim-treesitter-endwise" },
		},
	},
}
