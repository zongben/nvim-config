return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
    },
    version = "v2.*",
    build = function ()
      local utils = require("utils")
      local os_name = utils.get_os()
      if os_name == "Windows" then
        return "make install_jsregexp CC=gcc.exe SHELL=C:\\Program Files\\Git\\bin\\sh.exe .SHELLFLAGS=-c"
      else
        return "make install_jsregexp"
      end
    end
  },
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     hint_enable = false,
  --     toggle_key = "<A-a>",
  --     select_signature_key = "<A-n>",
  --   },
  --   config = function(_, opts)
  --     require("lsp_signature").setup(opts)
  --   end,
  -- },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local ls = require("luasnip")
      ls.config.set_config({
        history = false,
        updateevents = "TextChanged,TextChangedI",
      })

      local cmp = require("cmp")
      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer" },
        },
        snippet = {
          expand = function(args)
            ls.lsp_expand(args.body)
          end,
        },
      })
    end,
  },
}
