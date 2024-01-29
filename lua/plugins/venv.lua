return {
  {
    "AckslD/swenv.nvim",
    ft = "python",
    dependencies = {
      "ahmedkhalf/project.nvim",
      "nvim-lualine/lualine.nvim",
    },
    keys = { { "<leader>v", ":lua=require('swenv.api').pick_venv()<cr>", desc = "Select VirtualEnv" } },
    config = function()
      require("swenv").setup()

      local lualine = require("lualine")
      lualine.setup({
        options = {
          sections = {
            lualine_a = {
              "swenv",
              cond = function()
                return vim.bo.filetype == "python"
              end,
            },
          },
        },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "python" },
        callback = function()
          require("swenv.api").auto_venv()
        end,
      })
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    ft = "python",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    event = "VeryLazy",
    opts = {
      name = {
        "venv",
        ".venv",
        "env",
        ".env",
      },
      dap_enabled = true,
    },
    keys = { { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
}
