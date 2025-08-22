return {
  "zongben/proot.nvim",
  config = function()
    require("proot").setup({
      ignore = {
        lsp = {
          "kulala",
        },
      },
      events = {
        entered = function(_)
          if require("toggleterm.terminal").get(1) then
            vim.cmd("TermExec cmd='exit'")
          end

          vim.cmd("bufdo bd")

          if #vim.lsp.get_clients() > 0 then
            vim.lsp.client:stop()
          end
        end,
      },
    })
  end,
}
