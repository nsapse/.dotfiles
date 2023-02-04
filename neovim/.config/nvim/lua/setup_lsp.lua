-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- configuration

lsp.set_preferences({
    set_lsp_keymaps = {omit = {'<F2>', '<F4>'}}
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr}
    local bind = vim.keymap.set
    bind('n', 'RR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    bind('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end)


-- -- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()
--
lsp.setup()
