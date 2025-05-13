return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-\>]],
        direction = "float",
        start_in_insert = true,
        float_opts = {
          border = "curved",
        },
        on_open = function(term)
          if term.cmd ~= "lazygit" then
            term:send("cd " .. vim.fn.getcwd() .. "&& clear")
          end
        end
      })

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
