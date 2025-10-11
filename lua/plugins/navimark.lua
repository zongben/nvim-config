return {
  "zongben/navimark.nvim",
  cmd = "Navimark",
  lazy = "VeryLazy",
  config = function()
    require("navimark").setup({})
  end,
}
