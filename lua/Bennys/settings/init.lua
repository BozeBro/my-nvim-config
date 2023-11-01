local settings = "Bennys.settings."
require("Bennys.settings.globals")
require("Bennys.settings.opt")
require("Bennys.settings.options")
require("Bennys.settings.rsync")
require("Bennys.settings.autocmd")
local mapKeys = require("util").mapKeys
local keys = require(settings .. "keymaps")
mapKeys(keys)
