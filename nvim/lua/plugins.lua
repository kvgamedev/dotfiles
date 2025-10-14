local map = vim.keymap.set

vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/kvgamedev/kvim.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/folke/noice.nvim",
	"https://github.com/folke/flash.nvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/folke/todo-comments.nvim",
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

vim.cmd("colorscheme catppuccin")
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
				require("noice").api.status.search.get,
				cond = require("noice").api.status.search.has,
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

require("kvim.term").setup()
map("n", "<c-w>t", function()
	KTerm.terminal()
end, { desc = "LazyGit" })
map("n", "<c-w>g", function()
	KTerm.run_cmd("lazygit")
end, { desc = "LazyGit" })
map("n", "<leader>w", "<c-w>", { desc = "Window", remap = true })

require("blink.cmp").setup()
require("conform").setup({
	formatters_by_ft = { lua = { "stylua" } },
})
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
map("n", "<leader>f",  function() fzf.files()     end, { desc = "Pickers" })
map("n", "<leader>g",  function() fzf.live_grep() end, { desc = "Pickers" })
map("n", "<leader>/",  function() fzf.lines()     end, { desc = "Pickers" })
map("n", "<leader>*",  function() fzf.grep_cword() end, { desc = "Pickers" })
map("n", "<leader>sr", function() fzf.resume()   end, { desc = "Pickers" })
map("n", "<leader>sz", function() fzf.zoxide()   end, { desc = "Pickers" })
map("n", "<leader>sC", function() fzf.colorschemes()   end, { desc = "Pickers" })
map("n", "<leader>sh", function() fzf.help_tags()   end, { desc = "Pickers" })
map("n", "<leader>sp", function() fzf.builtin()   end, { desc = "Pickers" })
map("n", "<leader>ss", function() fzf.search_history()   end, { desc = "Pickers" })
map("n", "<leader>sc", function() fzf.command_history()   end, { desc = "Pickers" })
map("n", "<leader>sa", function() fzf.autocommands()   end, { desc = "Pickers" })
