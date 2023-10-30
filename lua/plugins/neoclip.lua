return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    -- {'ibhagwan/fzf-lua'},
  },
  config = function()
    require("neoclip").setup()

    require("telescope").load_extension("neoclip")
  end,
  keys = {
    { "<leader>cc", "<cmd>Telescope neoclip<cr>", desc = "Neoclip" },
  },
}
