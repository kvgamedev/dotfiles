vim.g.mapleader = " "

require("options")
require("autocommands")
require("keymaps")
require("startup")
vim.defer_fn(function()
	require("lazyload")
end, 0)
