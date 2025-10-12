return {
  "zongben/dbout.nvim",
  -- dir = "~/github/dbout.nvim",
  build = "npm install",
  lazy = "VeryLazy",
  cmd = { "Dbout" },
  config = function()
    require("dbout").setup({})
  end,
}
