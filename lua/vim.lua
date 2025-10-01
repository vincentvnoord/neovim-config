vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.relativenumber = true
vim.opt.number = true

vim.g.mapleader = " "
-- vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")

vim.keymap.set("n", "<C-n>", ":Yazi<CR>", { desc = "Open Yazi" })

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
