local all_modes = { "n", "i", "v" }
local m = {
    "å",
    "∫",
    "ç",
    "∂",
    "´",
    "ƒ",
    "©",
    "˙",
    "ˆ",
    "∆",
    "˚",
    "¬",
    "µ",
    "˜",
    "ø",
    "π",
    "œ",
    "®",
    "ß",
    "†",
    "¨",
    "√",
    "∑",
    "≈",
    "¥",
    "Ω",
}
local M = {
    "Å",
    "ı",
    "Ç",
    "Î",
    "´",
    "Ï",
    "˝",
    "Ó",
    "ˆ",
    "Ô",
    "",
    "Ò",
    "Â",
    "˜",
    "Ø",
    "∏",
    "Œ",
    "‰",
    "Í",
    "ˇ",
    "¨",
    "◊",
    "„",
    "˛",
    "Á",
    "¸",
}

local keys = {
    { "n", "<leader>cd", "<cmd>Telescope zoxide list<cr>", { desc = "Cd into directory" } },
    { "n", "<leader>n", "<cmd>Telescope noice<cr>", { desc = "Open messages" } },
    -- {
    -- {"n", "v"},
    -- "ddd",
    -- function ()
    --     vim.cmd[[CFilter! matchstr(getline('.'), '.\{-}\ze<bar>')]]
    -- end,
    -- {}},
    -- },
    -- {
    -- 	all_modes,
    -- 	"å",
    -- 	"<M-a>",
    -- },
    -- {
    -- 	all_modes,
    -- 	"œ",
    -- 	"<M-a>",
    -- },
    -- {},
    {
        "n",
        "<leader>o",
        function()
            local cnt = 0
            vim.lsp.buf.code_action {
                apply = true,
                filter = function()
                    cnt = cnt + 1
                    return cnt == 1
                end,
            }
        end,
    },

    {
        "i",
        "<S-Enter>",
        function()
            local ls = require("luasnip")
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end,
        { desc = "Force expand or jump for Enter" },
    },
    { { "n", "v" }, "<Space>", "<Nop>", { silent = true, desc = "Make <Leader> behave as expected" } },
    { "n", "<S-Tab>", "<Nop>", { silent = true } },
    {
        "n",
        "k",
        -- "v:count ? 'k' : 'gk'",
        function()
            if vim.v.count and vim.v.count > 0 then
                return "m'" .. vim.v.count .. "gk"
            else
                return "gk"
            end
        end,
        { expr = true, silent = true, desc = "remap for dealing with word wrap", noremap = true },
    },
    {
        "n",
        "j",
        function()
            if vim.v.count and vim.v.count > 0 then
                return "m'" .. vim.v.count .. "gj"
            else
                return "gj"
            end
        end,
        { expr = true, silent = true, noremap = true },
    },
    -- {
    -- 	"i",
    -- 	"<C-l>",
    -- 	"<Tab>",
    -- 	{ silent = true, noremap = true },
    -- },
    {
        "n",
        "<C-l>",
        "i<Tab><Esc>",
        {},
    },
    {
        "i",
        "<C-S-l>",
        "<S-Tab>",
        { silent = true, noremap = true },
    },
    { { "n", "v" }, "<leader>q", "<cmd>q<cr>", { desc = "Quit Vim" } },
    { { "n", "v" }, "<leader>w", "<cmd>w<cr>", { desc = "Save Vim" } },
    {
        { "n", "v" },
        "<leader>zq",
        "<cmd>q!<cr>",
        { desc = "Quit w/e saving" },
    },
    {
        { "n", "v" },
        "<leader>zz",
        "<cmd>qall<cr>",
        { desc = "Quit all" },
    },
    {
        { "n" },
        "<leader>xx",
        "<cmd>wq<cr>",
        { desc = "Quit and Save" },
    },

    -- Resize the screen,
    {
        { "n" },
        "<C-0>",
        "<cmd>resize +5<cr>",
        {},
    },
    {

        { "n" },
        "<C-9>",
        "<cmd>resize -5<cr>",
        {},
    },
    {
        { "n", "v" },
        "<C-c>",
        "<cmd>vertical resize +5<cr>",
        { desc = "Increase screen size" },
    },
    {
        { "n", "v" },
        "<C-x>",
        "<cmd>vertical resize -5<cr>",
        { desc = "Decrease screen size" },
    },
    {
        "n",
        "<leader>e",
        "<cmd>Telescope file_browser<cr>",
        { desc = "Open File Explorer" },
    },
    {
        "n",
        "<leader>vv",
        "<cmd>below vnew<cr>",
        { desc = "Open Split Window" },
    },
    {
        "n",
        "<leader>vl",
        "<cmd>above vnew<cr>",
        { desc = "Open Split Window" },
    },
    {
        "n",
        "<leader>hh",
        "<cmd>above new<cr>",
        { desc = "Open Horizontal" },
    },
    {
        "n",
        "<leader>hl",
        "<cmd>below new<cr>",
        { desc = "Open Horizontal" },
    },
    {
        "n",
        "<leader>th",
        "<cmd>ToggleTerm direction=horizontal<cr>",
        { desc = "Toggle Horizontal Terminal" },
    },
    {
        "n",
        "<leader>tv",
        "<cmd>ToggleTerm direction=vertical<cr>",
        { desc = "Toggle Vertical Terminal" },
    },
    {
        { "i", "v" },
        "jk",
        "<ESC>",
    },

    -- {
    -- 	{ "i" },
    -- 	"<c-\\>",
    -- 	"<ESC><CMD>" .. vim.v.count1 .. "ToggleTerm<cr>",
    -- 	{ silent = true, desc = "Toggle nth Terminal" },
    -- },
    -- {
    --     "i",
    --     "<Tab>",
    --     "<cmd>lua EscapePair()<CR>",
    --     { noremap = true, silent = true, desc = "Escape Pair" },
    -- },
    {
        "n",
        "<leader>bn",
        "<cmd>bnext<cr>",
        { desc = "Go to next Buffer" },
    },
    {
        "n",
        "<leader>bb",
        "<cmd>bprev<cr>",
        { desc = "Go to previous Buffer" },
    },
    {
        "n",
        "<leader>bd",
        "<cmd>bd<cr>",
        { desc = "Close current buffer" },
    },
    -- {
    -- 	"n",
    -- 	"<leader>1",
    -- 	"<cmd>lua require('bufferline').go_to_buffer(1, true)<cr>",
    -- 	{ desc = "Go to first tab" },
    -- },
    -- {
    -- 	"n",
    -- 	"<leader>2",
    -- 	"<cmd>lua require('bufferline').go_to_buffer(2, true)<cr>",
    -- 	{ desc = "Go to second tab" },
    -- },
    -- {
    -- 	"n",
    -- 	"<leader>3",
    -- 	"<cmd>lua require('bufferline').go_to_buffer(3, true)<cr>",
    -- 	{ desc = "Go to third tab" },
    -- },
    -- {
    -- 	"n",
    -- 	"<leader>4",
    -- 	"<cmd>lua require('bufferline').go_to_buffer(4, true)<cr>",
    -- 	{ desc = "Go to fourth tab" },
    -- },
    -- {
    -- 	"n",
    -- 	"<leader>5",
    -- 	"<cmd>lua require('bufferline').go_to_buffer(5, true)<cr>",
    -- 	{ desc = "Go to fifth tab" },
    -- },
    -- {
    -- 	"n",
    -- 	"<leader>6",
    -- 	"<cmd>lua require('bufferline').go_to_buffer(6, true)<cr>",
    -- 	{ desc = "Go to sixth tab" },
    -- },
    -- {
    -- 	"n",
    -- 	"<leader>7",
    -- 	"<cmd>lua require('bufferline').go_to_buffer(7, true)<cr>",
    -- 	{ desc = "Go to seventh tab" },
    -- },
    -- {
    -- 	"n",
    -- 	"<leader>8",
    -- 	"<cmd>lua require('bufferline').go_to_buffer(8, true)<cr>",
    -- 	{ desc = "Go to eighth tab" },
    -- },
    -- {
    -- 	"n",
    -- 	"<leader>9",
    -- 	"<cmd>lua require('bufferline').go_to_buffer(9, true)<cr>",
    -- 	{ desc = "Go to ninth tab" },
    -- },
    {
        "n",
        "<leader>tn",
        "<cmd>tabe<cr>",
        { desc = "Open new tab" },
    },
    -- { "n", "<leader>tc", "<cmd>tabc<cr>", { desc = "Close tab" } },
    -- { "n", "<leader>ff", "<cmd>Telescope find_files find_command=fd<cr>", { desc = "Find Files" } },
    { "n", "<leader>fn", "<cmd>Telescope noice<cr>", { desc = "Open messages" } },
    -- { "n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "File grep" } },
    -- {
    -- 	"n",
    -- 	"<leader>fb",
    -- 	"<cmd>Telescope buffers<cr>",
    -- 	{ desc = "Find buffer" },
    -- },
    { "n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help" } },
    {
        "n",
        "<leader>fo",
        '<cmd>lua require"telescope.builtin".oldfiles()<cr>',
        { desc = "Find Old files" },
    },
    -- {
    -- 	"n",
    -- 	"<leader>/",
    -- 	function()
    -- 		require("telescope.builtin").current_buffer_fuzzy_find()
    -- 	end,
    -- 	{ desc = "File grep in current buffer" },
    -- },
    {
        "n",
        "<leader>sk",
        '<cmd>lua require"telescope.builtin".keymaps()<cr>',
        { desc = "Search Keymaps" },
    },
    {
        "n",
        "<leader>ts",
        "<cmd>Telescope<cr>",
        { desc = "Open Telescope" },
    },

    { "n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "Git Files" } },
    {
        "n",
        "<leader>bf",
        "<cmd>Telescope file_browser use_fd=false<cr>",
        { desc = "File Browser", noremap = true },
    },
    {
        "n",
        "<leader>ft",
        "<cmd>lua require'telescope.builtin'.treesitter()<cr>",
        { desc = "Treesitter" },
    },
    {
        "n",
        "<leader>fm",
        "<cmd>Telescope harpoon marks<cr>",
        { desc = "Telescope Marks" },
    },
    { "n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Float Terminal" } },
    {
        { "i" },
        "<c-l>",
        "<Tab>",
        { desc = "Replace <c-l> with <TAB> default does nothing" },
    },
    {
        "i",
        "<D-d>",
        "<esc><cmd>w<cr>",
    },
    {
        "i",
        "<D-s>",
        "<c-o><cmd>w<cr>",
    },
    {
        "n",
        "q:",
        "<Nop>",
        { remap = false, silent = true },
    },
}
require("util").mapKeys(keys)
return keys
