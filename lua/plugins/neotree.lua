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
      {
        event = "neo_tree_buffer_enter",
        handler = function(_)
          vim.opt_local.relativenumber = true
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
    window = {
      mappings = {
        ["h"] = "close_all_subnodes",
        ["l"] = "open",
      },
    },
  },
}
