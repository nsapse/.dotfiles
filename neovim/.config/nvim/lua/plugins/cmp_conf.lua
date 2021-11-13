local cmp = require'cmp'
cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
	  require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },

	mapping = {
	  ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's','c'}),
	  ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's','c'}),
	  ['<Space>'] = cmp.mapping(cmp.mapping.confirm(), {'c'}),
	  --['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
	  ['<S-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	  ['<S-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
	  ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
	  ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
	  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.close(),
	  ['<CR>'] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	  })
	},

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
	  --{ name = 'vsnip' }, -- For vsnip users.
	  { name = 'vimwiki-tags' }, -- For vimwiki
      { name = 'latex_symbols' }, -- For vimwiki
      { name = 'buffer' },
	  { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      { name = 'path' },
    }
    )
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).

  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
 require('lspconfig')['pyright'].setup {
   capabilities = capabilities
  }
  require('lspconfig')['vimls'].setup {
    capabilities = capabilities
  }

