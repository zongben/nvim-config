return {
  "gbprod/yanky.nvim",
  config = function()
    require("yanky").setup({
      highlight = {
        timeout = 150,
      }
    })
    require("telescope").load_extension("yank_history")
  end
}
