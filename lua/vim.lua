vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.relativenumber = true
vim.opt.number = true

vim.o.updatetime = 100
vim.o.timeoutlen = 300
vim.o.redrawtime = 500

vim.g.mapleader = " "
-- vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
})

vim.keymap.set("n", "<C-g>", function()
	lazygit:toggle()
end, { desc = "Toggle lazygit" })

vim.keymap.set("n", "<C-n>", ":Yazi<CR>", { desc = "Open Yazi" })

-- Function to get Git project root, fallback to cwd
local function get_project_root()
	local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
	if vim.v.shell_error ~= 0 then
		return vim.fn.getcwd()
	end
	return git_root
end

-- Terminal instance
local project_term = Terminal:new({
	cmd = nil, -- nil for raw shell
	hidden = true,
	direction = "float",
	cwd = get_project_root(),
	float_opts = {
		border = "rounded",
		width = 120,
		height = 30,
	},
})

-- Keymap to toggle
vim.keymap.set("n", "<C-t>", function()
	project_term:toggle()
end, { desc = "Toggle project root terminal" })

vim.diagnostic.config({
	virtual_text = true,
	signs = false,
	update_in_insert = false,
	underline = true,
})

vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float(nil, {
		focus = true,
		border = "rounded",
		max_width = 80,
		scope = "cursor",
	})
end, { desc = "Show diagnostic message" })

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		local clients = vim.lsp.get_clients({ bufnr = 0 })
		if #clients > 0 then
			vim.lsp.buf.format({ async = false }) -- format synchronously
			vim.cmd("write") -- save buffer
		end
	end,
})
