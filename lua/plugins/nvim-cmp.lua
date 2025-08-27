return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-path",
      -- "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        -- { name = "buffer" },
      }

      if vim.bo.filetype == "lua" then
        table.insert(sources, { name = "lazydev", group_index = 0 })
      end

      local cmp = require("cmp")
      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = sources,
      })

      -- cmp.setup.filetype({ "lua" }, {
      --   sources = sources,
      -- })
    end,
  },
}
