local gr = vim.api.nvim_create_augroup("User", { clear = true })
local au = function(event, pattern, once, callback)
	vim.api.nvim_create_autocmd(event, {
		group = gr,
		pattern = pattern,
		once = once,
		callback = callback,
	})
end

au("TextYankPost", "*", false, function()
	vim.hl.on_yank()
end)

au("LspAttach", "*", true, function()
	vim.keymap.set("n", "gl", "<Nop>", { desc = "LSP" })
	vim.keymap.set("n", "gld", vim.lsp.buf.definition, { desc = "Goto Definition" })
	vim.keymap.set("n", "gli", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
	vim.keymap.set("n", "glt", vim.lsp.buf.type_definition, { desc = "Goto Type Definition" })
	vim.keymap.set("n", "gln", vim.lsp.buf.rename, { desc = "Rename" })
	vim.keymap.set("n", "gla", vim.lsp.buf.code_action, { desc = "Code Actions" })
end)
