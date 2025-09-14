local M = {}
local H = {}
local gr = vim.api.nvim_create_augroup("LazyLoad", { clear = true })

M.add = function(opts)
	if opts.lazy then
		H.lazy_load(function()
			H.add_plugin(opts)
		end)
		return
	end
	H.add_plugin(opts)
end

H.add_plugin = function(opts)
	local src = "https://github.com/" .. opts.src
	if type(opts) == "string" then
		vim.pack.add({ { src = src } }, { confirm = false })
		return
	elseif type(opts) == "table" then
		if opts.name and opts.version then
			vim.pack.add({ { src = src, name = opts.name, version = opts.version } }, { confirm = false })
		elseif opts.name then
			vim.pack.add({ { src = src, name = opts.name } }, { confirm = false })
		elseif opts.version then
			vim.pack.add({ { src = src, version = opts.version } }, { confirm = false })
		else
			vim.pack.add({ { src = src } }, { confirm = false })
		end

		if opts.config then
			opts.config()
		end
	end
end

H.lazy_load = function(callback, event)
	if event then
		vim.api.nvim_create_autocmd(event, {
			pattern = "*",
			once = true,
			group = gr,
			callback = function()
				vim.defer_fn(callback, 0)
			end,
		})
		return
	end
	vim.api.nvim_create_autocmd("UIEnter", {
		pattern = "*",
		once = true,
		group = gr,
		callback = function()
			vim.defer_fn(callback, 0)
		end,
	})
end

return M
