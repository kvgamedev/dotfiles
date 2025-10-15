local map = vim.keymap.set

vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/ellisonleao/gruvbox.nvim",
	"https://github.com/navarasu/onedark.nvim",
})

vim.cmd("colorscheme rose-pine-moon")
