return {
  { "folke/neodev.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neoconf.nvim",
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
      "smiteshp/nvim-navic",
      {
        "dmmulroy/tsc.nvim",
        cmd = { "TSC" },
        opts = {},
      },
      {
        "j-hui/fidget.nvim",
        opts = {
          notification = {
            window = {
              winblend = 0,
            },
          }
        },
      },
    },
    event = "VeryLazy",
    config = function()
      require("config.lsp")
    end,
  },
}
