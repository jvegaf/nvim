return {
  {
    "b0o/SchemaStore.nvim",
    version = false, -- last release is way too old
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    opts = {},
  },
  {
    "folke/neoconf.nvim",
    opts = {},
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    init = function()
      require("lazyvim.util").on_attach(function(client, buffer)
        if client.name == "tsserver" then
          vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end
      end)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/SchemaStore.nvim",
      "jose-elias-alvarez/typescript.nvim",
      "lvimuser/lsp-inlayhints.nvim",
    },
    ---@class PluginLspOpts
    opts = {
      ---@diagnostic disable-next-line: undefined-doc-name
      --- @type lspconfig.options
      servers = {

        lua_ls = {
          settings = {
            diagnostics = {
              globals = { "vim" },
            },
            telemetry = {
              enable = false,
            },
          },
        },

        tsserver = {},

        pyright = {},

        emmet_ls = {
          filetypes = {
            "html",
            "typescriptreact",
            "javascriptreact",
            "css",
            "sass",
            "scss",
            "less",
            -- "javascript",
            -- "typescript",
            "markdown",
          },
          init_options = {
            html = {
              options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L26
                ["bem.enabled"] = true,
              },
            },
          },
        },

        yamlls = {
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = new_config.settings.yaml.schemas or {}
            vim.list_extend(new_config.settings.yaml.schemas, require("schemastore").yaml.schemas())
          end,
          settings = {
            yaml = {
              format = {
                enable = true,
              },
              validate = { enable = true },
            },
          },
        },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          -- require("typescript").setup({ server = opts })
          require("typescript").setup({
            server = {
              capabilities = require("plugins.configs.tsserver").capabilities,
              handlers = require("plugins.configs.tsserver").handlers,
              on_attach = require("plugins.configs.tsserver").on_attach,
              settings = require("plugins.configs.tsserver").settings,
            },
          })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },
}
