-- Add the cursor directory to the runtimepath so we can keep our config separate
-- vim.opt.runtimepath:prepend("~/.config/nvim/cursor")

vim.g.mapleader = ","
vim.g.maplocalleader = " "

vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.cindent = true
vim.o.wrap = true
vim.o.textwidth = 79
vim.o.colorcolumn = "80,100,115"
vim.o.number = true
vim.o.wildignorecase = true
vim.o.wildmode = "longest:full" -- was list:longest
vim.o.formatoptions = "qrn1l"
vim.o.list = true
vim.opt.listchars = { trail = "·", tab = "▶ " }
vim.o.hidden = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.virtualedit = "block"
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.previewheight = 40
vim.o.grepprg = "rg --vimgrep"
vim.o.timeoutlen = 500

vim.o.undodir = "~/.config/nvim/undo"
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.undoreload = 10000
vim.o.swapfile = false
vim.o.backupcopy = "yes"

require("config.lazy")
