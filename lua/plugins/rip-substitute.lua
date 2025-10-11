return {
  "chrisgrieser/nvim-rip-substitute",
  lazy = "VeryLazy",
  config = function()
    require("rip-substitute").setup()
  end,
}
