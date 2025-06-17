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

          local clients = vim.lsp.get_clients()
          for _, client in pairs(clients) do
            if client.name ~= "copilot" then
              vim.cmd("LspRestart " .. client.name)
            end
          end
        end,
      },
    })
  end,
}
