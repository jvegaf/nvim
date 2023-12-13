require("config.globals")
require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.autocmds")

-- local is_lin = vim.loop.os_uname().sysname == "Linux"
local is_win = vim.loop.os_uname().sysname == "Windows_NT"

-- if is_lin then
--   require("config.linux")
-- end

if is_win then
  vim.notify("Windows detected")
  require("config.windows")
end
