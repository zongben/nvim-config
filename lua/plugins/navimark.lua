return {
  "zongben/navimark.nvim",
  dir = "~/github/navimark.nvim",
  config = function()
    require("navimark").setup({
      persist = true,
      stack_mode = "auto",
    })
  end,
}
