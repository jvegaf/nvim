return {
  {
    "folke/noice.nvim",
    enabled = false,
    dependencies = {
      "rcarriga/nvim-notify",
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    config = function()
      require("noice").setup({
        lsp = {
          progress = {
            enabled = true,
          },
        },
        routes = {
          {
            filter = {
              event = "msg_show",
              any = {
                { find = "%d+L, %d+B" },
                { find = "; after #%d+" },
                { find = "; before #%d+" },
              },
            },
            view = "mini",
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          lsp_doc_border = true,
        },
        messages = {
          -- Using kevinhwang91/nvim-hlslens because virtualtext is hard to read
          view_search = false,
        },
      })
      -- vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#bb9af7", bg = "none" })
      -- vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { fg = "#7dcfff", bg = "none" })
      -- vim.api.nvim_set_hl(0, "NoiceCmdlinePopupIcon", { fg = "#7dcfff", bg = "none" })
    end,
  },
  -- {
  --   "rcarriga/nvim-notify",
  --   event = "VeryLazy",
  --   config = function()
  --     require("notify").setup({
  --       background_colour = "#000000",
  --     })
  --   end,
  -- },
}
