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
	set_lsp_keymaps = { omit = { "<F2>", "<F4>", "<leader>ca", "ca"} },
})

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr }
	local bind = vim.keymap.set
	bind("n", "RR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
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
lsp.setup()
require("luasnip.loaders.from_vscode").lazy_load()
