local dap = require("dap")
local dapui = require("dapui")

vim.fn.sign_define("DapBreakpoint", { text = "=>", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "~>", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "->", texthl = "", linehl = "", numhl = "" })

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode", -- adjust as needed
	name = "lldb",
}

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
		dlvToolPath = vim.fn.exepath("dlv"),  -- Adjust to where delve is installed
	},
}

-- Mappings

vim.keymap.set('n', '<leader>dd', dap.continue())
vim.keymap.set('n', '<leader>dj', dap.step_over())
vim.keymap.set('n', '<leader>dl', dap.step_into())
vim.keymap.set('n', '<leader>dk', dap.step_out())
vim.keymap.set('n', '<leader>db ', dap.toggle_breakpoint())
vim.keymap.set('n', '<leader>dB ', dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')))
vim.keymap.set('n', '<leader>dlb', dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')))
vim.keymap.set('n', '<leader>dr', dap.repl.open())
vim.keymap.set('n', '<leader>do', dapui.toggle())
vim.keymap.set('n', '<leader>dl', dap.run_last())
vim.keymap.set('n', '<leader>dc', dapui.close())

--nnoremap <leader>di :lua requiredap.ui.variables'.visual_hover()<CR>

