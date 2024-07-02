return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = { "dart" }
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    keys = {
      {
        { "<leaderft", ":Telescope flutter commands<CR>", desc = "Flutter commands" },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = function(_, opts)
          opts.ensure_installed = { "dart" }
        end,
      },
    },
    opts = {
      lsp = {
        color = {
          enabled = true,
          background = true,
          virtual_text = false,
        },
        settings = {
          showTodos = false,
          renameFilesWithClasses = "always",
          updateImportsOnRename = true,
          completeFunctionCalls = true,
          lineLength = 100,
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").load_extension("flutter")
    end,
  },
}
