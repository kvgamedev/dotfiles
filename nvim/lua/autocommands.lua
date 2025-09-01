local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
})

autocmd("VimResized", {
	callback = function()
		vim.cmd("tabdo wimcd =")
		vim.cmd("tabnext" .. vim.fn.tabpagenr())
	end,
})

autocmd("LspAttach", {
	once = true,
	callback = function()
		vim.keymap.set("n", "gl", "<Nop>", { desc = "LSP" })
		vim.keymap.set("n", "gld", vim.lsp.buf.definition, { desc = "Goto Definition" })
		vim.keymap.set("n", "gli", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
		vim.keymap.set("n", "glt", vim.lsp.buf.type_definition, { desc = "Goto Type Definition" })
		vim.keymap.set("n", "gln", vim.lsp.buf.rename, { desc = "Rename" })
		vim.keymap.set("n", "gla", vim.lsp.buf.code_action, { desc = "Code Actions" })
	end,
})
