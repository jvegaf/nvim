local null_ls = require "null-ls"

null_ls.setup {
  sources = {
    -- null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.formatting.fixjson,
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.luacheck,
    null_ls.builtins.formatting.stylua,

    null_ls.builtins.diagnostics.yamllint,

  },
}

vim.keymap.set({ "n", "v" }, "<leader>xc", vim.lsp.buf.code_action, {desc = "LSP (null ls) Code actions"})
vim.keymap.set("n", "gf", function() return vim.lsp.buf.format { async = false, timeout_ms = 10000 } end, {desc = "LSP (null ls) Format file"})
vim.keymap.set("n", "<leader>ln", "<cmd>NullLsInfo<cr>", {desc = "Null Ls Info"})


-- function to toogle and possible restart it
vim.api.nvim_create_user_command("NullLsToggle", function()
  local sources = vim.tbl_map(function(el)
    return el.name
  end, null_ls.get_sources())
  vim.ui.select(sources, {}, function(selected)
    if not selected then
      return
    end
    null_ls.toggle(selected)
  end)
end, {})
