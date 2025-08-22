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
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = {
          "bashls",
          -- "omnisharp",
          "csharp_ls",
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
    config = function() end,
  },
}
