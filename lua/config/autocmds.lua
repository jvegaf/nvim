-- autocmd are automatically loaded on the VeryLazy event
-- Default autocmd that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmd.lua
-- Add any additional autocmd here
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("general", { clear = true })
augroup("YankHighlight", { clear = true })

autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = "YankHighlight",
  pattern = "*",
})

autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  group = "general",
  desc = "Disable New Line Comment",
})

autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach_auto_diag", { clear = true }),
  callback = function(args)
    -- the buffer where the lsp attached
    ---@type number
    local buffer = args.buf

    -- create the autocmd to show diagnostics
    vim.api.nvim_create_autocmd("CursorHold", {
      group = vim.api.nvim_create_augroup("_auto_diag", { clear = true }),
      buffer = buffer,
      callback = function()
        local opts = {
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          border = "rounded",
          source = "always",
          prefix = " ",
          scope = "cursor",
        }
        vim.diagnostic.open_float(nil, opts)
      end,
    })
  end,
})

-- disable autoformat

autocmd({ "FileType" }, {
  pattern = { " * " },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- nvim-tree

local function open_nvim_tree(data)
  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- create a new, empty buffer
  vim.cmd.enew()

  -- wipe the directory buffer
  vim.cmd.bw(data.buf)

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

autocmd({ "VimEnter" }, { callback = open_nvim_tree })
