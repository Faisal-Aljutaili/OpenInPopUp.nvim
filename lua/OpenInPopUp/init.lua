local OpenInPopup = {}

function OpenInPopup:new(opts)
	local self = setmetatable(opts or {}, { __index = OpenInPopup })
	return self
end

function OpenInPopup:open(command, popup_opts)
	command = command or "ls"

	local width = popup_opts.width or 80
	local height = popup_opts.height or 10

	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local buf_terminal = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_option(buf_terminal, "filetype", "terminal")

	local win_terminal = vim.api.nvim_open_win(buf_terminal, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "single",
	})

	vim.fn.termopen(command, {
		cwd = vim.fn.getcwd(),
		env = vim.fn.environ(),
		on_exit = function(job_id, exit_code, event)
			vim.api.nvim_win_close(win_terminal, true)
		end,
	})

	vim.api.nvim_buf_set_keymap(buf_terminal, "n", "<esc>", "<cmd>q!<cr>", { noremap = true, silent = true })

	return buf_terminal, win_terminal
end

return OpenInPopup
