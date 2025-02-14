local servers = {
	"tsserver",
	"lua_ls",
	"ruby-ls",
	"gopls",
}

return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local util = require("lspconfig.util")
			require("mason-lspconfig").setup({
				ensure_installation = servers,
				-- Don't enable this unless solargraph has improved in performance
				-- automatic_installation = true,
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
					["rubocop"] = function()
						require("lspconfig").rubocop.setup({
							cmd = { "rubocop", "--lsp" },
							filetypes = { "ruby" },
							root_dir = util.root_pattern("Gemfile.lock", ".git"),
						})
					end,
					["sorbet"] = function()
						require("lspconfig").sorbet.setup({
							cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
							filetypes = { "ruby" },
							root_dir = util.root_pattern("sorbet/config", ".git"),
						})
					end,
					["ruby_lsp"] = function()
						require("lspconfig").ruby_lsp.setup({
							cmd = { "ruby-lsp" },
							filetypes = { "ruby", "eruby" },
							root_dir = util.root_pattern("Gemfile.lock", ".git"),
							init_options = {
								formatter = "auto",
							},
							single_file_support = true,
						})
					end,
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client.supports_method("textDocument/implementation") then
						vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					end
					if client.supports_method("textDocument/definition") then
						vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					end
					if client.supports_method("textDocument/declaration") then
						vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					end
					if client.supports_method("textDocument/references") then
						vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					end
					if client.supports_method("textDocument/typeDefinition") then
						vim.keymap.set("n", "gs", vim.lsp.buf.type_definition, opts)
					end
					if client.supports_method("textDocument/rename") then
						vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					end
					if client.supports_method("textDocument/codeAction") then
						vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					end
					if client.supports_method("textDocument/hover") then
						vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					end
					-- if client.supports_method("textDocument/completion") then
					-- 	vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
					-- end
					if client.supports_method("textDocument/formatting") then
						-- Format the current buffer on save
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
							end,
						})
					end
				end,
			})
		end,
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		priority = 500,
	},
	-- {
	-- 	"creativenull/efmls-configs-nvim",
	-- 	-- version = 'v1.9.x', -- version is optional, but recommended
	-- 	dependencies = { "neovim/nvim-lspconfig" },
	-- 	config = function()
	-- 		local languages = require("efmls-configs.defaults").languages()
	-- 		local efmls_config = {
	-- 			filetypes = vim.tbl_keys(languages),
	-- 			settings = {
	-- 				rootMarkers = { ".git/" },
	-- 				languages = languages,
	-- 			},
	-- 			init_options = {
	-- 				documentFormatting = true,
	-- 				documentRangeFormatting = true,
	-- 			},
	-- 		}

	-- 		require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {}))

	-- 		local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	-- 		vim.api.nvim_create_autocmd("BufWritePost", {
	-- 			group = lsp_fmt_group,
	-- 			callback = function(ev)
	-- 				local efm = vim.lsp.get_active_clients({ name = "efm", bufnr = ev.buf })

	-- 				if vim.tbl_isempty(efm) then
	-- 					return
	-- 				end

	-- 				vim.lsp.buf.format({ name = "efm" })
	-- 			end,
	-- 		})
	-- 	end,
	-- },
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				graphql = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				ruby = { "rubocop" },
				python = { "isort", "black" },
			},
			format_after_save = {
				lsp_format = "last",
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			-- lint.linters_by_ft = {
			-- 	javascript = { "eslint_d" },
			-- 	typescript = { "eslint_d" },
			-- 	javascriptreact = { "eslint_d" },
			-- 	typescriptreact = { "eslint_d" },
			-- 	python = { "pylint" },
			-- 	ruby = { "rubocop" },
			-- 	proto = { "buf" },
			-- }

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					-- try_lint without arguments runs the linters defined in `linters_by_ft`
					-- for the current filetype
					require("lint").try_lint()
				end,
			})
		end,
	},
	-- { "hrsh7th/cmp-nvim-lsp" },
	-- { "hrsh7th/cmp-buffer" },
	-- { "hrsh7th/cmp-path" },
	-- { "hrsh7th/cmp-cmdline" },
	-- { "hrsh7th/nvim-cmp" },
}
