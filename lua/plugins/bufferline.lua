return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
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
        },
      },
    },
  },
}
