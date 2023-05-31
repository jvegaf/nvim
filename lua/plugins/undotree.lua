return {
  "jiaoshijie/undotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "BufReadPre",
  opts = {},
  keys = {
    {
      "<leader>cu",
      function()
        require("undotree").toggle()
      end,
      desc = "Undotree toggle",
    },
  },
}
