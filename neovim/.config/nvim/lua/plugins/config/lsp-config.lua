--LSPConfig Setup
local nvim_lsp = require('lspconfig')

-- -- Mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
local map = vim.keymap
local lsp = vim.lsp.buf

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  map.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  map.set('n', 'K', vim.lsp.buf.hover, bufopts)
  map.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  map.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  map.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  map.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
  end, bufopts)
  map.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  map.set('n', 'RR', vim.lsp.buf.rename, bufopts)
  map.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  map.set('n', 'gr', vim.lsp.buf.references, bufopts)
  map.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local arduino_binary = '/home/noah/.arduino15/arduino-language-server'
local arduino_config = '/home/noah/.arduino15/arduino-cli.yaml'

nvim_lsp.arduino_language_server.setup({
    on_attach = on_attach,
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
nvim_lsp.bashls.setup({
    on_attach = on_attach,
})
nvim_lsp.ccls.setup({
    on_attach = on_attach,
})
nvim_lsp.cssls.setup({
    on_attach = on_attach,
})
nvim_lsp.gopls.setup({
    on_attach = on_attach,
})
nvim_lsp.hls.setup({
    on_attach = on_attach,
})
nvim_lsp.html.setup({
    on_attach = on_attach,
})
nvim_lsp.jsonls.setup({
    on_attach = on_attach,
})
nvim_lsp.jdtls.setup({
    on_attach = on_attach,
})
nvim_lsp.pylsp.setup({
    on_attach = on_attach,
})
nvim_lsp.racket_langserver.setup({
    on_attach = on_attach,
})
nvim_lsp.solargraph.setup({
    on_attach = on_attach,
})
nvim_lsp.sqls.setup({
    on_attach = on_attach,
})
nvim_lsp.sumneko_lua.setup({
	settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})
nvim_lsp.tsserver.setup({
    on_attach = on_attach,
})
nvim_lsp.vimls.setup({
    on_attach = on_attach,
})
nvim_lsp.texlab.setup({
    on_attach = on_attach,
})

nvim_lsp.yamlls.setup({
    on_attach = on_attach,
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
