return {
  {
    "echasnovski/mini.surround",
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
    "echasnovski/mini.move",
    config = function()
      require("mini.move").setup()
    end,
  },
  {
    "echasnovski/mini.ai",
    config = function()
      require("mini.ai").setup()
    end,
  },
  {
    "echasnovski/mini.pairs",
    config = function()
      require("mini.pairs").setup()
    end,
  },
}
