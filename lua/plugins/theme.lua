return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({ flavour = "mocha" })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    priority = 0,
    config = function()
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
      })
      -- vim.cmd.colorscheme("gruvbox")
    end,
  },
}
