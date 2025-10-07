vim.pack.add({
	"https://github.com/kvgamedev/kvim.nvim",
})

require("kvim.term").setup()
vim.keymap.set("n", "<c-w>g", function() KTerm.run_cmd("lazygit") end, { desc = "LazyGit" })
vim.keymap.set("n", "<c-w>t", KTerm.terminal, { desc = "Terminal" })
vim.keymap.set("n", "<leader>w", "<c-w>", { desc = "Window", remap = true })
