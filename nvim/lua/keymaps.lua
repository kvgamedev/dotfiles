local map = vim.keymap.set

-- stylua: ignore start
map("n", "<leader>w", "<c-w>", { desc = "Window" })
map({ "n", "v", "o" }, "<a-h>", "0", { desc = "Jump to Beginning of line" })
map({ "n", "v", "o" }, "<a-l>", "$", { desc = "Jump to End of Line" })
map({ "n", "v", "o" }, "<a-j>", "G", { desc = "Jump to Bottom" })
map({ "n", "v", "o" }, "<a-k>", "gg", { desc = "Jump to Top" })
map("t", "<c-q>", "<c-\\><c-n>", { desc = "Exit Terminal Mode" })
map("n", "<esc>", vim.cmd.nohlsearch, { desc = "Hide Search Highlight" })
map("n", "<leader>v", function() vim.cmd("so %") end, { desc = "Source Current File" })
map("n", "<leader>x", function() vim.api.nvim_buf_delete(0, { force = true }) end, { desc = "Delete Buffer" })
