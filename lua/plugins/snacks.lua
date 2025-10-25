local stopinsert = function()
  vim.cmd.stopinsert()
end

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
          on_show = stopinsert,
          actions = {
            yank_msg = function(_, item)
              vim.fn.setreg(vim.v.register, item.item.msg)
            end,
          },
          confirm = { "yank_msg", "close" },
        },
        cliphist = {
          on_show = stopinsert,
        },
        command_history = {
          on_show = stopinsert,
        },
        git_status = {
          on_show = stopinsert,
        },
        lsp_declarations = {
          on_show = stopinsert,
        },
        lsp_definitions = {
          on_show = stopinsert,
        },
        lsp_implementations = {
          on_show = stopinsert,
        },
        lsp_references = {
          on_show = stopinsert,
        },
        lsp_symbols = {
          on_show = stopinsert,
        },
        lsp_type_definitions = {
          on_show = stopinsert,
        },
        select = {
          on_show = stopinsert,
        },
        dbout = {
          on_show = stopinsert,
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
