return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "jose-elias-alvarez/null-ls.nvim",
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          border = "rounded",
        },
      },
    },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    {
      "b0o/SchemaStore.nvim",
      version = false, -- last release is way too old
    },
    {
      "dmmulroy/tsc.nvim",
      cmd = { "TSC" },
      opts = {},
    },
    {
      "j-hui/fidget.nvim",
      enabled = false,
      opts = {
        window = {
          blend = 0,
        },
        sources = {
          ["null-ls"] = {
            ignore = true,
          },
        },
      },
    },
  },
  event = "VeryLazy",
  config = function()
    require("config.lsp")
  end,
}
