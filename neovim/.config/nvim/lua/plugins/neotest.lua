return {
  {
    "nvim-neotest/neotest",
    ft = { "go", "rust", "python", "cs", "typescript", "javascript" },
    dependencies = {
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-python",
      "rouge8/neotest-rust",
      "Issafalcon/neotest-dotnet",
      "nvim-neotest/neotest-jest",
    },
    opts = function()
      return {
        -- your neotest config here
        adapters = {
          require "neotest-dotnet",
          require "neotest-python",
          require "neotest-rust",
          require "neotest-go",
          require "neotest-jest",
        },
      }
    end,
    config = function(_, opts)
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup(opts)
    end,
  }
}
