return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      -- transparent = true,
      -- styles = {
      --   sidebars = "transparent",
      --   floats = "transparent",
      -- },
    },
    lazy = false,
  },
  {
    "martinsione/darkplus.nvim",
    lazy = false,
  },
  -- {
  --   "ray-x/aurora",
  --   lazy = false,
  --   config = function()
  --     vim.g.aurora_italic = true
  --     vim.g.aurora_transparent = true
  --     vim.g.aurora_bold = true
  --     vim.g.aurora_darker = true
  --     -- vim.cmd([[ colorscheme aurora ]])
  --   end,
  -- },
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight",
      colorscheme = "vscode",
    },
  },
}
