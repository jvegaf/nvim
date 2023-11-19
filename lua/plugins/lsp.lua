return {
  {
    "folke/neoconf.nvim",
    lazy = false,
    opts = {},
  },
  { "folke/neodev.nvim",  opts = {} },
  {
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    opts = {},
  },
  {
    "j-hui/fidget.nvim",
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
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
    opts = {
      ensure_installed = {
        "clang-format",
        "eslint_d",
        "jq",
        "java-debug-adapter",
        "java-test",
        "google-java-format",
        "ktlint",
        "prettierd",
        "shellcheck",
        "shfmt",
        "stylua",
        "yamlfmt",
        "yamllint",
      },
      auto_update = true,
    },
  },
  { "smiteshp/nvim-navic" },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
      {
        -- LSP Support
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lua" },

        -- Snippets
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },
      },
    },
    keys = {
      -- stylua: ignore
      {
        "<leader>sz",
        function() require("luasnip.loaders").edit_snippet_files() end,
        desc = "Edit snippets",
      },
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "jdtls",
          "lemminx",
          "dockerls",
          "docker_compose_language_service",
          "yamlls",
          "jsonls",
        },
        handlers = {
          lsp_zero.default_setup,
          jdtls = lsp_zero.noop,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
          end,
        },
      })

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      local cmp = require("cmp")
      local cmp_format = lsp_zero.cmp_format()
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        formatting = cmp_format,
        mapping = cmp.mapping.preset.insert({
          -- `Enter` key to confirm completion
          ["<CR>"] = cmp.mapping.confirm({ select = false }),

          -- Ctrl+Space to trigger completion menu
          ["<C-Space>"] = cmp.mapping.complete(),

          -- Navigate between snippet placeholder
          ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),

          -- Scroll up and down in the completion documentation
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }),
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      require('neoconf').setup()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      -- (Optional) Configure lua language server for neovim
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end
  }
}
