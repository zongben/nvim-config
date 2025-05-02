return {
  "zongben/proot.nvim",
  config = function()
    require("proot").setup({
      events = {
        entered = function()
          vim.cmd("bufdo bd")
          vim.cmd("LspRestart")
        end,
      },
    })
  end,
}
