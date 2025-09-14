local P = require("custom.plugin_manager")
local map = vim.keymap.set

P.add({
	src = "nvim-mini/mini.nvim",
	lazy = true,
	config = function()
		require("mini.files").setup()
		require("mini.icons").setup()
		MiniIcons.mock_nvim_web_devicons()
		require("mini.pick").setup()
		vim.ui.select = MiniPick.ui_select
		require("mini.ai").setup()
		require("mini.align").setup()
		require("mini.bracketed").setup()
		require("mini.comment").setup()
		require("mini.diff").setup({
			view = {
				signs = { add = "▏", change = "▏", delete = "▏" },
			},
		})
		require("mini.notify").setup()
		require("mini.extra").setup()
		require("mini.hipatterns").setup({
			highlighters = {
				fixme = { pattern = "FIXME", group = "MiniHipatternsFixme" },
				hack = { pattern = "HACK", group = "MiniHipatternsHack" },
				todo = { pattern = "TODO", group = "MiniHipatternsTodo" },
				note = { pattern = "NOTE", group = "MiniHipatternsNote" },
				hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
			},
		})

		map("n", "<leader>e", MiniFiles.open, { desc = "Search" })
		map("n", "<leader>s", "<Nop>", { desc = "Search" })
		map("n", "<leader>f", MiniPick.builtin.files, { desc = "Files" })
		map("n", "<leader>g", MiniPick.builtin.grep_live, { desc = "Grep" })
		map("n", "<leader>r", MiniPick.builtin.resume, { desc = "Resume" })
		map("n", "<leader>sg", MiniExtra.pickers.buf_lines, { desc = "Grep Buffer" })
		map("n", "<leader>sm", MiniPick.builtin.help, { desc = "Help" })
		map("n", "<leader>sc", MiniExtra.pickers.commands, { desc = "Commands" })
		map("n", "<leader>sh", MiniExtra.pickers.history, { desc = "Command History" })
		map("n", "<leader>sk", MiniExtra.pickers.keymaps, { desc = "Keymaps" })
	end,
})

P.add({
	src = "folke/flash.nvim",
	lazy = true,
	config = function()
		map({ "n", "x", "o" }, "<return>", require("flash").jump, { desc = "Flash" })
		map({ "n", "x", "o" }, "<s-return>", require("flash").treesitter, { desc = "Flash Treesitter" })
	end,
})

P.add({
	src = "neovim/nvim-lspconfig",
	lazy = true,
	config = function()
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
	end,
})

P.add({
	src = "Saghen/blink.cmp",
	version = vim.version.range("*"),
	lazy = true,
	event = "InsertEnter",
	config = function()
		require("blink.cmp").setup({
			sources = {
				default = { "lsp", "path", "buffer", "snippets" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		})
	end,
})

P.add({
	src = "nvim-treesitter/nvim-treesitter",
	lazy = true,
	config = function()
		---@diagnostic disable: missing-fields
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = { enable = true },
		})
	end,
})

P.add({
	src = "stevearc/conform.nvim",
	lazy = true,
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				zig = { "zigfmt" },
				cpp = { "clang-format" },
			},
		})
		map("n", "glf", require("conform").format, { desc = "Format Buffer" })
	end,
})

P.add({
	src = "catppuccin/nvim",
	name = "catppuccin",
	config = function()
		vim.cmd("colorscheme catppuccin")
	end,
})
