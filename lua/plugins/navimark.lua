return {
  "zongben/navimark.nvim",
  config = function()
    require("navimark").setup({
      persist = true,
      stack_mode = "auto"
    })
  end,
}
