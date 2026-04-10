return {
  "zongben/dbout.nvim",
  build = "npm install",
  lazy = "VeryLazy",
  -- dir = "~/github/dbout.nvim",
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
