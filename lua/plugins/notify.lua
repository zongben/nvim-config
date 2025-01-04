return {
  "rcarriga/nvim-notify",
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("notify").setup({
      top_down = false,
      stages = "static",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    })
    vim.notify = require("notify")
    require("telescope").load_extension("notify")
  end,
}
