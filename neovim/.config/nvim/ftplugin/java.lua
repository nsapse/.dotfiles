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

-- Determine OS
local home = os.getenv("HOME")
if vim.fn.has("mac") == 1 then
	WORKSPACE_PATH = home .. "/workspace/"
	CONFIG = "mac"
elseif vim.fn.has("unix") == 1 then
	WORKSPACE_PATH = home .. "/workspace/"
	CONFIG = "linux"
else
	print("Unsupported system")
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = WORKSPACE_PATH .. project_name
-- get vscode-java-test into the bundle
vim.list_extend(bundles, vim.split(vim.fn.glob("/home/noah/Library/Java/vscode-java-test/server/*.jar", 1), "\n"))

local config = {
	cmd = { "/usr/bin/jdtls" },
	-- cmd = {
	--
	-- 	-- 💀
	-- 	"java", -- or '/path/to/java11_or_newer/bin/java'
	-- 	-- depends on if `java` is in your $PATH env variable and if it points to the right version.
	--
	-- 	"-Declipse.application=org.eclipse.jdt.ls.core.id1",
	-- 	"-Dosgi.bundles.defaultStartLevel=4",
	-- 	"-Declipse.product=org.eclipse.jdt.ls.core.product",
	-- 	"-Dlog.protocol=true",
	-- 	"-Dlog.level=ALL",
	-- 	"-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
	-- 	"-Xms1g",
	-- 	"--add-modules=ALL-SYSTEM",
	-- 	"--add-opens",
	-- 	"java.base/java.util=ALL-UNNAMED",
	-- 	"--add-opens",
	-- 	"java.base/java.lang=ALL-UNNAMED",
	--
	-- 	-- 💀
	-- 	"-jar",
	-- 	vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
	-- 	-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
	-- 	-- Must point to the                                                     Change this to
	-- 	-- eclipse.jdt.ls installation                                           the actual version
	--
	-- 	-- 💀
	-- 	"-configuration",
	-- 	home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. CONFIG,
	-- 	-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
	-- 	-- Must point to the                      Change to one of `linux`, `win` or `mac`
	-- 	-- eclipse.jdt.ls installation            Depending on your system.
	--
	-- 	-- 💀
	-- 	-- See `data directory configuration` section in the README
	-- 	"-data",
	-- 	workspace_dir,
	-- },
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
						name = "JavaSE-1.8",
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
					-- {
					-- 	name = "JavaSE-19",
					-- 	path = "/usr/lib/jvm/java-19-openjdk/",
					-- },
				},
			},
		},

		eclipse = {
			downloadSources = true,
		},
		configuration = {
			updateBuildConfiguration = "interactive",
		},
		maven = {
			downloadSources = true,
		},
		implementationsCodeLens = {
			enabled = true,
		},
		referencesCodeLens = {
			enabled = true,
		},
		references = {
			includeDecompiledSources = true,
		},
		inlayHints = {
			parameterNames = {
				enabled = "all", -- literals, all, none
			},
		},
		format = {
			enabled = false,
			-- settings = {
			--   profile = "asdf"
			-- }
		},
	},
	signatureHelp = { enabled = true },
	completion = {
		favoriteStaticMembers = {
			"org.hamcrest.MatcherAssert.assertThat",
			"org.hamcrest.Matchers.*",
			"org.hamcrest.CoreMatchers.*",
			"org.junit.jupiter.api.Assertions.*",
			"java.util.Objects.requireNonNull",
			"java.util.Objects.requireNonNullElse",
			"org.mockito.Mockito.*",
		},
	},
	on_init = function(client)
		if client.config.settings then
			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
	end,
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

map({ "n", "v" }, "<leader>ca", "<Cmd> lua vim.lsp.buf.code_action()<CR>")

map("n", "rn", "<cmd>lua vim.lsp.buf.rename()<cr>")
map({ "v", "n" }, "<C-k>", "<Cmd> lua vim.lsp.buf.signature_help()<CR>")

map({ "v", "n" }, "<C-k>", "<Cmd> lua vim.lsp.buf.<CR>")
map("n", "gd", "<cmd> lua vim.lsp.buf.declaration()<cr>")
map("n", "gd", "<cmd> lua vim.lsp.buf.definition()<cr>")
map("n", "K", "<cmd> lua vim.lsp.buf.hover()<cr>")
map("n", "gi", "<cmd> lua vim.lsp.buf.implementation()<cr>")
map("n", "<C-k>", "<cmd> lua vim.lsp.buf.signature_help()<cr>")
map("n", "<space>wa", "<cmd> lua vim.lsp.buf.add_workspace_folder()<cr>")
map("n", "<space>wr", "<cmd> lua vim.lsp.buf.remove_workspace_folder()<cr>")
map("n", "<space>D", "<cmd> lua vim.lsp.buf.type_definition()<cr>")
map("n", "<space>rn", "<cmd> lua vim.lsp.buf.rename()<cr>")
map({ "n", "v" }, "<space>ca", "<cmd> lua vim.lsp.buf.code_action()<cr>")
map("n", "gr", "<cmd> lua vim.lsp.buf.references()<cr>")
-- finally launch
require("lsp_signature").setup()
jdt.start_or_attach(config)
