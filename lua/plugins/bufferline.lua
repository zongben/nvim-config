return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      {
        "H",
        function()
          vim.cmd("BufferLineCyclePrev")
        end,
        mode = { "n" },
      },
      {
        "L",
        function()
          vim.cmd("BufferLineCycleNext")
        end,
        mode = { "n" },
      },
      {
        "<M-H>",
        function()
          vim.cmd("BufferLineMovePrev")
        end,
        mode = { "n" },
      },
      {
        "<M-L>",
        function()
          vim.cmd("BufferLineMoveNext")
        end,
        mode = { "n" },
      },
      {
        "<leader>bD",
        function()
          vim.cmd("BufferLineCloseOthers")
        end,
        mode = { "n" },
      },
    },
    lazy = false,
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
