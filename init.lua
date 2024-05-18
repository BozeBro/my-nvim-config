-- package.path = package.path .. ";~/.luarocks.share/lua/5.1/?/init.lua;"
-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"

require("Bennys")
