return {
	"folke/trouble.nvim",
	opts = {
		focus = true,
		win = {
			size = 0.25,
		},
		modes = {
			diagnostics = {
				keys = {
					s = {
						action = function(view)
							local f = view:get_filter("severity")
							local severity = ((f and f.filter.severity or 0) + 1) % 5
							view:filter({ severity = severity }, {
								id = "severity",
								template = "{hl:Title}Filter:{hl} {severity}",
								del = severity == 0,
							})
						end,
					},
				},
			},
		},
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xs",
			"<cmd>Trouble symbols toggle<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>xq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
}
