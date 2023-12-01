return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    mode = "n",
    prefix = "<leader>",
    window = {
      border = "single",
      position = "bottom",
      margin = { 1, 0, 1, 0 },
      padding = { 2, 2, 2, 2 },
    },
    layout = {
      height = { min = 1, max = 20 },
      width = { min = 20, max = 50 },
      spacing = 3,
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true,
    triggers = { "," },
    triggers_blacklist = {
      n = { "q", "Q" },
      i = { "q", "Q" },
      v = { "q", "Q" },
    },
    triggers_mode = "n",
    ignore_missing = false,
    disable = {},
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register({
      b = { name = "+Buffer" },
      c = { name = "+Code" },
      d = { name = "+Debug" },
      r = { name = "+Refactor" },
      f = { name = "+Find" },
      s = { name = "+System" },
      S = { name = "+Session" },
      g = { name = "+Git" },
      l = { name = "+LSP" },
      t = { name = "+Test" },
      T = { name = "+Treesitter" },
      x = { name = "+Diagnostics" },
    }, { prefix = "<leader>" })
  end,
}
