return {
  "numToStr/Comment.nvim",
  event = "BufEnter",
  lazy = "VeryLazy",
  config = function()
    require("Comment").setup()
  end,
}
