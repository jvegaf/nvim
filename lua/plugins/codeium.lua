local codeium_wsl = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "jcdickinson/codeium.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
      },
      config = function()
        require("codeium").setup({})
      end,
    },
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "codeium" } }))
  end,
}

local codeium_default = {
  "Exafunction/codeium.vim",
  lazy = false,
  cmd = "Codeium",
  event = "InsertEnter",
    -- stylua: ignore
    config = function ()
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set("i", "<A-d>", function() return vim.fn["codeium#Accept"]() end, { noremap = true, expr = true, desc = "Codeium Accept" })
      vim.keymap.set("i", "<A-.>", function() return vim.fn["codeium#CycleCompletions"](1) end, { noremap = true, expr = true, desc = "Codeium Cycle next" })
      vim.keymap.set("i", "<A-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { noremap = true, expr = true, desc = "Codeium Cycle prev" })
      vim.keymap.set("i", "<A-q>", function() return vim.fn["codeium#Clear"]() end, { noremap = true, expr = true, desc = "Codeium Clear" })
      vim.keymap.set("i", "<A-s>", function() return vim.fn["codeium#Complete"]() end, { noremap = true, expr = true, desc = "Codeium Complete" })
    end,
}

local is_lin = vim.loop.os_uname().sysname == "Linux"

local is_wsl = is_lin and vim.loop.os_uname().release:lower():find("microsoft") and true or false

if is_wsl then
  return codeium_wsl
end

return codeium_default
