return {
  "chrisgrieser/nvim-rip-substitute",
  lazy = "VeryLazy",
  config = function()
    require("rip-substitute").setup()

    local map = require("utils").map
    map({ "n", "x" }, "<leader>qf", function()
      require("rip-substitute").sub()
    end, {})
  end,
}
