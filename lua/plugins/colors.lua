-- Set transparency
local is_transparent = true -- Set to false to disable transparency in 🪟
-- if vim.fn.has("unix") == 1 then
--   is_transparent = true
-- end

if is_transparent then
  vim.opt.fillchars:append({
    horiz = " ",
    horizup = " ",
    horizdown = " ",
    vert = " ",
    vertleft = " ",
    vertright = " ",
    verthoriz = " ",
    eob = " ",
  })
end

return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      if is_transparent then
        require("nightfox").setup({
          options = {
            transparent = true,
          },
          groups = {
            all = {
              NormalFloat = { fg = "fg1", bg = "NONE" },
              WhichKeyFloat = { fg = "fg1", bg = "NONE" },
            },
          },
        })
      end
      -- vim.cmd("colorscheme nordfox")
    end,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      if is_transparent then
        require("tokyonight").setup({
          transparent = is_transparent,
          style = "night",
          -- styles = {
          --   sidebars = "transparent",
          --   floats = "transparent",
          -- },
        })
      end
      vim.cmd("colorscheme tokyonight-night")
    end,
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
    --   -- vim.cmd([[ colorscheme NeoSolarized ]])
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
}
