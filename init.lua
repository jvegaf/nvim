-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")

local is_win = vim.loop.os_uname().sysname == "Windows_NT"

if not is_win then
  require("config.linux")
  return
end

if is_win then
  require("config.windows")
end
