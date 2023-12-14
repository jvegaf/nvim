return {
  "linux-cultist/venv-selector.nvim",
  cmd = "VenvSelect",
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
}
