vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>')

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  update_in_insert = false,
  underline = true,
})
