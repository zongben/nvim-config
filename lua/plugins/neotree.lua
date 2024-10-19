return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      event_handlers = {
        {
	  event = "file_opened",
	  handler = function(_)
	    require("neo-tree.command").execute({ action = "close" })
	  end,
	},
      },
      filesystem = {
        window = {
	  position = "right",
	  mappings = {
	    ["\\"] = "close_window",
	  },
	},
      },
    },
}
