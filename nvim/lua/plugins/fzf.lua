vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
})

require("fzf-lua").setup()
FzfLua.register_ui_select()

vim.keymap.set("n", "<leader>f", FzfLua.files, { desc = "Files" })
vim.keymap.set("n", "<leader>b", FzfLua.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>g", FzfLua.live_grep, { desc = "Grep" })
vim.keymap.set("n", "<leader>sg", FzfLua.grep_cword, { desc = "Grep Word" })
vim.keymap.set("n", "<leader>sm", FzfLua.help_tags, { desc = "Help" })
vim.keymap.set("n", "<leader>s;", FzfLua.builtin, { desc = "Help" })
vim.keymap.set("n", "<leader>sk", FzfLua.keymaps, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sc", FzfLua.commands, { desc = "Commands" })
vim.keymap.set("n", "<leader>sh", FzfLua.command_history, { desc = "Command History" })
vim.keymap.set("n", "<leader>sz", FzfLua.zoxide, { desc = "Zoxide" })
