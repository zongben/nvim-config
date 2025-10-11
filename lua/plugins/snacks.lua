return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    indent = {
      enable = true,
      animate = {
        enabled = false,
      },
    },
    notifier = {
      enable = true,
      top_down = false,
    },
    picker = {
      enable = true,
      sources = {
        notifications = {
          actions = {
            yank_msg = function(_, item)
              vim.fn.setreg(vim.v.register, item.item.msg)
            end,
          },
          confirm = { "yank_msg", "close" },
        },
        projects = {
          actions = {
            bd = function()
              vim.cmd("bufdo bd")
            end,
          },
          confirm = {
            "bd",
            "tcd",
            "close",
          },
          patterns = { ".git" },
        },
      },
    },
    styles = {
      notification_history = {
        width = 0.8,
        height = 0.8,
      },
    },
  },
}
