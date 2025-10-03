return {
  "zongben/dbout.nvim",
  build = "npm install",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("dbout").setup({})
  end,
}
