require("Bennys.settings.globals")
require("Bennys.settings.opt")
require("Bennys.settings.options")
local keys = require("Bennys.settings.keymaps")
require("Bennys.settings.autocmd")
local mapKeys = require("util").mapKeys
mapKeys(keys)
