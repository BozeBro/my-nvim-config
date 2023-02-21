require("settings.globals")
require("settings.opt")
require("settings.options")
local keys = require("settings.keymaps")
require("settings.autocmd")
local mapKeys = require("util").mapKeys
mapKeys(keys)
