return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "prettierd",
        "jdtls",
        "java-test",
        "java-debug-adapter",
        "java-language-server",
        "kotlin-debug-adapter",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "cssls",
        "cssmodules-language-server",
        "kotlin-language-server",
        "lemminx",
        "html-lsp",
        "angular-language-server",
      },
    },
  },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     local builtins = require("null-ls").builtins
  --     require("null-ls").setup({
  --       sources = {
  --         builtins.formatting.prettierd.with({
  --           filetypes = { "javascript", "typescript", "css", "scss", "html", "json" },
  --         }),
  --         builtins.diagnostics.stylelint,
  --         builtins.formatting.stylua,
  --         builtins.diagnostics.ktlint,
  --         builtins.formatting.ktlint,
  --       },
  --     })
  --   end,
  -- },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        kotlin = { "ktlint" },
      },
    },
    keymaps = {
      {
        "gq",
        function()
          require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 10000,
          })
        end,
        mode = { "n", "v" },
        desc = "Format File or range (in visual mode)",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      -- "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "stylelint",
          "ktlint",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      ensure_installed = { "javadbg", "javatest", "kotlin" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "mfussenegger/nvim-jdtls" },
    },

    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    opts = {},
    -- config = function()
    --   local lspconfig = require("lspconfig")
    --   local capabilities = require("cmp_nvim_lsp").default_capabilities()
    --
    --   lspconfig.cssmodules_ls.setup({
    --     capabilities = capabilities,
    --     on_attach = function(client)
    --       client.server_capabilities.definitionProvider = false
    --     end,
    --     init_options = {
    --       camelCase = "dashes",
    --     },
    --   })
    -- end,
  },
}
