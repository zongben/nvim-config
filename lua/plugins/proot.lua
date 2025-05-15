return {
  "zongben/proot.nvim",
  config = function()
    require("proot").setup({
      events = {
        entered = function(path)
          if require("toggleterm.terminal").get(1) then
            vim.cmd("TermExec cmd='exit'")
          end
          vim.fn.chdir(path)
          vim.api.nvim_set_current_dir(path)
          vim.cmd("bufdo bd")
          vim.cmd("LspRestart")
        end,
      },
    })
  end,
}
