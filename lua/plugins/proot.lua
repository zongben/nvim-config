return {
  "zongben/proot.nvim",
  dir = "~/github/proot.nvim",
  config = function()
    require("proot").setup({
      detector = {
        enable_lsp_detect = false,
      },
      events = {
        entered = function()
          vim.cmd("bufdo bd")
          for _, client in pairs(vim.lsp.get_clients()) do
            vim.lsp.stop_client(client)
          end
        end,
      },
    })
    require("telescope").load_extension("proot")
  end,
}
