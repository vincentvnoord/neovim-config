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
				filetypes = { "html", },
			})
		end,
	},
}
