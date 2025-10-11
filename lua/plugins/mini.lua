return {
  {
    "nvim-mini/mini.surround",
    config = function()
      require("mini.surround").setup({
        mappings = {
          find = "",
          highlight = "",
          update_n_lines = "",
          suffix_last = "",
          suffix_next = "",
        },
        n_lines = 1,
      })
    end,
  },
  {
    "nvim-mini/mini.move",
    config = function()
      require("mini.move").setup()
    end,
  },
  {
    "nvim-mini/mini.ai",
    config = function()
      require("mini.ai").setup()
    end,
  },
  {
    "nvim-mini/mini.pairs",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "nvim-mini/mini.comment",
    config = function()
      require("mini.comment").setup()
    end,
  },
}
