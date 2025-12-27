return {
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
      keymap = {
        preset = "default",
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      completion = { documentation = { auto_show = false } },

      sources = {
        default = { "lsp", "snippets", "buffer", "path" },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true },
    },
  },
  {
    "github/copilot.vim",
    enabled = false,
  },
  --   {
  --     "hrsh7th/cmp-nvim-lsp",
  --   },
  --   {
  --     "L3MON4D3/LuaSnip",
  --     dependencies = {
  --       "saadparwaiz1/cmp_luasnip",
  --       "rafamadriz/friendly-snippets",
  --     },
  --   },
  --   {
  --     "hrsh7th/nvim-cmp",
  --     config = function()
  --       local cmp = require("cmp")
  --       require("luasnip.loaders.from_vscode").lazy_load()
  --
  --       cmp.setup({
  --         snippet = {
  --           -- REQUIRED - you must specify a snippet engine
  --           expand = function(args)
  --             require("luasnip").lsp_expand(args.body)
  --           end,
  --         },
  --         window = {
  --           completion = cmp.config.window.bordered(),
  --           documentation = cmp.config.window.bordered(),
  --         },
  --         mapping = cmp.mapping.preset.insert({
  --           ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --           ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --           ["<C-Space>"] = cmp.mapping.complete(),
  --           ["<C-e>"] = cmp.mapping.abort(),
  --           ["<CR>"] = cmp.mapping.confirm({ select = true }),
  --         }),
  --         sources = cmp.config.sources({
  --           { name = "nvim_lsp" },
  --           { name = "luasnip" }, -- For luasnip users.
  --         }, {
  --           { name = "buffer" },
  --         }),
  --       })
  --     end,
  --   },
}
