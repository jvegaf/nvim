require("config.options")
require("config.globals")
require("config.lazy")
require("config.autocmds")
require("config.keymaps")

-- local is_lin = vim.loop.os_uname().sysname == "Linux"
local is_win = vim.loop.os_uname().sysname == "Windows_NT"

-- if is_lin then
--   require("config.linux")
-- end

if is_win then
  require("config.windows")
end
