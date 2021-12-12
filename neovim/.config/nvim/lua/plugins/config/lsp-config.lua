--LSPConfig Setup
local lspconfig = require("lspconfig")

require("lspconfig").bashls.setup({})
-- require'lspconfig'.ccls.setup{}
require("lspconfig").clangd.setup({})
require("lspconfig").cssls.setup({})
require("lspconfig").gopls.setup({})
require("lspconfig").hls.setup({})
require("lspconfig").html.setup({})
require("lspconfig").jsonls.setup({})
require("lspconfig").pyright.setup({})

-- require("lspconfig").pylsp.setup({})
-- require'lspconfig'.jedi_language_server.setup{}
require("lspconfig").sqls.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").vimls.setup({})
require("lspconfig").texlab.setup({})
