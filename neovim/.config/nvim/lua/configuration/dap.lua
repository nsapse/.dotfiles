local dap = require("dap")
local dapui = require("dapui")

require("dap-vscode-js").setup({
	debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
})

local js_based_languages = { "typescript", "javascript", "typescriptreact" }

for _, language in ipairs(js_based_languages) do
    require("dap").configurations[language] = {
					-- attach to a node process that has been started with
					-- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
					-- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
					{
						-- use nvim-dap-vscode-js's pwa-node debug adapter
						type = "pwa-node",
						-- attach to an already running node process with --inspect flag
						-- default port: 9222
						request = "attach",
						-- allows us to pick the process using a picker
						processId = require 'dap.utils'.pick_process,
						-- name of the debug action you have to select for this config
						name = "Attach debugger to existing `node --inspect` process",
						-- for compiled languages like TypeScript or Svelte.js
						sourceMaps = true,
						-- resolve source maps in nested locations while ignoring node_modules
						resolveSourceMapLocations = {
							"${workspaceFolder}/**",
							"!**/node_modules/**" },
						-- path to src in vite based projects (and most other projects as well)
						cwd = "${workspaceFolder}/src",
						-- we don't want to debug code inside node_modules, so skip it!
						skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
					},
					{
						type = "pwa-chrome",
						name = "Launch Chrome to debug client",
						request = "launch",
						url = "http://localhost:5173",
						sourceMaps = true,
						protocol = "inspector",
						port = 9222,
						webRoot = "${workspaceFolder}/src",
						-- skip files from vite's hmr
						skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
					},
					-- only if language is javascript, offer this debug action
					language == "javascript" and {
						-- use nvim-dap-vscode-js's pwa-node debug adapter
						type = "pwa-node",
						-- launch a new process to attach the debugger to
						request = "launch",
						-- name of the debug action you have to select for this config
						name = "Launch file in new node process",
						-- launch current file
						program = "${file}",
						cwd = "${workspaceFolder}",
					} or nil,
				}
  -- require("dap").configurations[language] = {
  --   {
  --     type = "pwa-node",
  --     request = "launch",
  --     name = "Launch file",
  --     program = "${file}",
  --     cwd = "${workspaceFolder}",
  --   },
  --   {
  --     type = "pwa-node",
  --     request = "attach",
  --     name = "Attach",
  --     processId = require 'dap.utils'.pick_process,
  --     cwd = "${workspaceFolder}",
  --   },
  --   {
  --     type = "pwa-chrome",
  --     request = "launch",
  --     name = "Start Chrome with \"localhost\"",
  --     url = "http://localhost:3000",
  --     webRoot = "${workspaceFolder}",
  --     userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
  --   }
  -- }
end

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

require("dapui").setup()
require("nvim-dap-virtual-text").setup()

vim.fn.sign_define("DapBreakpoint", { text = "->", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = ">>", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "->", texthl = "", linehl = "", numhl = "" })

-- Mappings
--nnoremap <leader>di :lua requiredap.ui.variables'.visual_hover()<CR>

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode", -- adjust as needed
	name = "lldb",
}

--[[ dap.adapters.firefox = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/Developer/vscode-firefox-debug/dist/adapter.bundle.js'},
}

dap.configurations.typescript = {
  {  
  name = 'Debug with Firefox',
  type = 'firefox',
  request = 'launch',
  reAttach = true,
  url = 'http://localhost:3000',
  webRoot = '${workspaceFolder}',
  firefoxExecutable = '/Applications/Firefox.app/Contents/MacOS/firefox-bin'
  }
}

dap.configurations.javascript = dap.configurations.typescript
]]

-- dap.adapters.chrome = {
-- 	type = "executable",
-- 	command = "node",
-- 	args = { os.getenv("HOME") .. "/Developer/vscode-chrome-debug/out/src/chromeDebug.js" }, -- TODO adjust
-- }
-- --
-- dap.configurations.javascript = { -- change this to javascript if needed
-- 	{
-- 		type = "chrome",
-- 		request = "attach",
-- 		program = "${file}",
-- 		cwd = vim.fn.getcwd(),
-- 		sourceMaps = true,
-- 		protocol = "inspector",
-- 		port = 9222,
-- 		webRoot = "${workspaceFolder}",
-- 	},
-- }
-- --
-- dap.configurations.typescript = { -- change to typescript if needed
-- 	{
-- 		type = "chrome",
-- 		request = "attach",
-- 		program = "${file}",
-- 		cwd = vim.fn.getcwd(),
-- 		sourceMaps = true,
-- 		protocol = "inspector",
-- 		port = 9222,
-- 		webRoot = "${workspaceFolder}",
-- 	},
-- }

-- dap.adapters["pwa-node"] = {
--   type = "server",
--   host = "localhost",
--   port = "${port}",
--   executable = {
--     command = "node",
--     -- 💀 Make sure to update this path to point to your installation
--     args = {"/Users/noah.sapse/Developer/js-debug/src/dapDebugServer.js", "${port}"},
--   }
-- }
-- dap.configurations.typescript = {
--   {
--     type = 'pwa-node',
--     request = 'launch',
--     name = "Launch file",
--     runtimeExecutable = "deno",
--     runtimeArgs = {
--       "run",
--       "--inspect-wait",
--       "--allow-all"
--     },
--     program = "${file}",
--     cwd = "${workspaceFolder}",
--     attachSimplePort = 9229,
--   },
-- }
--
-- dap.configurations.javascript = dap.configurations.typescript
-- dap.configurations.javascript = {
--   {
--     type = "pwa-node",
--     request = "launch",
--     name = "Launch file",
--     program = "${file}",
--     cwd = "${workspaceFolder}",
--   },
-- }

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = function()
			return vim.fn.input("Enter arguments")
		end,

		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
		--
		--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
		--
		-- Otherwise you might get the following error:
		--
		--    Error on launch: Failed to attach to the target process
		--
		-- But you should be aware of the implications:
		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
		runInTerminal = false,
	},
}

-- If you want to use this for rust and c, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.adapters.python = {
	type = "executable",
	command = "/usr/bin/python",
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	{
		-- The first three options are required by nvim-dap
		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = "launch",
		name = "Launch file",

		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

		program = "${file}", -- This configuration will launch the current file if used.
		pythonPath = function()
			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
				return cwd .. "/venv/bin/python"
			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
				return cwd .. "/.venv/bin/python"
			else
				return "/usr/bin/python"
			end
		end,
	},
}

dap.adapters.go = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/dev/golang/vscode-go/dist/debugAdapter.js" },
}
dap.configurations.go = {
	{
		type = "go",
		name = "Debug",
		request = "launch",
		showLog = false,
		program = "${file}",
		dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
	},
}
