local map = vim.keymap.set
local function augroup(name)
    return vim.api.nvim_create_augroup("Bennys " .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})
-- vim.api.nvim_create_autocmd("BufWinEnter", {
-- 	pattern = "*",
-- 	callback = function(event)
-- 		-- print("Hi")
-- 		-- print(vim.inspect(vim.bo[event.buf]))
-- 		if vim.bo[event.buf].filetype == "help" then
-- 			vim.bo[event.buf].buflisted = true
-- 			vim.cmd.only()
-- 		end
-- 	end,
-- })
vim.api.nvim_create_autocmd({ "DirChanged" }, {
    pattern = "*",
    callback = function()
        vim.cmd([[ call chansend(v:stderr, printf("\033]7;file://%s\033\\", v:event.cwd)) ]])
    end,
    -- group = "my_other_autocommands",
})

local regCreate = require("util").createPrefixUserCMD
regCreate("Help", function(args)
    -- vim.opt.buflisted = true
    -- vim.bo[event.buf].buflisted = true
    vim.cmd.help(args.args)
    vim.cmd.only()
end, { nargs = 1, complete = "help" })
vim.api.nvim_create_autocmd({ "TabEnter", "UIEnter" }, {
    -- pattern = "LazyVimStarted",
    once = true,
    callback = function()
        -- this needs to be deffered for some other stuff to load, I am not sure there is a better event
        vim.defer_fn(function()
            local mark = require("harpoon.mark")
            local harpoon_buffers = {}
            local current_idx = 1

            while mark.get_marked_file_name(current_idx) do
                harpoon_buffers[current_idx] = mark.get_marked_file_name(current_idx)
                current_idx = current_idx + 1
            end

            -- for each of the harpoon buffers we open them
            for _, buffer in ipairs(harpoon_buffers) do
                vim.cmd("badd " .. buffer)
            end

            require("harpoon.ui").nav_file(1)
        end, 10)
    end,
})

local home = vim.fn.expand("~")

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--     pattern = {
--
--         home .. "/.config/kitty/PaperColor",
--         home .. "/.config/kitty/current-theme.conf",
--         home .. "/.config/kitty/kitty-themes/themes/3024_Day.conf",
--         home .. "/.config/kitty/kitty-themes/themes/Solarized_Darcula.conf",
--         home .. "/.config/kitty/kitty.conf",
--         home .. "/.config/kitty/kitty.conf.bak",
--         home .. "/.config/kitty/theme.conf",
--         home .. "/.config/kitty/themes",
--         home .. "/.config/kitty/tokyo.conf",
--         home .. "/.config/neofetch/config.conf",
--         home .. "/.config/nvim",
--         home .. "/.config/skhd/skhdrc",
--         home .. "/.gitmodules",
--         home .. "/.images/background.jpg",
--         home .. "/.images/opm.png",
--         home .. "/.skhdrc",
--         home .. "/.vimrc",
--         home .. "/.yabairc",
--         home .. "/.zprofile",
--         home .. "/.zsh_dir/.zsh_aliases",
--         home .. "/.zsh_history",
--         home .. "/.zsh_sessions/2F0320E7-A99F-4149-97ED-026A843B4CC0.historynew.LOCK",
--         home .. "/.zsh_sessions/4B98EC1F-E1DE-4743-9A4C-CD14C207C963.session",
--         home .. "/.zsh_sessions/94A79A32-37D9-496E-9862-BA2BE4BC6DC0.session",
--         home .. "/.zsh_sessions/_expiration_check_timestamp",
--         home .. "/.zshenv",
--         home .. "/.zshrc",
--         home .. "/Brewfile",
--     },
--     callback = function()
--         local path = vim.fn.expand("%")
--         os.execute("yadm add -q " .. path)
--         os.execute("yadm commit -q -m 'nvim commit' " .. path)
--     end,
-- })
