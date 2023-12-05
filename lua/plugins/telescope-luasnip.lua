return {
  "benfowler/telescope-luasnip.nvim",
  lazy = false,
  dependecies = { "nvim-telescope/telescope.nvim", "L3MON4D3/LuaSnip" },
  config = function()
    require("telescope").load_extension("luasnip")
  end,
}
