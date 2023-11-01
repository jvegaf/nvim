return {
  {
    "tanvirtin/monokai.nvim",
    lazy = false,
  },
  {
    "askfiy/visual_studio_code",
    priority = 100,
    config = function()
      vim.cmd([[colorscheme visual_studio_code]])
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "askfiy/visual_studio_code",
    },
    config = function()
      require("bufferline").setup({
        options = {
          themable = true,
          close_icon = "",
          custom_areas = {
            right = require("visual_studio_code").get_bufferline_right(),
          },
        },
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "askfiy/visual_studio_code",
    },
    config = function()
      require("lualine").setup({
        options = {
          theme = "visual_studio_code",
          icons_enabled = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {},
          globalstatus = true,
          refresh = {
            statusline = 100,
          },
        },
        sections = require("visual_studio_code").get_lualine_sections(),
      })
    end,
  },
}
