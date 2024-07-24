return {
	"Mofiqul/vscode.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("vscode")
		local c = require("vscode.colors").get_colors()
		local configs = require("vscode")
		configs.setup({
			italic_comments = true,
			transparent = false,
			group_overrides = {
				Comment = { fg = c.vscGray },
				-- @comment = { fg = c.vscGray },
				SpecialComment = { fg = c.vscGray },
			},
		})
		require("vscode").load()

		vim.api.nvim_set_hl(0, "@comment", { fg = "#808080" })
	end,
}
