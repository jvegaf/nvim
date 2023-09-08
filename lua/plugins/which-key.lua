return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")

    wk.register({
      b = { name = "+Buffer" },
      c = { name = "+Code" },
      d = { name = "+Debug" },
      r = { name = "+Refactor" },
      f = { name = "+Find" },
      s = { name = "+System" },
      g = { name = "+Git" },
      l = { name = "+LSP" },
      t = { name = "+Test" },
      T = { name = "+Treesitter" },
      x = { name = "+Diagnostics" },
    }, { prefix = "<leader>" })
  end,
}
