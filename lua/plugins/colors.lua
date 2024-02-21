return {
  {
    "tanvirtin/monokai.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   require("catppuccin").setup({
    --     flavor = "mocha",
    --     transparent_background = is_transparent,
    --   })
    --   -- vim.cmd("colorscheme catppuccin")
    -- end,
  },
  {
    "polirritmico/monokai-nightasty.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    -- config = function()
    --   require("NeoSolarized").setup({
    --     theme = "light", -- dark or light
    --   })
    --   -- vim.cmd([[ colorscheme NeoSolarized ]])W
    -- end,
  },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    lazy = false,
    -- config = function()
    --   require("modus-themes").setup({})
    --   -- vim.cmd("colorscheme modus")
    -- end,
  },
  {
    "oxfist/night-owl.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    -- config = function()
    --   require("night-owl").setup({})
    --   -- vim.cmd([[ colorscheme night-owl ]])
    -- end,
  },
  {
    "christianchiarulli/nvcode-color-schemes.vim",
    lazy = false,
    priority = 1000,
  },
}
