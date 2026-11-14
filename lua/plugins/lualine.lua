return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "auto",
      disabled_filetypes = {
        "NvimTree",
      },
    },
    sections = {
      lualine_c = {
        {
          "filename",
          path = 1,
        },
      },
      -- lualine_y = {},
      lualine_z = {},
    },
  },
}
