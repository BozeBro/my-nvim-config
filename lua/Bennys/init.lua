local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local newOpt = {
  dev = {
    path = "~/.config/plugins",
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true,      -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[]
      paths = {},        -- add any custom paths here that you want to includes in the rtp
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        -- "tarPlugin",
        -- "tohtml",
        -- "tutor",
        -- "zipPlugin",
      },
    },
  },
}
local util = require("util")
vim.g.mapleader = " "
vim.g.syncing = util.syncDefault()
local lazy = require("lazy")
lazy.setup("Bennys.plugins", newOpt)
require("Bennys.settings")

-- local json = require("json")
-- local file = io.open("~/test.json", "r")
-- local m = json.decode(file)
-- print(m)
-- vim.cmd([[colorscheme kangawa]])
-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
-- 	pattern = "*",
-- 	callback = function()
-- 		print("HELLO WORLD")
-- 		local cwd = vim.fn.getcwd()
-- 		vim.cmd([[ call chansend(v:stderr, printf("\033]7;file://%s\033\\", cwd)) ]])
-- 	end,
-- })

vim.api.nvim_create_autocmd({ "DirChanged" }, {
  pattern = "*",
  callback = function()
    vim.cmd([[ call chansend(v:stderr, printf("\033]7;file://%s\033\\", v:event.cwd)) ]])
  end,
  -- group = "my_other_autocommands",
})
-- vim.lsp.util.apply_text_document_edit = function(text_document_edit, index)
--   local text_document = text_document_edit.textDocument
--   local bufnr = vim.uri_to_bufnr(text_document.uri)
--
--   vim.lsp.util.apply_text_edits(text_document_edit.edits, bufnr)
-- end
