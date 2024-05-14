vim.g.mapleader = " "
vim.g.maplocalleader = " "
local util = require("util")
vim.g.syncing = util.syncDefault()
require("Bennys.settings")
require("Bennys.lazy")
