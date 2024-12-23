return {
	-- {
	-- 	"ryanmsnyder/toggleterm-manager.nvim",
	-- 	dependencies = {
	-- 		"akinsho/nvim-toggleterm.lua",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
	-- 	},
	-- 	config = true,
	-- },
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<C-\>]],
				direction = "float",
				start_in_insert = true,
				float_opts = {
					border = "curved",
				},
			})

			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({
				cmd = "lazygit",
				hidden = true,
				direction = "float",
				float_opts = {
					border = "curved",
				},
			})

			function Lazygit_toggle()
				lazygit.dir = vim.fn.getcwd()
				lazygit:toggle()
			end
		end,
	},
}
