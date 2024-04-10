
-- Telescope {{{
local actions = require('telescope.actions')
local open_with_trouble = require("trouble.sources.telescope").open
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<a-t>"] = open_with_trouble,
        ["<c-u>"] = false,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<a-t>"] = open_with_trouble,
      },
    },
  },
  extensions = {
    fzf_writer = {
      minimum_grep_characters = 2,
      minimum_files_characters = 2,
      use_highlighter = true,
    }
  }
}

-- Trouble {{{
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
-- }}}

  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }

-- Status bar {{{
require('lualine').setup {
  options = {
    theme = 'base16'
  }
}
-- }}}

