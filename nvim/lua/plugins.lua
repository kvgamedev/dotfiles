local map = function(mode, key, exec, description)
	vim.keymap.set(mode, key, exec, { desc = description })
end

vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	"https://github.com/folke/flash.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
	"https://github.com/stevearc/conform.nvim",
})

-- Colorscheme
require("catppuccin").setup({ transparent_background = true })
vim.cmd("colorscheme catppuccin")

--- @diagnostic disable-next-line:undefined-field
require("lualine").setup()

local files = require("mini.files")
local picker = require("mini.pick")
local icons = require("mini.icons")
local hipatterns = require("mini.hipatterns")
local extras = require("mini.extra")
files.setup({ windows = { preview = true } })
picker.setup()
vim.ui.select = picker.ui_select
icons.setup()
icons.mock_nvim_web_devicons()
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
extras.setup()

map("n", "<leader>s", "<Nop>", "Search")
map("n", "<leader>e", files.open, "Explorer")
map("n", "<leader>f", picker.builtin.files, "Files")
map("n", "<leader>/", picker.builtin.grep_live, "Grep")
map("n", "<leader>r", picker.builtin.resume, "Resume")
map("n", "<leader>sH", picker.builtin.help, "Help")
map("n", "<leader>s/", extras.pickers.buf_lines, "Grep Buffer")
map("n", "<leader>sc", extras.pickers.commands, "Commands")
map("n", "<leader>sd", extras.pickers.diagnostic, "Diagnostics")
map("n", "<leader>sh", extras.pickers.history, "Command History")
map("n", "<leader>sk", extras.pickers.keymaps, "Keymaps")
map("n", "<leader>so", extras.pickers.options, "Options")
map("n", "<leader>sf", extras.pickers.oldfiles, "OldFiles")

map({ "n", "x", "o" }, "<return>", require("flash").jump, "Flash")
map({ "n", "x", "o" }, "<s-return>", require("flash").treesitter, "Flash Treesitter")
map({ "o" }, "r", require("flash").remote, "Remote Flash")
map({ "x", "o" }, "R", require("flash").treesitter_search, "Treesitter Search")
map({ "c" }, "<c-s>", require("flash").toggle, "Toggle Flash Search")

hipatterns.setup({
	highlighters = {
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
		hex_color = hipatterns.gen_highlighter.hex_color(),
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
