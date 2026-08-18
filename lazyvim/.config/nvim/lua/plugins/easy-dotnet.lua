return {
  {
    "GustavEikaas/easy-dotnet.nvim",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      -- Leave empty for default plug-and-play behavior
      -- Or add custom configurations here (e.g. terminal settings)
      lsp = {
        restart_roslyn_on_branch_change = true,
      },
    },
    config = function(_, opts)
      local dotnet = require("easy-dotnet")
      dotnet.setup(opts)

      -- Recommended Keymaps
      vim.keymap.set("n", "<leader>dr", function()
        dotnet.run_project()
      end, { desc = ".NET Run Project" })
      vim.keymap.set("n", "<leader>db", function()
        dotnet.build_solution()
      end, { desc = ".NET Build Solution" })
      vim.keymap.set("n", "<leader>dt", function()
        dotnet.test_solution()
      end, { desc = ".NET Test Solution" })
    end,
  },
}
