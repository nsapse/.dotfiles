local dp = require("dap-python")
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'

vim.keymap.set('n', 'leader>tm', function() dp.test_method() end, {silent = true})
vim.keymap.set('n', 'leader>tc', function() dp.test_class() end, {silent = true})
vim.keymap.set('n', '<leader>ds <ESC>', function() dp.debug_selection() end, {silent = true})


