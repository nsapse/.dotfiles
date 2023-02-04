local jdt = require("jdtls")

local on_attach = function (client, bufnr)
    require('jdtls').setup_dap({ hotcodereplace = "auto" })
    -- require("plugins.lsp.handlers").on_attach
end

-- local home = os.getenv "HOME"

-- make the bundle and get the java debug junk into there
local bundles = {
vim.fn.glob(
    "/home/noah/Library/Java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
    1
),}

-- get vscode-java-test into the bundle
vim.list_extend(bundles, vim.split(vim.fn.glob("/home/noah/Library/Java/vscode-java-test/server/*.jar", 1), "\n"))

local config = {
	cmd = { "/usr/bin/jdtls" },
    
    -- may want to add different runtimes later

    -- setttings ={
    --     configuration = {
    --         runtimes = {
    --             {
    --                 name = "java-11-openjdk",
    --                 path = ""
    --             },
    --         }
    --     }
    -- },
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
	root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),
	init_options = {
		bundles = bundles,
	},
	-- capabilities = require("plugins.lsp.handlers").capabilities,
    on_attach = on_attach,
}

-- attach commands
vim.cmd([[
command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)
command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)
command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
command! -buffer JdtJol lua require('jdtls').jol()
command! -buffer JdtBytecode lua require('jdtls').javap()
command! -buffer JdtJshell lua require('jdtls').jshell()
]])
-- keymaps
local map = vim.keymap.set

map("n", "<leader>oi", '<Cmd>lua require("jdtls").organize_imports()<CR>')
map("n", "<leader>ev", '<Cmd>lua require("jdtls").extract_variable()<CR>')
map("v", "<leader>ev", '<Esc><Cmd>lua require("jdtls").extract_variable(true)<CR>')
map("n", "<leader>ec", '<Cmd>lua require("jdtls").extract_constant()<CR>')
map("v", "<leader>ec", '<Esc><Cmd>lua require("jdtls").extract_constant(true)<CR>')
map("v", "<leader>em", '<Esc><Cmd>lua require("jdtls").extract_method(true)<CR>')

-- If using nvim-dap
-- This jdtlb
map("n", "<leader>tc", '<Esc><Cmd>lua require("jdtls").test_class()<CR>')
map("n", "<leader>tm", '<Esc><Cmd>lua require("jdtls").test_nearest_method()<CR>')

-- finally launch
jdt.start_or_attach(config)
