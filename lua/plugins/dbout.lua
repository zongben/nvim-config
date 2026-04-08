return {
  "zongben/dbout.nvim",
  build = "npm install",
  lazy = "VeryLazy",
  cmd = { "Dbout" },
  -- dir = "~/github/dbout.nvim",
  config = function()
    require("dbout").setup({})

    local map = require("utils").map
    map("n", "<leader>db", "<cmd>Dbout<cr>", {})
  end,
}
