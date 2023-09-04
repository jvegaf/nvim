return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  config = function()
 require("mason").setup()
require("mason-null-ls").setup({
    ensure_installed = {
        -- Opt to list sources here, when available in mason.
        "eslint_d",
        "prettierd",
        "jq",
        "shfmt",
        "shellcheck",
        "stylua",
        "clang-format"
    },
    automatic_installation = true,
    handlers = {},
})
require("null-ls").setup({
    sources = {
        -- Anything not supported by mason.
    }
})

    vim.keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.format({ async = false, timeout_ms = 10000 })<cr>",
      { noremap = true, silent = true, desc = "Format" })
  end,
}
