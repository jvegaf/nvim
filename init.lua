-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")

local host = vim.loop.os_uname().sysname

if host == "Linux" then
  print("Linux")
  require("config.linux")
  return
end

require("config.windows")
