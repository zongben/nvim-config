return {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",
  lazy = "VeryLazy",
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
