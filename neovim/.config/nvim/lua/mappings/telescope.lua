local map = vim.keymap
local builtin = require('telescope.builtin')

-- grepping stuff
map.set('n', '<c-f>', ':Telescope file_browser<cr>')
map.set('n', '<leader>ff', function() builtin.current_buffer_fuzzy_find(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>sts', function() builtin.treesitter() end)
map.set('n', '<leader>sds', function() builtin.lsp_document_symbols() end)
map.set('n', '<leader>sws', function() builtin.lsp_workspace_symbols() end)
map.set('n', '<leader>sd', function() builtin.diagnostics(require('telescope.themes').get_ivy({})) end)
map.set('n', '<c-p>', function() builtin.live_grep(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>gs', function() builtin.grep_string(require('telescope.themes').get_ivy({})) end)

-- Telescope search built in resources
map.set('n', '<leader>sr', function() builtin.lsp_references(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>si', function() builtin.lsp_incoming_calls(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>so', function() builtin.lsp_outgoing_calls(require('telescope.themes').get_ivy({})) end)
map.set('n', '<c-b>', function() builtin.buffers(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>sq', function() builtin.quickfix(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>sk', function() builtin.keymaps(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>"', function() builtin.registers(require('telescope.themes').get_ivy({})) end)

map.set('n', '<leader>cc', function() builtin.colorscheme() end)
map.set('n', '<leader>st', ':TodoTelescope')


-- this is apparently deprecated - moved to zero configs
-- map.set('n', '<leader>ca', function() builtin.lsp_code_actions(require('telescope.themes').get_ivy({})) end)

--telescope git stuff
map.set('n', '<leader>gc',  function() builtin.git_commits(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>gcb', function() builtin.git_bcommits(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>gf',  function() builtin.git_files(require('telescope.themes').get_ivy({})) end)

-- help and manuals
map.set('n', '<leader>sh', function() builtin.help_tags() end)
map.set('n', '<leader>man', function() builtin.help_tags() end)

