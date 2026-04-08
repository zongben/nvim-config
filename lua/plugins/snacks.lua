local stopinsert = function()
  vim.cmd.stopinsert()
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    {
      "<leader>fn",
      function()
        require("snacks").picker.notifications()
      end,
      mode = { "n" },
    },
    {
      "<leader>ff",
      function()
        require("snacks").picker.files()
      end,
      mode = { "n" },
    },
    {
      "<leader>fg",
      function()
        require("snacks").picker.grep()
      end,
      mode = { "n" },
    },
    {
      "<leader>fs",
      function()
        require("snacks").picker.lsp_symbols()
      end,
      mode = { "n" },
    },
    {
      "<leader>fc",
      function()
        require("snacks").picker.command_history()
      end,
      mode = { "n" },
    },
    {
      "<leader>yh",
      function()
        require("snacks").picker.cliphist()
      end,
      mode = { "n" },
    },
    {
      "<leader>gs",
      function()
        require("snacks").picker.git_status()
      end,
      mode = { "n" },
    },
    {
      "<leader>gd",
      function()
        require("snacks").picker.lsp_definitions()
      end,
      mode = { "n" },
    },
    {
      "<leader>gD",
      function()
        require("snacks").picker.lsp_declarations()
      end,
      mode = { "n" },
    },
    {
      "<leader>gI",
      function()
        require("snacks").picker.lsp_implementations()
      end,
      mode = { "n" },
    },
    {
      "<leader>gr",
      function()
        require("snacks").picker.lsp_references()
      end,
      mode = { "n" },
    },
    {
      "<leader>gt",
      function()
        require("snacks").picker.lsp_type_definitions()
      end,
      mode = { "n" },
    },
    {
      "<leader>/",
      function()
        require("snacks").picker.lines()
      end,
      mode = { "n" },
    },
  },
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
