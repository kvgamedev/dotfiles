local M = {}
local api = vim.api

M.state = {
	buf = -1,
	win = -1,
}

local createWindow = function(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)
	local buf = nil
	if api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = api.nvim_create_buf(false, true)
	end

	local config = {
		relative = "editor",
		width = width,
		height = height,
		col = math.floor((vim.o.columns - width) / 2),
		row = math.floor((vim.o.lines - height) / 2),
		style = opts.style or "minimal",
		border = opts.border or "rounded",
		title = opts.title or "FZF",
		title_pos = "center",
	}
	local win = vim.api.nvim_open_win(buf, true, config)
	return { buf = buf, win = win }
end

M.state = createWindow({ buf = M.state.buf })
vim.fn.jobstart("fzf", {
	term = true,
	on_exit = function()
	end
})
return M
