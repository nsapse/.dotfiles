return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
	},
	"mfussenegger/nvim-dap-python",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	{
		"mxsdev/nvim-dap-vscode-js",
		-- lazy spec to build "microsoft/vscode-js-debug" from source
		{
			"microsoft/vscode-js-debug",
			version = "1.x",
			build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
		},
	},
}
