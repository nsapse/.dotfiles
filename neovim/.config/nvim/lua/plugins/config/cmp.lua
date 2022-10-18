local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
	snippet = {
		expand = function(args)
			-- vim.fn["UltiSnips#Anon"](args.body)
			-- vim.fn["vsnip#anonymous"](args.body)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item()
		-- 	elseif vim.fn["vsnip#available"](1) == 1 then
		-- 		feedkey("<Plug>(vsnip-expand-or-jump)", "")
		-- 	elseif has_words_before() then
		-- 		cmp.complete()
		-- 	else
		-- 		fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
		-- 	end
		-- end, { "i", "s" }),
		--
		-- ["<S-Tab>"] = cmp.mapping(function()
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 	elseif vim.fn["vsnip#jumpable"](-1) == 1 then
		-- 		feedkey("<Plug>(vsnip-jump-prev)", "")
		-- 	end
		-- end, { "i", "s" }),
		-- For Luasnip
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
		--[[ ["<Tab>"] = cmp.mapping.complete();
		["<S-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	 ]]
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
		format = lspkind.cmp_format({
			with_text = true,
			maxwidth = 50,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[lsp]",
				vsnip = "[snips]",
				-- luasnip = "[Lsnip]",
				-- ultisnips = "[Usnip]",
				nvim_lua = "[nv_lua]",
				latex_symbols = "[ltex]",
			},
		}),
	},

	experimental = {
		-- native_menu = false,
		-- ghost_text = true,
	},

	--[[ completion = { autocomplete = false,
	}, ]]
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip" }, -- For luasnip users.
		-- { name = "vsnip" }, -- For vsnip users.
		-- { name = "ultisnips" }, -- For ultisnips users.
		-- { name = "treesitter" },
		{ name = "vimwiki-tags" }, -- For vimwiki
		{ name = "latex_symbols" }, -- For vimwiki
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "orgmode" },
	}),
})

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
require("lspconfig")["arduino_language_server"].setup({
	capabilities = capabilities,
})
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require("lspconfig")["pyright"].setup({
-- 	capabilities = capabilities,
-- })
require("lspconfig")["pylsp"].setup({
	capabilities = capabilities,
	settings = {
        pylsp = {
            plugins = {
                jedi_completion = {
                    include_params = true,
                },
            },
        },
	},
})
require("lspconfig")["bashls"].setup({
	capabilities = capabilities,
})
require("lspconfig")["tsserver"].setup({
	capabilities = capabilities,
})
require("lspconfig")["rust_analyzer"].setup({
	capabilities = capabilities,
})
require("lspconfig")["ccls"].setup({
	capabilities = capabilities,
})
require("lspconfig")["vimls"].setup({
	capabilities = capabilities,
})
require("lspconfig")["jdtls"].setup({
	capabilities = capabilities,
})
require("lspconfig")["sumneko_lua"].setup({
	capabilities = capabilities,
})
require("lspconfig")["gopls"].setup({
	capabilities = capabilities,
})
require("lspconfig")["solargraph"].setup({
	capabilities = capabilities,
})
