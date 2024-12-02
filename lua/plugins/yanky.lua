return {
  "gbprod/yanky.nvim",
  config = function()
    require("yanky").setup({
      highlight = {
        timer = 150,
      }
    })
    require("telescope").load_extension("yank_history")
  end
}
