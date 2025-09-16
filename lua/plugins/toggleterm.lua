return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      local uuid
      local path
      repeat
        uuid = require("utils").generate_uuid()
        path = "/tmp/nvim.sock-" .. uuid
      ---@diagnostic disable-next-line: undefined-field
      until not vim.loop.fs_stat(path)
      vim.fn.serverstart(path)

      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = {
          border = "curved",
          width = math.floor(vim.o.columns * 0.98),
          height = math.floor(vim.o.lines * 0.98)
        },
        env = {
          NVIM_SERVER = path,
        },
      })

      function Lazygit_toggle()
        if not lazygit:is_open() then
          lazygit.dir = vim.fn.getcwd()
        end
        lazygit:toggle()
        if lazygit:is_open() then
          lazygit:set_mode("i")
        end
      end
    end,
  },
}
