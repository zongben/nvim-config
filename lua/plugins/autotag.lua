return {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",
  lazy = "VeryLazy",
  dir = "~/github/nvim-ts-autotag",
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
