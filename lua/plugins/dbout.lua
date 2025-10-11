return {
  "zongben/dbout.nvim",
  cmd = { "Dbout" },
  lazy = "VeryLazy",
  build = "npm install",
  config = function()
    require("dbout").setup({})
  end,
}
