vim.pack.add({
	"https://github.com/folke/flash.nvim",
})

vim.keymap.set({ "n", "x", "o" }, "<return>", require("flash").jump, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "<s-return>", require("flash").treesitter, { desc = "Flash Treesitter" })
