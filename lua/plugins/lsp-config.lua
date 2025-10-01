return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local conf = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				cmd = { "lua-language-server" },
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			vim.lsp.enable("lua_ls")

			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				cmd = { "typescript-language-server", "--stdio" },
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				settings = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			})
			vim.lsp.enable("ts_ls")

			-- conf.intelephense.setup({
			-- 	capabilities = capabilities,
			-- 	cmd = { "intelephense", "--stdio" },
			-- 	filetypes = { "php" },
			-- 	settings = {
			-- 		diagnostics = {
			-- 			globals = { "vim" },
			-- 		},
			-- 	},
			-- })

			vim.lsp.config("html", {
				capabilities = capabilities,
				cmd = { "vscode-html-language-server", "--stdio" },
				filetypes = { "html" },
			})
			vim.lsp.enable("html")

			vim.lsp.config("eslint", {
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
			})

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
			})

			conf.gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			})

			conf.csharp_ls.setup({
				capabilities = capabilities,
				cmd = { "csharp-ls" },
				filetypes = { "cs" },
				root_dir = conf.util.root_pattern("*.sln", "*.csproj", ".git"),
			})

			conf.clangd.setup({
				capabilities = capabilities,
				cmd = { "clangd" },
				filetypes = { "c", "cpp", "objc", "objcpp" },
			})
		end,
	},
}
