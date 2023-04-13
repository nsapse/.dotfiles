local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		-- injecting code actions
		null_ls.builtins.code_actions.eslint,
		-- null_ls.builtins.code_actions.eslintd,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.code_actions.gomodifytags,
		null_ls.builtins.code_actions.impl,
		null_ls.builtins.code_actions.refactoring,
		null_ls.builtins.code_actions.shellcheck,
		null_ls.builtins.code_actions.xo,

		-- -- injecting diagnostics
		-- null_ls.builtins.diagnostics.clang_check,
		-- null_ls.builtins.diagnostics.codespell,
		-- null_ls.builtins.diagnostics.commitlint,
		-- null_ls.builtins.diagnostics.cpplint,
		-- null_ls.builtins.diagnostics.dotenv_linter,
		-- -- null_ls.builtins.diagnostics.eslint,
		-- null_ls.builtins.diagnostics.flake8,
		-- null_ls.builtins.diagnostics.jshint,
		-- null_ls.builtins.diagnostics.jsonlint,
		-- null_ls.builtins.diagnostics.luacheck,
		-- null_ls.builtins.diagnostics.markdownlint,
		-- null_ls.builtins.diagnostics.xo,
		-- null_ls.builtins.diagnostics.yamllint,
		-- null_ls.builtins.diagnostics.zsh,
		-- -- null_ls.builtins.diagnostics.checkstyle, -- for java
		--
		-- -- formatters
		-- null_ls.builtins.formatting.autopep8,
		-- null_ls.builtins.formatting.beautysh,
		-- null_ls.builtins.formatting.black,
		-- null_ls.builtins.formatting.cbfmt,
		-- null_ls.builtins.formatting.clang_format,
		-- null_ls.builtins.formatting.eslint,
		-- null_ls.builtins.formatting.fixjson,
		-- null_ls.builtins.formatting.gofmt,
		-- null_ls.builtins.formatting.goimports,
		-- null_ls.builtins.formatting.isort,
		-- null_ls.builtins.formatting.jq,
		-- null_ls.builtins.formatting.lua_format,
		-- null_ls.builtins.formatting.prettier,
		-- null_ls.builtins.formatting.rustfmt,
		-- null_ls.builtins.formatting.shellharden,
		-- null_ls.builtins.formatting.shfmt,
		-- null_ls.builtins.formatting.stylua,
	},
})

require("mason-null-ls").setup({
	automatic_installation = true,
	ensure_installed = {
		"autopep8",
		"codespell",
		"clangcheck",
		"flake8",
		"isort",
		"jsonhint",
		"markdownlint",
		"prettier",
		"selene",
		"shellcheck",
		"shellharden",
		"shfmt",
		"stylua",
		"luafmt",
		"yamlint",
	},
})
