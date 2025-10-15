local map = vim.keymap.set

vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/stevearc/conform.nvim",
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
	"https://github.com/folke/lazydev.nvim",

	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/akinsho/toggleterm.nvim",

	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/folke/noice.nvim",
	"https://github.com/folke/flash.nvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/folke/todo-comments.nvim",
})

vim.lsp.enable({ "lua_ls" })

require("mini.files").setup()
map("n", "<leader>e", MiniFiles.open, { desc = "MiniFiles" })
require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
require("mini.ai").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.align").setup()
require("mini.comment").setup()
require("mini.tabline").setup()

require("gitsigns").setup()
require("which-key").setup({ preset = "helix", delay = 300 })
require("which-key").add({
	{ "<leader>w", proxy = "<c-w>", desc = "Windows" },
	{ "gl", proxy = "gr", desc = "LSP" },
})
require("todo-comments").setup()
require("noice").setup()
require("lualine").setup({
	sections = {
		lualine_c = {
			"filename",
			{
				require("noice").api.status.command.get,
				cond = require("noice").api.status.command.has,
				color = { fg = "#ff9e64" },
			},
			{
				require("noice").api.status.mode.get,
				cond = require("noice").api.status.mode.has,
				color = { fg = "#ff9e64" },
			},
		},
	},
})

require("lazydev").setup({
	library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
})
require("blink.cmp").setup({
	sources = {
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
		},
	},
})
require("conform").setup({ formatters_by_ft = { lua = { "stylua" } } })
map("n", "glf", require("conform").format, { desc = "Format Buffer" })
vim.api.nvim_create_autocmd("BufWrite", {
	callback = function()
		require("conform").format()
	end,
})

map({ "n", "v", "o" }, "<return>", require("flash").jump, { desc = "Flash" })
map({ "n", "v", "o" }, "<s-return>", require("flash").treesitter, { desc = "Flash" })

local fzf = require("fzf-lua")
fzf.setup()
fzf.register_ui_select()
--stylua: ignore start
map("n", "<leader>f",  function() fzf.files() end,                  { desc = "Search Files" })
map("n", "<leader>b",  function() fzf.buffers() end,                { desc = "Search Files" })
map("n", "<leader>g",  function() fzf.live_grep() end,              { desc = "Search Text" })
map("n", "<leader>/",  function() fzf.lines({profile = "ivy"}) end, { desc = "Search Lines" })
map("n", "<leader>*",  function() fzf.grep_cword() end,             { desc = "Search Word" })
map("n", "<leader>s",  "<nop>",                                     { desc = "Search" })
map("n", "<leader>sg", function() fzf.global() end,                 { desc = "Global" })
map("n", "<leader>sk", function() fzf.keymaps() end,                { desc = "Keymaps" })
map("n", "<leader>sr", function() fzf.resume() end,                 { desc = "Resume" })
map("n", "<leader>sz", function() fzf.zoxide() end,                 { desc = "Zoxide" })
map("n", "<leader>sC", function() fzf.colorschemes() end,           { desc = "Colorschemes" })
map("n", "<leader>sh", function() fzf.help_tags() end,              { desc = "Help" })
map("n", "<leader>sp", function() fzf.builtin() end,                { desc = "Pickers" })
map("n", "<leader>ss", function() fzf.search_history() end,         { desc = "Search History" })
map("n", "<leader>sc", function() fzf.command_history() end,        { desc = "Command History" })
map("n", "<leader>sa", function() fzf.autocommands() end,           { desc = "Autocommands" })
map("n", "<leader>l",  "<nop>",                                     { desc = "LSP" })
map("n", "<leader>lr", function() fzf.lsp_references() end,         { desc = "References" })
map("n", "<leader>ld", function() fzf.diagnostics_document() end,   { desc = "Doc Diagnostics" })
map("n", "<leader>lD", function() fzf.diagnostics_workspace() end,  { desc = "Workspace Diagnostics" })
map("n", "<leader>lt", function() fzf.lsp_typedefs() end,           { desc = "Type Definitions" })
map("n", "<leader>ls", function() fzf.lsp_document_symbols() end,   { desc = "Symbols" })
map("n", "<leader>la", function() fzf.lsp_code_actions() end,       { desc = "Code Actions" })
--stylua: ignore stop

require("toggleterm").setup()
local term = require("toggleterm.terminal").Terminal
local lazygit = term:new({ cmd = "lazygit", hidden = true, direction = "float", float_opts = { border = vim.o.winborder } })

--stylua: ignore start
map({ "n", "t" }, "<c-t>", vim.cmd.ToggleTerm)
map("n", "<c-g>", function() lazygit:toggle() end)
--stylua: ignore stop
