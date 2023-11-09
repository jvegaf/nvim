return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      mode = "buffers",
      always_show_bufferline = true,
      indicator = { style = "none" },
      offsets = {
        {
          filetype = "neo-tree",
          text = "Explorer",
          text_align = "center",
        },
      },
    },
  },
  -- keys = {
  --   { "<Tab>", }
  -- }
}
