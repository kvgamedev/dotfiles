vim.pack.add({
	"https://github.com/ellisonleao/gruvbox.nvim",
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("gruvbox").setup({
	transparent_mode = true,
	bold = false
})

require("catppuccin").setup({
	transparent_background = true,
})

vim.cmd("colorscheme catppuccin")
