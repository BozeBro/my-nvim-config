return {
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{ "<leader>tl", "<cmd>LazyGit<cr>", { desc = "Open LazyGit", silent = true } },
			{ "<leader>lc", "<cmd>LazyGitConfig<cr>", { desc = "Open LazyGit Config", silent = true } },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "next hunk" })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "previous hunk" })

				-- Actions
				map("n", "<leader>hs", gs.stage_hunk, { desc = "stage hunk" })
				map("n", "<leader>hr", gs.reset_hunk, { desc = "reset hunk" })
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "stage hunk visual" })
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "reset hunk visual" })
				map("n", "<leader>hS", gs.stage_buffer, { desc = "stage buffer" })
				map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
				map("n", "<leader>hR", gs.reset_buffer, { desc = "reset buffer" })
				map("n", "<leader>hp", gs.preview_hunk, { desc = "preview hunk" })
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, { desc = "blame line" })
				map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "toggle current line blame" })
				map("n", "<leader>hd", gs.diffthis, { desc = "diff this" })
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, { desc = "diff this" })
				map("n", "<leader>td", gs.toggle_deleted, { desc = "toggle deleted" })

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "select hunk text object" })
			end,
		},
	},

	{
		"sindrets/diffview.nvim",
		keys = { "<leader>", "dvo", "dvc" },
		config = function()
			local map = vim.keymap.set
			map("n", "<leader>dvo", "<cmd>DiffviewOpen<cr>", { desc = "Open Diff Viewer" })
			map("n", "<leader>dvc", "<cmd>DiffviewClose<cr>", { desc = "Close Diff Viewer" })
		end,
	},
}
