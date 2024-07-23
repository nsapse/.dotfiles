-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require("lsp-zero").preset({})
local map = vim.keymap.set
lsp.preset("recommended")
lsp.set_preferences({
	set_lsp_keymaps = { omit = { "<F2>", "<F4>", "<leader>ca", "ca" } },
})

-- allow JDTLS to be setup with zero and mason
lsp.skip_server_setup({'jdtls'})
-- lsp.skip_server_setup({'tsserver'})

lsp.setup()
lsp.on_attach(function(_, bufnr)
	map("n", "rn", "<cmd>lua vim.lsp.buf.rename()<cr>")
	-- map("n", "rn", "<cmd>Lspsaga rename<cr>")
	-- map({ "n", "v" }, "<leader>ca", "lua vim.lsp.buf.code_action()<cr>")
	map({ "v", "n" }, "<leader>ca", "<Cmd> lua vim.lsp.buf.code_action()<CR>")
	-- map({ "v", "n" }, "<leader>ca", "<cmd> Lspsaga code_action<CR>")

	map({ "v", "n" }, "<C-k>", "<Cmd> lua vim.lsp.buf.signature_help()<CR>")
	-- bind("n", "<C-y>", function()
	-- 	vim.lsp.buf.format({ async = true })
	-- end, opts)
end)


-- configuration

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
cmp.setup({
	preselect = "item",
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "path" },
		{ name = "vim-dadbod-completion" },
        { name = "neorg"},
	},
	-- formatting = {
	-- 	-- fields = { "abbr", "kind", "menu" },
	-- 	-- format = require("lspkind").cmp_format({
	-- 	-- 	mode = "symbol_text", -- show only symbol annotations
	-- 	-- 	maxwidth = 50, -- prevent the popup from showing more than provided characters
	-- 	-- 	ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
	-- 	-- }),
	-- },
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	completion = {
		completeopt = "menu,menuone,noinsert",
	},

	mapping = {

		-- `Enter` key to confirm completion
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		-- Ctrl+Space to trigger completion menu
		["<C-Space>"] = cmp.mapping.complete(),

		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
		-- ["<Tab>"] = cmp_action.luasnip_jump_forward(),
		--       ["<S-Tab>"] = cmp_action.luasnip_jump_backward(),
	},
})
require("luasnip.loaders.from_vscode").lazy_load()

-- for typescript
require('typescript').setup({
  server = {
    on_attach = function(client, bufnr)

      map('n', '<leader>mi', '<cmd>TypescriptAddMissingImports<cr>', {buffer = bufnr})
      map('n', '<leader>oi', '<cmd>TypescriptOrganizeImports<cr>', {buffer = bufnr})
      map('n', '<leader>tfa', '<cmd>TypescriptFixAll<cr>', {buffer = bufnr})
      map('n', '<leader>gd', '<cmd>TypescriptGoToSourceDefinition<cr>', {buffer = bufnr})
      map('n', 'tgs', '<cmd>TypescriptGoToSourceDefinition<cr>', {buffer = bufnr})
    end
  }
})
