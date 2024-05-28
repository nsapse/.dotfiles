return {
{ -- This plugin
  "Zeioth/compiler.nvim",
  cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
  dependencies = { "stevearc/overseer.nvim" },
  config = function(_, opts) require("compiler").setup(opts) end,
},
{ -- The task runner we use
  "stevearc/overseer.nvim",
  cmd = { "CompilerOpen", "CompilerToggleResults" },
  opts = {
    task_list = {
      direction = "bottom",
      min_height = 25,
      max_height = 25,
      default_detail = 1,
      bindings = { ["q"] = function() vim.cmd("OverseerClose") end },
    },
  },
},
}
