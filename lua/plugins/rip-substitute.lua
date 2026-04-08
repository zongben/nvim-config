return {
  "chrisgrieser/nvim-rip-substitute",
  lazy = "VeryLazy",
  keys = {
    {
      "<leader>qf",
      function()
        require("rip-substitute").sub()
      end,
      mode = { "n", "x" },
    },
  },
  config = function()
    require("rip-substitute").setup()
  end,
}
