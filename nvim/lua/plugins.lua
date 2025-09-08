local map = function(mode, key, exec, description)
	vim.keymap.set(mode, key, exec, { desc = description })
end

vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	"https://github.com/folke/flash.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
	"https://github.com/stevearc/conform.nvim",
})

require("catppuccin").setup({ transparent_background = true })
vim.cmd("colorscheme catppuccin")

require("mini.starter").setup()
require("mini.files").setup({ windows = { preview = true } })
require("mini.pick").setup()
vim.ui.select = MiniPick.ui_select
require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
require("mini.statusline").setup()
require("mini.ai").setup()
require("mini.align").setup()
require("mini.comment").setup()
require("mini.surround").setup()
require("mini.notify").setup()
require("mini.operators").setup()
require("mini.bracketed").setup()
require("mini.tabline").setup()
require("mini.git").setup()
require("mini.diff").setup({
	view = {
		style = "sign",
		signs = { add = "▏", change = "▏", delete = "▏" },
	},
})
require("mini.extra").setup()

map("n", "<leader>s", "<Nop>", "Search")
map("n", "<leader>e", MiniFiles.open, "Explorer")
map("n", "<leader>f", MiniPick.builtin.files, "Files")
map("n", "<leader>/", MiniPick.builtin.grep_live, "Grep")
map("n", "<leader>r", MiniPick.builtin.resume, "Resume")
map("n", "<leader>sH", MiniPick.builtin.help, "Help")
map("n", "<leader>s/", MiniExtra.pickers.buf_lines, "Grep Buffer")
map("n", "<leader>sc", MiniExtra.pickers.commands, "Commands")
map("n", "<leader>sd", MiniExtra.pickers.diagnostic, "Diagnostics")
map("n", "<leader>sh", MiniExtra.pickers.history, "Command History")
map("n", "<leader>sk", MiniExtra.pickers.keymaps, "Keymaps")
map("n", "<leader>so", MiniExtra.pickers.options, "Options")
map("n", "<leader>sf", MiniExtra.pickers.oldfiles, "OldFiles")

map({ "n", "x", "o" }, "<return>", require("flash").jump, "Flash")
map({ "n", "x", "o" }, "<s-return>", require("flash").treesitter, "Flash Treesitter")

require("mini.hipatterns").setup({
	highlighters = {
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
		hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
})

vim.lsp.enable({
	"lua_ls",
	"zls",
	"clangd",
})

vim.diagnostic.config({ virtual_text = true })

require("blink.cmp").setup({
	sources = {
		default = { "lsp", "path", "buffer", "snippets" },
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
})

local wk = require("which-key")
wk.setup({
	delay = 0,
	preset = "helix",
	show_help = false,
})
wk.add({
	{ "<leader>w", proxy = "<c-w>", desc = "Window" },
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
map("n", "glf", require("conform").format, "Format Buffer")
