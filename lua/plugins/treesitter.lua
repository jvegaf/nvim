return {
  -- {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-tree-docs",
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
    {
      "m-demare/hlargs.nvim",
      config = function()
        require("hlargs").setup({ color = "#F7768E" })
      end,
    },
  },
  build = ":TSUpdate",
  config = function()
    -- Parser for context awareness
    require("core.treesitter") -- colorscheme util
  end,
  -- },
}
