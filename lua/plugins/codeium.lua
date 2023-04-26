return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "jcdickinson/codeium.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      event = "InsertEnter",
      cmd = "Codeium",
      config = function()
        require("codeium").setup({})
      end,
    },
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "codeium" } }))
  end,
}
