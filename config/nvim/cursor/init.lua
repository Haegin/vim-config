-- Add the cursor directory to the runtimepath so we can keep our config separate
-- vim.opt.runtimepath:prepend("~/.config/nvim/cursor")

vim.g.mapleader = ","
vim.g.maplocalleader = " "

vim.g.shiftwidth = 2
vim.g.tabstop = 2
vim.g.softtabstop = 2
vim.g.expandtab = true
vim.g.smartindent = true
vim.g.cindent = true
vim.g.wrap = true
vim.g.textwidth = 79
vim.g.colorcolumn = "80,100,115"
vim.g.number = true
vim.g.wildmenu = true
vim.g.wildmode = "list:longest"
vim.g.formatoptions = "qrn1l"
vim.g.list = true
-- vim.g.listchars = "tab:▶\ ,trail:·"
vim.g.hidden = true
vim.g.splitbelow = true
vim.g.splitright = true
vim.g.virtualedit = "block"
vim.g.hlsearch = true
vim.g.ignorecase = true
vim.g.smartcase = true
vim.g.previewheight = 40
vim.g.grepprg = "rg --vimgrep"
vim.g.timeoutlen = 500

vim.g.undodir = "~/.config/nvim/undo"
vim.g.undofile = true
vim.g.undolevels = 1000
vim.g.undoreload = 10000
vim.g.noswapfile = true
vim.g.backupcopy = "yes"

require("cursor.lazy")
