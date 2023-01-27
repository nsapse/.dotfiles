--LSPConfig Setup
local nvim_lsp = require('lspconfig')
local arduino_binary = '/home/noah/.arduino15/arduino-language-server'
local arduino_config = '/home/noah/.arduino15/arduino-cli.yaml'

nvim_lsp.arduino_language_server.setup({
	cmd = {
		arduino_binary,
		"-clangd", "/usr/bin/clangd",
		"-cli", "/usr/bin/arduino-cli",
		"-cli-config", arduino_config,
		"-fqbn", "arduino:avr:diecimila"
		-- "arduino:avr:uno",
		-- "-fqbn arduino:avr:uno",
	},
})
nvim_lsp.bashls.setup({})
nvim_lsp.ccls.setup({})
nvim_lsp.cssls.setup({})
nvim_lsp.gopls.setup({})
nvim_lsp.hls.setup({})
nvim_lsp.html.setup({})
nvim_lsp.jsonls.setup({})
nvim_lsp.jdtls.setup({})
nvim_lsp.pylsp.setup({})
nvim_lsp.racket_langserver.setup({})
nvim_lsp.solargraph.setup({})
nvim_lsp.sqls.setup({})
nvim_lsp.sumneko_lua.setup({
	settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})
nvim_lsp.tsserver.setup({})
nvim_lsp.vimls.setup({})
nvim_lsp.texlab.setup({})
nvim_lsp.yamlls.setup({
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

-- -- Mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
--
-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
-- 	-- Enable completion triggered by <c-x><c-o>
-- 	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
--
-- 	-- Mappings.
-- 	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
-- 	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
-- 	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
-- 	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
-- 	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
-- 	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
-- 	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
-- 	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
-- 	vim.keymap.set("n", "<leader>wl", function()
-- 		print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
-- 	end, bufopts)
-- 	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
-- 	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
-- 	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
-- 	vim.keymap.set("n", "<leader>fb", vim.lsp.buf.format, bufopts)
-- end
--
-- -- Use a loop to conveniently call 'setup' on multiple servers and
-- -- map buffer local keybindings when the language server attaches
-- local servers = {
-- 	"arduino_language_server",
-- 	"bashls",
-- 	"clangd",
-- 	"cssls",
-- 	"gopls",
-- 	"hls",
-- 	"html",
-- 	"jsonls",
-- 	"pylsp",
-- 	"sqls",
-- 	"sumneko_lua",
-- 	"tsserver",
-- 	"vimls",
-- 	"texlab",
-- 	"yamlls",
-- }
-- for _, lsp in pairs(servers) do
-- 	require'lspconfig'[lsp].setup({
-- 		on_attach = on_attach,
-- 		flags = {
-- 			debounce_text_changes = 150,
-- 		},
-- 	})
-- end
