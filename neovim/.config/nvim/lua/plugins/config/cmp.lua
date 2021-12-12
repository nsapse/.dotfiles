local cmp = require("cmp")
local lspkind = require("lspkind")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	snippet = {
		expand = function(args)
			-- vim.fn["UltiSnips#Anon"](args.body)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<Space>"] = cmp.mapping(cmp.mapping.confirm(), { "c" }),
		["<S-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<S-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},
	formatting = {
		format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
	},

	experimental = {
		native_menu = false,
		ghost_text = true,
	},

	--[[ completion = { autocomplete = false,
	}, ]]
	sources = cmp.config.sources({
		{ name = "ultisnips" }, -- For ultisnips users.
		{ name = "buffer", keyword_length = 3 },
		{ name = "nvim_lsp" },
		-- { name = "treesitter" },
		--{ name = 'vsnip' }, -- For vsnip users.
		{ name = "vimwiki-tags" }, -- For vimwiki
		{ name = "latex_symbols" }, -- For vimwiki
		{ name = "nvim_lua" },
		-- { name = "luasnip" }, -- For luasnip users.
		{ name = "path" },
		{ name = "orgmode" },
	}),
})

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require("lspconfig")
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require("lspconfig")["pyright"].setup({
	capabilities = capabilities,
})
require("lspconfig")["clangd"].setup({
	capabilities = capabilities,
})
require("lspconfig")["vimls"].setup({
	capabilities = capabilities,
})
