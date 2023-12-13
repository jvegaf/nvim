local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    -- javascript = { { "prettierd", "prettier" } },
    javascript = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
    vue = { { "prettierd", "prettier" } },
    json = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
    html = { { "prettierd", "prettier" } },
    yaml = { { "prettierd", "prettier" } },
    markdown = { { "prettierd", "prettier" } },
    graphql = { { "prettierd", "prettier" } },
    svelte = { { "prettierd", "prettier" } },
    dart = { { "dartfmt" } },
  },
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end

    return {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      async = false,
      -- lsp_fallback = true,
      lsp_fallback = false,
    }
  end,
})

vim.keymap.set({ "n", "v" }, "<space>bf", function()
  conform.format({
    timeout_ms = 500,
    async = false,
    -- lsp_fallback = true,
    lsp_fallback = false,
  })
end, { desc = "Buffer format" })
