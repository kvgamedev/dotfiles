vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.files").setup()
require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
require("mini.tabline").setup()
require("mini.ai").setup()
require("mini.align").setup()
require("mini.bracketed").setup()
require("mini.surround").setup()
require("mini.comment").setup()
local miniclue = require("mini.clue")
miniclue.setup({
	window = { delay = 300 },
	triggers = {
		{ mode = "n", keys = "<Leader>" },
		{ mode = "x", keys = "<Leader>" },
		{ mode = "i", keys = "<C-x>" },

		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },

		{ mode = "n", keys = "'" },
		{ mode = "n", keys = "`" },
		{ mode = "x", keys = "'" },
		{ mode = "x", keys = "`" },
		{ mode = "n", keys = '"' },
		{ mode = "x", keys = '"' },

		{ mode = "i", keys = "<C-r>" },
		{ mode = "c", keys = "<C-r>" },

		{ mode = "n", keys = "<C-w>" },

		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },
	},

	clues = {
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},
})

require("mini.hipatterns").setup({
	highlighters = {
		fixme = { pattern = "FIXME", group = "MiniHipatternsFixme" },
		hack = { pattern = "HACK", group = "MiniHipatternsHack" },
		todo = { pattern = "TODO", group = "MiniHipatternsTodo" },
		note = { pattern = "NOTE", group = "MiniHipatternsNote" },
		hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
	},
})

--stylua: ignore start
vim.keymap.set("n", "<leader>e", MiniFiles.open, { desc = "Explorer" })
vim.keymap.set("n", "<S-h>", function() MiniBracketed.buffer("backward", nil) end, { desc = "Go to Prev Buffer" })
vim.keymap.set("n", "<S-l>", function() MiniBracketed.buffer("forward", nil) end, { desc = "Go to Next Buffer" })
