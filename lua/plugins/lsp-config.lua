return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local conf = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca>", vim.lsp.buf.code_action, {})

      conf.lua_ls.setup({
        capabilities = capabilities,
        cmd = { "lua-language-server" }, -- provided by nix
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      conf.ts_ls.setup({
        capabilities = capabilities,
        cmd = { "typescript-language-server", "--stdio" },
        settings = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      })

      conf.intelephense.setup({
        capabilities = capabilities,
        cmd = { "intelephense", "--stdio" },
        filetypes = { "php" },
        settings = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      })

      conf.html.setup({
        capabilities = capabilities,
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html" },
      })

      conf.eslint.setup({
        capabilities = capabilities,
        cmd = { "vscode-eslint-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      })

      conf.emmet_ls.setup({
        capabilities = capabilities,
        cmd = { "emmet-ls", "--stdio" }, -- from nodePackages.emmet-ls
        filetypes = {
          "html",
          "css",
          "scss",
          "javascriptreact",
          "typescriptreact",
        },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true,
            },
          },
        },

        conf.tailwindcss.setup({
          capabilities = capabilities,
          cmd = { "tailwindcss-language-server", "--stdio" },
          filetypes = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte" }, -- Add more as needed
          init_options = {
            userLanguages = {
              eelixir = "html", -- example mappings, remove if not needed
              eruby = "html",
            },
          },
        }),
      })
    end,
  },
}
