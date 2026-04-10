return {
  "zongben/proot.nvim",
  lazy = "VeryLazy",
  keys = {
    {
      "<leader>fp",
      function()
        vim.cmd("Proot")
      end,
      mode = "n",
    },
  },
  config = function()
    require("proot").setup({
      detector = {
        enable_lsp_detect = false,
      },
      events = {
        entered = function()
          vim.cmd("bufdo bd")
          for _, client in pairs(vim.lsp.get_clients()) do
            client:stop()
          end
        end,
      },
    })
  end,
}
