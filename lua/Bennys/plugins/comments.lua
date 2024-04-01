return {
	{
		"numToStr/Comment.nvim",
		config = function(_, opts)
			local comment = require("Comment")
			comment.setup(opts)
			local ft = require("Comment.ft")
			ft.set("sml", { "(*%s*)", "(*%s*)" })
		end,
		event = "BufReadPost",
	},
}
