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
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")

			nvim_tmux_nav.setup({
				disable_when_zoomed = true, -- defaults to false
			})

			vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
			vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
			vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
			vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
			vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
			vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
		end,
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
	{
		"AndrewRadev/splitjoin.vim",
	},
}
