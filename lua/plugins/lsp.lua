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
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    opts = {},
  },
  {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-emoji' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },
        {
          "jcdickinson/codeium.nvim",
          requires = {
            "nvim-lua/plenary.nvim",
          },
        },
        -- Snippets
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },

        { "jose-elias-alvarez/null-ls.nvim" },
        { "jay-babu/mason-null-ls.nvim" }
      },
      config = function()
local lsp = require("lsp-zero")

require("codeium").setup()

lsp.preset({})

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'lua_ls',
  'eslint',
  'jsonls',
  'yamlls',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-.>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>cws", function() vim.lsp.buf.workspace_symbol() end, opts)
  -- vim.keymap.set("n", "<leader>xd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  -- vim.keymap.set("n", "<leader>xc", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "grr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

lsp.on_attach(on_attach)

lsp.format_mapping('gf', {
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
    ['null-ls'] = { 'javascript', 'typescript', 'c', 'cpp', 'json', 'yaml' },
  }
})


lsp.setup()

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettierd.with({ filetypes = { "javascript", "typescript" } }),
    null_ls.builtins.formatting.jq.with({ filetypes = { "json" } }),
    null_ls.builtins.formatting.clang_format
  }
})

require("mason-null-ls").setup({
  ensure_installed = nil,
  automatic_installation = true,
})

lsp.set_sign_icons({
  error = ' ',
  warn  = ' ',
  hint  = ' ',
  info  = ' '
})

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  float = {
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

require('luasnip.loaders.from_vscode').lazy_load()

require('luasnip.loaders.from_vscode').lazy_load({ paths = { "./snippets" } })

cmp.setup({
  sources = {
    { name = 'nvim_lsp', priority = 900 },
    { name = 'luasnip',  priority = 850, keyword_length = 2, max_item_count = 8 },
    { name = 'codeium',  priority = 800 },
    { name = 'buffer',   priority = 700, keyword_length = 5, max_item_count = 8 },
    { name = 'nvim_lua', priority = 600 },
    { name = 'path',     priority = 500 },
    { name = 'emoji',    priority = 400 },
  }
})
      end
    },
}
