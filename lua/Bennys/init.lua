vim.g.mapleader = " "
vim.g.maplocalleader = " "
--
require("Bennys.settings")
require("Bennys.lazy")
vim.defer_fn(function()
    require("Bennys.settings.keymaps")
    local util = require("util")
    vim.g.syncing = util.syncDefault()
    vim.o.tabline = ""
end, 70)
