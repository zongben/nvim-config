return {
  "zongben/dbout.nvim",
  build = "npm install",
  lazy = "VeryLazy",
  -- dir = "~/github/dbout.nvim",
  keys = {
    {
      "<leader>db",
      function()
        vim.cmd("Dbout")
      end,
      mode = "n",
    },
  },
  config = function()
    require("dbout").setup({
      ui = {
        init_open = {
          inspector = false,
          viewer = false,
        },
      },
    })

    local cmp = require("blink.cmp")
    cmp.add_source_provider("dbout", {
      name = "Dbout",
      module = "dbout.source.blink",
    })
    cmp.add_filetype_source("sql", "dbout")
  end,
}
