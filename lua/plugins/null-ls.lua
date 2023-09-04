return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettierd.with({ filetypes = { "javascript", "typescript" } }),
        null_ls.builtins.formatting.jq.with({ filetypes = { "json" } }),
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.diagnostics.shellcheck,
      }
    })

    require("mason-null-ls").setup({
      ensure_installed = nil,
      automatic_installation = true,
    })

    vim.keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.format({ async = false, timeout_ms = 10000 })<cr>",
      { noremap = true, silent = true, desc = "Format" })
  end,
}
