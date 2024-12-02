return {
	"folke/trouble.nvim",
	opts = {
		modes = {
			symbols = {
				win = {
					size = 0.2,
				},
			},
			diagnostics = {
				win = {
					size = 0.3,
				},
				keys = {
					m = {
						action = function(view)
							view:filter({ buf = 0 }, { toggle = true })
						end,
						desc = "Toggle Current Buffer Filter",
					},
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
			"<cmd>Trouble diagnostics toggle focus=true<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xl",
			"<cmd>Trouble lsp toggle focus=true<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xs",
			"<cmd>Trouble symbols toggle focus=true<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>xq",
			"<cmd>Trouble qflist toggle focus=true<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
}
