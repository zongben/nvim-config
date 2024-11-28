return {
  "sindrets/diffview.nvim",
  config = function()
    require("diffview").setup({
      file_panel = {
        win_config = {
          position = "right",
        }
      }
    })
  end
}
