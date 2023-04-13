-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require("lsp-zero").preset({})
lsp.preset("recommended")
lsp.set_preferences({
	set_lsp_keymaps = { omit = { "<F2>", "<F4>", "<leader>ca", "ca" } },
})

lsp.setup()
lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr }
	local bind = vim.keymap.set
	bind("n", "rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	bind("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	-- bind("n", "<C-y>", function()
	-- 	vim.lsp.buf.format({ async = true })
	-- end, opts)
end)

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
require("luasnip.loaders.from_vscode").lazy_load()

-- configuration

cmp.setup({
	preselect = "item",
	sources = {
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "nvim_lsp" },
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
