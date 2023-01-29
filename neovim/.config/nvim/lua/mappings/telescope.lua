local map = vim.keymap
local builtin = require('telescope.builtin')

-- Using Lua functions
map.set('n', '<c-f>', ':Telescope file_browser<cr>')
map.set('n', '<leader>fz', function() builtin.current_buffer_fuzzy_find(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>sts', function() builtin.treesitter() end)
map.set('n', '<leader>ds', function() builtin.lsp_document_symbols() end)
map.set('n', '<leader>ws', function() builtin.lsp_workspace_symbols() end)
map.set('n', '<leader>sd', function() builtin.diagnostics(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>gg', function() builtin.live_grep(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>gw', function() builtin.grep_string(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>', function() builtin.registers() end)

-- Telescope grep seeps crashing - remapped to ripgrem in Floatterm
map.set('n', '<leader>sr', function() builtin.lsp_references(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>sb', function() builtin.buffers(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>sh', function() builtin.help_tags() end)
map.set('n', '<leader>sq', function() builtin.quickfix(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>sk', function() builtin.keymaps(require('telescope.themes').get_ivy({})) end)

map.set('n', '<leader>cc', function() builtin.colorscheme() end)
map.set('n', '<leader>ca', function() builtin.lsp_code_actions(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>st', ':TodoTelescope')

--telescope git stuff
map.set('n', '<leader>gc',  function() builtin.git_commits(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>gcb', function() builtin.git_bcommits(require('telescope.themes').get_ivy({})) end)
map.set('n', '<leader>gf',  function() builtin.git_files(require('telescope.themes').get_ivy({})) end)
