return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        PATH = "prepend",
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
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
          "ts_ls",
          "eslint",
          "clangd",
          "svelte",
          "rust_analyzer",
          "prismals",
          "sqls",
        },
      })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("lsp_signature").setup({
        floating_window = false,
        hint_enable = true,
        hint_prefix = {
          above = "↙ ",
          current = "← ",
          below = "↖ ",
        },
        always_trigger = true,
        toggle_key = "<M-a>",
        select_signature_key = "<M-n>",
        move_cursor_key = "<M-x>",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- "Hoffs/omnisharp-extended-lsp.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.docker_compose_language_service.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.svelte.setup({
        capabilities = capabilities,
      })
      -- lspconfig.rust_analyzer.setup({
      --   capabilities = capabilities,
      -- })
      lspconfig.prismals.setup({
        capabilities = capabilities,
      })
      lspconfig.sqls.setup({
        capabilities = capabilities,
      })
    end,
  },
}
