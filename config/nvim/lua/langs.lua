-- -- Language Servers {{{
-- See mason-config.lua as mason is now trying to manage language servers
--
-- local lspconfig = require("lspconfig")
-- lspconfig.elixirls.setup({})
-- lspconfig.gleam.setup({})
-- lspconfig.gopls.setup({})
-- -- lspconfig.ruby_lsp.setup({})
-- lspconfig.ts_ls.setup({})
-- lspconfig.sorbet.setup({})
-- lspconfig.rubocop.setup({
-- 	cmd = { "bundle", "exec", "rubocop", "--lsp" },
-- 	filetypes = { "ruby" },
-- 	root_dir = util.root_pattern("Gemfile", ".git"),
-- })

-- Keymaps
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

-- }}}

-- Formatting {{{
local util = require("formatter.util")
require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		css = { require("formatter.filetypes.css").prettier },
		elixir = { require("formatter.filetypes.elixir").mixformat },
		go = { require("formatter.filetypes.go").gofmt },
		graphql = { require("formatter.filetypes.graphql").prettier },
		javascript = { require("formatter.filetypes.javascript").prettier },
		javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
		lua = { require("formatter.filetypes.lua").stylua },
		markdown = { require("formatter.filetypes.markdown").prettier },
		sh = { require("formatter.filetypes.sh").shfmt },
		terraform = { require("formatter.filetypes.terraform").terraformfmt },
		-- yaml = { require("formatter.filetypes.yaml").yamlfmt },
		zsh = { require("formatter.filetypes.zsh").beautysh },
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
-- }}}

-- Linting {{{
require("lint").linters_by_ft = {
	go = { "golangcilint" },
	javascript = { "eslint" },
	javascriptreact = { "eslint" },
	typescript = { "eslint" },
	typescriptreact = { "eslint" },
	css = { "stylelint" },
	sh = { "shellcheck" },
	yaml = { "yamllint" },
	dockerfile = { "hadolint" },
}
-- }}}
