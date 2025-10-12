return {
  "zongben/dbout.nvim",
  build = "npm install",
  lazy = "VeryLazy",
  cmd = { "Dbout" },
  -- dir = "~/github/dbout.nvim",
  config = function()
    require("dbout").setup()
  end,
}
