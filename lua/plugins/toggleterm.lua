return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<C-\>]],
      direction = 'float',
      start_in_insert = true,
      float_opts = {
        border = "curved"
      }
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

    local project = require("project_nvim")
		function Lazygit_toggle()
      lazygit.dir = project.get_last_project()
			lazygit:toggle()
		end
	end,
}
