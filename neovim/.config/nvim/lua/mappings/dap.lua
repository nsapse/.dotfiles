local map = vim.keymap.set
-- map('n', '<leader>dd', ':lua require("dap").continue()<CR>')
-- map('n', '<leader>dj', ':lua require("dap").step_over()<CR>')
-- map('n', '<leader>dl', ':lua require("dap").step_into()<CR>')
-- map('n', '<leader>dk', ':lua require("dap").step_out()<CR>')
-- map('n', '<leader>tb ', ':lua require("dap").toggle_breakpoint()<CR>')
-- map('n', '<leader>tB ', ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
-- map('n', '<leader>tlb', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
-- map('n', '<leader>dr', ':lua require("dap").repl.open()<CR>')
map("n", "<leader>dt", function()
	require("dapui").toggle()
end)
-- map('n', '<leader>dl', ':lua require("dap").run_last()<CR>')
-- map('n', '<leader>dc', ':lua require("dapui").close()<CR>')

map("n", "<leader><leader>d", function()
	require("dap").continue()
end)
map("n", "dj", function()
	require("dap").step_over()
end)
map("n", "dh", function()
	require("dap").step_into()
end)
map("n", "d;", function()
	require("dap").step_out()
end)
map("n", "<Leader>b", function()
	require("dap").toggle_breakpoint()
end)
map("n", "<leader>B", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
-- map("n", "<Leader>B", function()
-- 	require("dap").set_breakpoint()
-- end)
map("n", "<Leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
map("n", "<Leader>dr", function()
	require("dap").repl.open()
end)
map("n", "<Leader>dl", function()
	require("dap").run_last()
end)
map({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end)
map({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)
map("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
map("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)
