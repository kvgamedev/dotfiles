local map = vim.keymap.set

-- stylua: ignore start
map({ "n", "v", "o" }, "<a-h>", "0", { desc = "Jump to Beginning of line" })
map({ "n", "v", "o" }, "<a-l>", "$", { desc = "Jump to End of Line" })
map({ "n", "v", "o" }, "<a-j>", "G", { desc = "Jump to Bottom" })
map({ "n", "v", "o" }, "<a-k>", "gg", { desc = "Jump to Top" })
map("n", "<esc>", vim.cmd.nohlsearch, { desc = "Hide Search Highlight" })
map("n", "<leader>v", function() vim.cmd("so %") end, { desc = "Source Current File" })
map("n", "<leader>x", function() vim.api.nvim_buf_delete(0, { force = true }) end, { desc = "Delete Buffer" })
map("n", "<c-h>", "<c-w>h", { desc = "Move to Left Window" })
map("n", "<c-l>", "<c-w>l", { desc = "Move to Right Window" })
map("n", "<c-j>", "<c-w>j", { desc = "Move to Down Window" })
map("n", "<c-k>", "<c-w>k", { desc = "Move to Up Window" })
map("n", "<s-l>", vim.cmd.bnext, { desc = "Next Buffer" })
map("n", "<s-h>", vim.cmd.bprevious, { desc = "Previous Buffer" })
