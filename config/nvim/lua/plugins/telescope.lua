return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "debugloop/telescope-undo.nvim" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		keys = {
			{ "<leader>p", "<cmd>Telescope find_files<cr>" },
			{
				"<leader>.",
				function()
					require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
				end,
			},
			{ "<leaher>h", "<cmd>Telescope oldfiles<cr>" },
			{ "<leader>/", "<cmd>Telescope live_grep<CR>" },
			{ "g/", "<cmd>Telescope grep_string<CR>" },
			{ "<leader>tg", "<cmd>Telescope git_files<CR>" },
			{ "<leader>tr", "<cmd>Telescope resume<CR>" },
			{ "<leader>tc", "<cmd>Telescope command_history<CR>" },
			{ "<leader>tp", "<cmd>Telescope yank_history<CR>" },
			{ "<leader>b", "<cmd>Telescope buffers<CR>" },
			{ "<leader>gc", "<cmd>Telescope git_commits<CR>" },
			{ "<leader>gf", "<cmd>Telescope git_bcommits<CR>" },
			{ "<leader>gs", "<cmd>Telescope git_status<CR>" },
			{ "<leader>gr", "<cmd>Telescope git_branches<CR>" },
			{ "<leader>gt", "<cmd>Telescope git_stash<CR>" },
			{ "<leader>u", "<cmd>Telescope undo<CR>" },
		},
		config = function()
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

					undo = {
						side_by_side = true,
						layout_strategy = "vertical",
						layout_config = {
							preview_height = 0.8,
						},
					},
				},
			})

			require("telescope").load_extension("fzf")
			require("telescope").load_extension("undo")
			require("telescope").load_extension("ui-select")

			-- Lua function that takes a string argument and opens the telescope
			-- grep_string for the given string
			local grep = function(opts)
				require("telescope.builtin").grep_string({ search = opts.fargs[1] })
			end

			vim.api.nvim_create_user_command("Rg", grep, { nargs = 1 })
		end,
	},
}
