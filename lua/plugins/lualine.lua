return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "auto",
      disabled_filetypes = {
        "neo-tree",
        "trouble",
      },
    },
    sections = {
      lualine_c = {
        {
          "filename",
          path = 1,
        },
      },
    },
  },
}
