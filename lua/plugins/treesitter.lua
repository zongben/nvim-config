return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      sync_install = false,
      highlight = {
        enable = true,
      },
      ignore_install = { "sql" },
    })
  end,
}
