local map = vim.keymap
local builtin = require('telescope.builtin')

-- grepping stuff
map.set('n', '<c-f>', ':Telescope file_browser<cr>')
map.set('n', '<leader><leader>F', ':Telescope file_browser<cr>')
map.set('n', '<leader><leader>f', function () builtin.git_files((require('telescope.themes').get_ivy({}))) end)
map.set('n', '<leader>of', function () builtin.oldfiles((require('telescope.themes').get_ivy({}))) end)
map.set('n', '<leader>ff', function() builtin.current_buffer_fuzzy_find(require('telescope.themes').get_ivy({})) end)
map.set('n', '<C-p>', function() builtin.current_buffer_fuzzy_find(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>sts', function() builtin.treesitter() end)
map.set('n', '<leader>q', ":Telescope macros<CR>")
map.set('n', '<leader>dd', function() builtin.diagnostics(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>gg', function() builtin.live_grep(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>gw', function() builtin.grep_string(require('telescope.themes').get_ivy({})) end)

-- Telescope search built in resources
map.set('n', '<c-b>', function() builtin.buffers(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>ob', function() builtin.buffers(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader><leader>b', function() builtin.buffers(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>bb', function() builtin.buffers(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>sb', function() builtin.buffers(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>sm', function() builtin.marks() end)
map.set('n', '<leader>sq', function() builtin.quickfix(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>oq', function() builtin.quickfix(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>sk', function() builtin.keymaps(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>so', function() builtin.oldfiles(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>"', function() builtin.registers(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>cc', function() builtin.colorscheme() end)
map.set('n', '<leader>st', ':TodoTelescope<CR>')



-- LSP Stuff
map.set('n', '<leader>sf', '<cmd>Lspsaga finder<cr>')
-- map.set('n', '<leader>ci', '<cmd>Lspsaga incoming_calls<CR>')
-- map.set('n', '<leader>co', '<cmd>Lspsaga outgoing_calls<CR>')
map.set('n', 'sci', function() builtin.lsp_incoming_calls(require('telescope.themes').get_ivy({})) end)
map.set('n', 'sco', function() builtin.lsp_outgoing_calls(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>sr', function() builtin.lsp_references(require('telescope.themes').get_ivy({})) end)
map.set('n', 'gi', function() builtin.lsp_implementations(require('telescope.themes').get_ivy({})) end)
map.set('n', 'gd', function() builtin.lsp_definitions(require('telescope.themes').get_ivy({})) end)
map.set('n', 'gtd', function() builtin.lsp_type_definitions(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>gi', function() builtin.lsp_implementations(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>sd', function() builtin.diagnostics(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>ds', function() builtin.lsp_document_symbols() end)
map.set('n', '<leader>ws', function() builtin.lsp_workspace_symbols() end)
map.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
map.set('n', 'PD', '<cmd>Lspsaga peek_definition<CR>')
map.set('n', 'PT', '<cmd>Lspsaga peek_type_definition<CR>')
map.set('n', 'GD', '<cmd>Lspsaga goto_definition<CR>')
map.set('n', 'GT', '<cmd>Lspsaga goto_type_definition<CR>')
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

-- this is apparently deprecated - moved to zero configs
-- map.set('n', '<leader>ca', function() builtin.lsp_code_actions(require('telescope.themes').get_ivy({})) end)

--telescope git stuff
map.set('n', '<leader>gc',  function() builtin.git_commits(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>gcb', function() builtin.git_bcommits(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>gf',  function() builtin.git_files(require('telescope.themes').get_ivy({})) end)

-- help and manuals
map.set('n', '<leader>sh', function() builtin.help_tags() end)
map.set('n', '<leader>man', function() builtin.help_tags() end)

