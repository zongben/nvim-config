return {
  "zongben/dbout.nvim",
  build = "npm install",
  lazy = "VeryLazy",
  keys = {
    {
      "<leader>db",
      function()
        vim.cmd("Dbout")
      end,
      mode = "n",
    },
  },
  config = function()
    require("dbout").setup({})
  end,
}
