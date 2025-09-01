local o = vim.o

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

o.swapfile = false
o.number = false
o.relativenumber = false
o.clipboard = "unnamedplus"
o.tabstop = 4
o.shiftwidth = 4
o.showmode = false
o.scrolloff = 10
o.mouse = "nvichar"
o.list = true
o.incsearch = true
o.inccommand = "split"
o.ignorecase = true
o.smartcase = true
o.confirm = true
o.copyindent = true
o.breakindent = true
o.showbreak = "󱞩 "
o.smartindent = true
o.splitbelow = true
o.splitright = true
o.startofline = true
o.undofile = true
o.wrapmargin = 5
o.laststatus = 3
o.cmdheight = 1
o.winborder = "rounded"
o.listchars = "tab:  ,trail:"
o.cursorline = false
o.termguicolors = true
o.signcolumn = "yes"
-- o.guicursor =
-- 	"n:block-MiniStatusLineModeNormal,i:block-MiniStatusLineModeInsert,v:block-MiniStatusLineModeVisual,r:block-MiniStatusLineModeReplace,t:block-MiniStatusLineModeOther"
