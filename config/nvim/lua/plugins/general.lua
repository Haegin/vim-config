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
	-- { "comatory/gh-co.nvim", opts = {} },
	{
		"tpope/vim-rhubarb",
		dependencies = {
			{ "tpope/vim-fugitive" },
		},
	},
	{ "lewis6991/gitsigns.nvim", opts = { trouble = true } },
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			picker = {
				enabled = true,
				win = {
					input = {
						keys = {
							["<c-a>"] = false,
							["<c-e>"] = false,
							["<c-u>"] = false,
						},
					},
					list = {
						keys = {
							["<c-a>"] = false,
							["<c-e>"] = false,
							["<c-u>"] = false,
						},
					},
				},
			},
			quickfile = { enabled = true },
		},
		keys = {
			{
				"<leader>dps",
				function()
					Snacks.profiler.scratch()
				end,
				desc = "Profiler scratch buffer",
			},
			{ "<leader>p", function() Snacks.picker.files() end, desc = "Find files" },
			{
				"<leader>.",
				function()
					Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") })
				end,
				desc = "Find files (buffer dir)",
			},
			{ "<leader>h", function() Snacks.picker.recent() end, desc = "Recent files" },
			{ "<leader>/", function() Snacks.picker.grep() end, desc = "Live grep" },
			{
				"g/",
				function() Snacks.picker.grep_word() end,
				desc = "Grep word under cursor",
				mode = { "n", "x" },
			},
			{ "<leader>tg", function() Snacks.picker.git_files() end, desc = "Git files" },
			{ "<leader>tr", function() Snacks.picker.resume() end, desc = "Resume picker" },
			{ "<leader>tc", function() Snacks.picker.command_history() end, desc = "Command history" },
			{ "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers" },
			{ "<leader>gc", function() Snacks.picker.git_log() end, desc = "Git log" },
			{ "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git log (current file)" },
			{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git status" },
			{ "<leader>gr", function() Snacks.picker.git_branches() end, desc = "Git branches" },
			{ "<leader>gt", function() Snacks.picker.git_stash() end, desc = "Git stash" },
			{ "<leader>u", function() Snacks.picker.undo() end, desc = "Undo history" },
		},
		config = function(_, opts)
			require("snacks").setup(opts)

			Snacks.toggle.profiler():map("<leader>dpp")
			Snacks.toggle.profiler_highlights():map("<leader>dph")

			vim.api.nvim_create_user_command("Rg", function(o)
				Snacks.picker.grep_word({ search = o.fargs[1] })
			end, { nargs = 1 })
		end,
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
