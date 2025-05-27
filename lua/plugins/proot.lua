return {
  "zongben/proot.nvim",
  config = function()
    require("proot").setup({
      ignore = {
        lsp = {
          "kulala"
        }
      },
      events = {
        entered = function(path)
          if require("toggleterm.terminal").get(1) then
            vim.cmd("TermExec cmd='exit'")
          end
          vim.fn.chdir(path)
          vim.cmd("bufdo bd")
          vim.cmd("LspRestart")
        end,
      },
    })
  end,
}
