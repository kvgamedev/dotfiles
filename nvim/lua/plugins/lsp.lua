vim.pack.add({
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/stevearc/conform.nvim",
})

vim.lsp.enable({
	"lua_ls",
	"zls",
	"clangd",
})

require("blink.cmp").setup({
	sources = { default = { "lsp", "path", "snippets", "buffer" } },
	completion = { documentation = { auto_show = true } },
	fuzzy = { implementation = "prefer_rust_with_warning" },
})

---@diagnostic disable: missing-fields
require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = { enable = true },
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		zig = { "zigfmt" },
		cpp = { "clang-format" },
	},
})
vim.keymap.set("n", "glf", require("conform").format, { desc = "Format Buffer" })
