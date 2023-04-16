local jdt = require("jdtls")

local on_attach = function(client, bufnr)
	require("jdtls").setup_dap({ hotcodereplace = "auto" })
end

-- make the bundle and get the java debug junk into there
local bundles = {
	vim.fn.glob(
		"/home/noah/Library/Java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
		1
	),
}

-- get vscode-java-test into the bundle
vim.list_extend(bundles, vim.split(vim.fn.glob("/home/noah/Library/Java/vscode-java-test/server/*.jar", 1), "\n"))

local config = {
	cmd = { "/usr/bin/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),
	init_options = {
		bundles = bundles,
	},
	settings = {
		java = {
			configuration = {
				-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
				-- And search for `interface RuntimeOption`
				-- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
				runtimes = {
					{
						name = "JavaSE-8",
						path = "/usr/lib/jvm/java-8-openjdk/",
					},
					{
						name = "JavaSE-11",
						path = "/usr/lib/jvm/java-11-openjdk/",
					},
					{
						name = "JavaSE-17",
						path = "/usr/lib/jvm/java-17-openjdk/",
					},
					{
						name = "JavaSE-19",
						path = "/usr/lib/jvm/java-19-openjdk/",
					},
				},
			},
		},
	},

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
map("n", "<leader>cd", '<Esc><Cmd>lua require("jdtls.dap").setup_dap_main_class_configs()<CR>')

map("n", "<C-a>", "<Cmd> lua vim.lsp.buf.code_action()<CR>")
map("n", "<leader>", "<Cmd> lua vim.lsp.buf.code_action()<CR>")
-- finally launch
jdt.start_or_attach(config)
