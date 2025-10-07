local startup = {
	"colorscheme",
}
local lazy = {
	"kvim",
	"flash",
	"lsp",
	"fzf",
	"mini",
	"noice",
	"lualine",
	"gitsigns",
}

for _, i in ipairs(startup) do
	require("plugins." .. i)
end
vim.defer_fn(function()
	for _, i in ipairs(lazy) do
		require("plugins." .. i)
	end
end, 0)
