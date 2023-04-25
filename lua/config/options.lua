-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local host = vim.loop.os_uname().sysname

if host == "Linux" then
  require("config.linux")
  return
end

require("config.windows")
