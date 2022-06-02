--LSPConfig Setup
local lspconfig = require("lspconfig")

lspconfig.bashls.setup({})
-- require'lspconfig'.ccls.setup{}
lspconfig.clangd.setup({})
lspconfig.cssls.setup({})
lspconfig.gopls.setup({})
lspconfig.hls.setup({})
lspconfig.html.setup({})
lspconfig.jsonls.setup({})
-- lspconfig.pyright.setup({})
lspconfig.pylsp.setup({})
-- require'lspconfig'.jedi_language_server.setup{}
lspconfig.sqls.setup({})
lspconfig.sumneko_lua.setup({
	settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})
lspconfig.tsserver.setup({})
lspconfig.vimls.setup({})
lspconfig.texlab.setup({})
lspconfig.yamlls.setup({
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["../path/relative/to/file.yml"] = "/.github/workflows/*",
				["/path/from/root/of/project"] = "/.github/workflows/*",
			},
		},
	},
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>fb", vim.lsp.buf.format, bufopts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
	"bashls",
	"clangd",
	"cssls",
	"gopls",
	"hls",
	"html",
	"jsonls",
	"pylsp",
	"sqls",
	"sumneko_lua",
	"tsserver",
	"vimls",
	"texlab",
	"yamlls",
}
for _, lsp in pairs(servers) do
	require("lspconfig")[lsp].setup({
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
	})
end
