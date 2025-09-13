return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = {
          border = "curved",
        },
      })
      function Lazygit_toggle()
        lazygit.dir = vim.fn.getcwd()
        lazygit:toggle()
      end
    end,
  },
}
