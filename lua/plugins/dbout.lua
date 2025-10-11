return {
  "zongben/dbout.nvim",
  cmd = { "Dbout" },
  lazy = "VeryLazy",
  -- dir = "~/github/dbout.nvim",
  build = "npm install",
  config = function()
    require("dbout").setup({})
  end,
}
