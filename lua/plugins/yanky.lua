return {
  "gbprod/yanky.nvim",
  config = function()
    require("yanky").setup({
      highlight = {
        timer = 150,
      },
    })
  end,
}
