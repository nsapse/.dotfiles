local jdt = require('jdtls')
local config = {
    cmd = {'/usr/bin/jdtls'},
--     cmd = {
--     'java',
-- 	'Declipse.application=org.eclipse.jdt.ls.core.id1',
-- 	'Dosgi.bundles.defaultStartLevel=4',
-- 	'Declipse.product=org.eclipse.jdt.ls.core.product',
-- 	'Dlog.level=ALL',
-- 	'noverify',
-- 	'Xmx1G',
-- 	'-add-modules=ALL-SYSTEM',
-- 	'-add-opens java.base/java.util=ALL-UNNAMED',
-- 	'-add-opens java.base/java.lang=ALL-UNNAMED',
-- 	'jar', '/home/noah/Library/Java/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
-- 	'configuration', '/home/noah/Library/Java/config_linux/',
-- 	'data', '$1',
--     }, 
      root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
jdt.start_or_attach(config)

local map = vim.keymap

map.set('n', '<A-o>', '<Cmd>lua require("jdtls").organize_imports()<CR>')
map.set('n', '<leader>ev', '<Cmd>lua require("jdtls").extract_variable()<CR>')
map.set('v', '<leader>ev', '<Esc><Cmd>lua require("jdtls").extract_variable(true)<CR>')
map.set('n', '<leader>ec', '<Cmd>lua require("jdtls").extract_constant()<CR>')
map.set('v', '<leader>ec', '<Esc><Cmd>lua require("jdtls").extract_constant(true)<CR>')
map.set('v', '<leader>em', '<Esc><Cmd>lua require("jdtls").extract_method(true)<CR>')

-- If using nvim-dap
-- This jdtlb
map.set('n', '<leader>tc', '<Esc><Cmd>lua require("jdtls").test_class()<CR>')
map.set('n', '<leader>tm', '<Esc><Cmd>lua require("jdtls").test_nearest_method()<CR>')
