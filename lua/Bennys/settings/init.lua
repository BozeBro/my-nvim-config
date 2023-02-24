require("Bennys.settings.globals")
require("Bennys.settings.opt")
require("Bennys.settings.options")
local keys = require("Bennys.settings.keymaps")
require("Bennys.settings.autocmd")
local mapKeys = require("Bennys.util").mapKeys
mapKeys(keys)
