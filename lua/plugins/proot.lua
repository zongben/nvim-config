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

          for _, client in pairs(vim.lsp.get_clients()) do
            vim.lsp.stop_client(client)
          end
        end,
      },
    })
  end,
}
