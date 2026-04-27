return {
	{
		"3rd/image.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = { "markdown" },
		opts = {
			backend = "kitty",
			kitty_method = "normal",
			integrations = {
				markdown = {
					enabled = false,
				},
			},
			max_width = 80,
			max_height = 40,
			max_width_window_percentage = 60,
			max_height_window_percentage = 50,
			editor_only_render_when_focused = true,
			tmux_show_only_in_active_window = true,
		},
	},
	{
		"3rd/diagram.nvim",
		dependencies = { "3rd/image.nvim" },
		ft = { "markdown" },
		opts = function()
			return {
				integrations = {
					require("diagram.integrations.markdown"),
				},
				renderer_options = {
					mermaid = {
						theme = "dark",
						background = "transparent",
						scale = 2,
					},
				},
			}
		end,
	},
}
