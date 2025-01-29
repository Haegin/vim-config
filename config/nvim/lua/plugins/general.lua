return {
	{ "tpope/vim-abolish" },
	{ "tpope/vim-eunuch" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-unimpaired" },
	{ "tpope/vim-speeddating" },
	{ "tpope/vim-markdown", ft = "markdown" },
	{ "tpope/vim-ragtag" },
	{ "tpope/vim-rsi" },
	{ "tpope/vim-projectionist" },
	{ "tpope/vim-vinegar" },
	{ "wellle/targets.vim" },
	{
		"tpope/vim-rhubarb",
		dependencies = {
			{ "tpope/vim-fugitive" },
		},
	},
	{ "lewis6991/gitsigns.nvim", opts = { trouble = true } },
	{
		"folke/snacks.nvim",
		opts = function()
			-- Toggle the profiler
			Snacks.toggle.profiler():map("<leader>dpp")
			-- Toggle the profiler highlights
			Snacks.toggle.profiler_highlights():map("<leader>dph")
		end,
		lazy = false,
		keys = {
			{
				"<leader>dps",
				function()
					Snacks.profiler.scratch()
				end,
				desc = "Profiler Scratch Bufer",
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		-- opts = function(_, opts)
		-- 	table.insert(opts.sections.lualine_x, Snacks.profiler.status())
		-- end,
	},
	{
		"alexghergh/nvim-tmux-navigation",
		opts = {
			disable_when_zoomed = true, -- defaults to false
			keybindings = {
				left = "<C-h>",
				down = "<C-j>",
				up = "<C-k>",
				right = "<C-l>",
				last_active = "<C-\\>",
				next = "<C-Space>",
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	},
}
