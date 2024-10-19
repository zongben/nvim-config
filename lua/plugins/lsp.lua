return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "omnisharp",
          "tailwindcss",
          "docker_compose_language_service",
          "gopls",
          "html",
          "jsonls",
          "lua_ls",
          "cssls",
          "rust_analyzer",
          "ts_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
      lspconfig.bashls.setup({})
      lspconfig.omnisharp.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.docker_compose_language_service.setup({})
      lspconfig.gopls.setup({})
      lspconfig.html.setup({})
      lspconfig.eslint.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.cssls.setup({})
      lspconfig.rust_analyzer.setup({})
    end,
  },
}
