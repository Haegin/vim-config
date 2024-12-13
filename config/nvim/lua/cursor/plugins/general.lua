return {
  {"tpope/vim-abolish"},
  {"tpope/vim-eunuch"},
  {"tpope/vim-fugitive"},
  {"tpope/vim-repeat"},
  {"tpope/vim-surround"},
  {"tpope/vim-unimpaired"},
  {"tpope/vim-speeddating"},
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "lua", "vim", "vimdoc", "query", "elixir", "javascript", "html", "sql", "ruby", "typescript", "yaml" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
 },
}
