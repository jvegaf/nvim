return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "prettierd",
        -- "jdtls",
        -- "java-test",
        -- "java-debug-adapter",
        -- "java-language-server",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "cssls",
        "cssmodules_ls",
        "clangd",
        "arduino_language_server",
        "lemminx",
        "html",
        "angularls",
        "prismals",
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "prisma-language-server",
        "clang-format",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        cpp = { "clang-format" },
        c = { "clang-format" },
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
    "jay-babu/mason-nvim-dap.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      -- ensure_installed = { "javadbg", "javatest", "kotlin" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      -- { "mfussenegger/nvim-jdtls" },
    },
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = function()
      -- require("lspconfig").clangd.setup({})
      -- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
      -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
      vim.api.nvim_command("MasonToolsInstall")

      local lspconfig = require("lspconfig")
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- local lsp_attach = function(client, bufnr)
      --   -- Create your keybindings here...
      -- end

      -- Call setup on each LSP server
      require("mason-lspconfig").setup_handlers({
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
          if server_name ~= "jdtls" then
            require("lspconfig")[server_name].setup({
              capabilities = lsp_capabilities,
            })
          end
        end,
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  -- Get the language server to recognize the `vim` global
                  globals = { "vim" },
                },
              },
            },
          })
        end,
        ["yamlls"] = function()
          require("lspconfig").yamlls.setup({
            capabilities = lsp_capabilities,
            settings = {
              yaml = {
                schemas = {
                  kubernetes = "/*.yaml",
                  -- Add the schema for gitlab piplines
                  -- ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*.gitlab-ci.yml",
                },
              },
            },
          })
        end,
        ["cssls"] = function()
          require("lspconfig").cssls.setup({
            capabilities = lsp_capabilities,
            settings = {
              css = {
                validate = true,
                lint = {
                  unknownAtRules = "ignore",
                },
              },
              scss = {
                validate = true,
                lint = {
                  unknownAtRules = "ignore",
                },
              },
              less = {
                validate = true,
                lint = {
                  unknownAtRules = "ignore",
                },
              },
            },
          })
        end,
        ["clangd"] = function()
          require("lspconfig").clangd.setup({
            capabilities = lsp_capabilities,
            cmd = { "clangd", "--offset-encoding=utf-8" },
          })
        end,
      })

      -- Lua LSP settings

      -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
      local open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or "rounded" -- Set border to rounded
        return open_floating_preview(contents, syntax, opts, ...)
      end
    end,
  },
  {
    "askfiy/lsp_extra_dim",
    event = { "LspAttach" },
    config = function()
      require("lsp_extra_dim").setup()
    end,
  },
  {
    "nanotee/sqls.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    ft = { "sql" },
  },
}
