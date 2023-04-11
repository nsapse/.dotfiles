-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require("lsp-zero")
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
lsp.preset("recommended")

-- configuration

cmp.setup({
	preselect = "item",
	sources = {
		{ name = "path" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "nvim_lsp" },
	},
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = require("lspkind").cmp_format({
			mode = "symbol", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
		}),
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	mapping = {
		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
	},
})

lsp.set_preferences({
	set_lsp_keymaps = { omit = { "<F2>", "<F4>", "<leader>ca", "ca" } },
})

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr }
	local bind = vim.keymap.set
	bind("n", "rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	bind("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	bind("n", "<C-y>", function()
		vim.lsp.buf.format({ async = true })
	end, opts)
end)

-- lsp.setup_nvim_cmp({
--     mapping = lsp.defaults.cmp_mappings({
--         ['<Tab>'] = cmp.mapping.select_next_item(),
--         ['<S-Tab>'] = cmp.mapping.select_prev_item(),
--     })
-- })

-- config for cmp/snippets
-- -- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()
--
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
    }
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
lsp.setup()
require("luasnip.loaders.from_vscode").lazy_load()
