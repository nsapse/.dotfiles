local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	-- on_attach = function (client)
	-- 	if client.resolved_capabilities.document_formatting then
	-- 		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	-- 	end
	-- end,
	debug = false,
	sources = {
		--formatters
		formatting.black,
		formatting.brittany,
		formatting.clang_format,
		formatting.eslint_d,
		formatting.fixjson,
		formatting.gofmt,
		formatting.goimports,
		formatting.google_java_format,
		formatting.isort,
		formatting.latexindent,
		formatting.prettier,
		formatting.rustfmt,
		formatting.shellharden,
		formatting.shfmt,
		formatting.sqlformat,
		formatting.stylua,

		--diagnostics
		diagnostics.chktex,
		diagnostics.cppcheck,
		diagnostics.flake8,
		diagnostics.luacheck,
		diagnostics.shellcheck,
		diagnostics.vint,
		diagnostics.yamllint,

		--code-actions
		code_actions.eslint_d,
		code_actions.refactoring,
		code_actions.shellcheck,
	},
})
