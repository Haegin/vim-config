-- Trouble {{{
require("trouble").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
})
-- }}}

-- Notify {{{
vim.notify = require("notify")
-- }}}

-- Telescope {{{
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
-- local open_with_trouble = require("trouble.sources.telescope").open
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				-- ["<a-t>"] = open_with_trouble,
				["<c-u>"] = false,
				["<a-p>"] = action_layout.toggle_preview,
			},
			n = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				-- ["<a-t>"] = open_with_trouble,
				["<a-p>"] = action_layout.toggle_preview,
			},
		},
		layout_strategy = "vertical",
		layout_config = {
			flex = {
				height = 0.95,
				width = 0.95,
				flip_lines = 60,
				flip_columns = 155,
			},
		},
	},

	pickers = {
		colorscheme = {
			enable_preview = true,
		},
	},

	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
		},

		fzf_writer = {
			minimum_grep_characters = 2,
			minimum_files_characters = 2,
			use_highlighter = true,
		},
	},
})

require("telescope").load_extension("yank_history")
require("telescope").load_extension("fzf")
-- Yanky {{{
require("yanky").setup({
	picker = {
		select = {
			action = nil, -- nil to use default put action
		},
		telescope = {
			mappings = nil, -- nil to use default mappings
		},
	},
})

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")

vim.keymap.set("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
vim.keymap.set("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
vim.keymap.set("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
vim.keymap.set("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")

vim.keymap.set("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)")
vim.keymap.set("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)")
vim.keymap.set("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)")
vim.keymap.set("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)")

vim.keymap.set("n", "=p", "<Plug>(YankyPutAfterFilter)")
vim.keymap.set("n", "=P", "<Plug>(YankyPutBeforeFilter)")
-- }}}

require("which-key").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
})

-- Status bar {{{
require("lualine").setup({
	options = {
		theme = "base16",
	},
})
-- }}}

-- GP {{{
local conf = {
	providers = {
		copilot = {
			endpoint = "https://api.githubcopilot.com/chat/completions",
			secret = {
				"bash",
				"-c",
				"cat ~/.config/github-copilot/apps.json | sed -e 's/.*oauth_token...//;s/\".*//'",
			},
		},
	},
}
require("gp").setup(conf)
-- }}}

-- Avante {{{
require("avante_lib").load()
require("avante").setup({
	provider = "openai",
	openai = {
		endpoint = "https://aigateway.instacart.tools/proxy/haegin.neovim.editor/openai/v1",
	},
})
-- }}}
