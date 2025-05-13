return {
  "zongben/proot.nvim",
  config = function()
    require("proot").setup({
      events = {
        entered = function(path)
          vim.fn.chdir(path)
          vim.api.nvim_set_current_dir(path)
          vim.cmd("bufdo bd")
          vim.cmd("LspRestart")
        end,
      },
    })
  end,
}
