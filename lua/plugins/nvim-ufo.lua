return {
  "kevinhwang91/nvim-ufo",
  lazy = false,
  dependencies = {
    "kevinhwang91/promise-async",
    "neovim/nvim-lspconfig",
    {
      "luukvbaal/statuscol.nvim",
      config = function()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
          relculright = true,
          segments = {
            { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
            { text = { "%s" }, click = "v:lua.ScSa" },
            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
          },
        })
      end,
    },
  },
  config = function()
    require("plugins.configs.nvim-ufo")
  end,
}
