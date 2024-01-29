return{
  "AckslD/nvim-neoclip.lua",
  event = "VeryLazy",
  dependencies = {
    {'nvim-telescope/telescope.nvim'},
  },
  config = function()
    require('neoclip').setup()
    require('telescope').load_extension('neoclip')
  end,
  keys = {
    {"<leader>cl", "<cmd>Telescope neoclip<cr>", desc = "Neoclip" },
  }
}
