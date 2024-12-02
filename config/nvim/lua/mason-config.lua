local servers = {
	"tsserver",
	"lua_ls",
	"ruby-ls",
	"gopls",
}

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

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

-- {{{ Format after save
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

-- }}}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft`
		-- for the current filetype
		require("lint").try_lint()
	end,
})
