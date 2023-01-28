--python specific debugging
local dp = require("dap-python")
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
vim.keymap.set('n', 'leader>tm', dp.test_method(), {silent = true})
vim.keymap.set('n', 'leader>tc', dp.test_class(), {silent = true})
vim.keymap.set('n', '<leader>ds <ESC>', dp.debug_selection(), {silent = true})

