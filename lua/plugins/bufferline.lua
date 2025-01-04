return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        separator_style = "slant",
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "NeoTree",
            text_align = "center",
            separator = true,
          },
          {
            filetype = "trouble",
            text = "Trouble",
            text_align = "center",
            separator = true,
          },
        },
      },
    },
  },
}
