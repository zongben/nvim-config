return {
  "zongben/dbout.nvim",
  build = "npm install",
  config = function()
    require("dbout").setup({})
  end,
}
