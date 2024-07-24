return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
    event = "InsertEnter",
    config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<C-m>",
					accept_word = false,
					accept_line = false,
				},
			},
		})
	end,
}

