return {
	{
		"echasnovski/mini.surround",
		config = function()
			require("mini.surround").setup({
				mappings = {
					add = "<leader>sa",
					delete = "<leader>sd",
					find = "",
					highlight = "",
					replace = "<leader>sr",
					update_n_lines = "",
					suffix_last = "",
					suffix_next = "",
				},
			})
		end,
	},
	{
		"echasnovski/mini.pairs",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.move",
		config = function()
			require("mini.move").setup()
		end,
	},
}
