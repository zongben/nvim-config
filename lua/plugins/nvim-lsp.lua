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
    "Decodetalkers/csharpls-extended-lsp.nvim",
    config = function()
      require("telescope").load_extension("csharpls_definition")
    end,
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
          "svelte",
          "rust_analyzer",
          "prismals",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function() end,
  },
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    -- dependencies = { "rafamadriz/friendly-snippets" },

    -- use a release tag to download pre-built binaries
    version = "1.*",
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    build = "cargo build --release",
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "none",
        ["<C-y>"] = { "select_and_accept" },
        ["<C-n>"] = { "select_next" },
        ["<C-p>"] = { "select_prev" },
        ["<C-d>"] = { "scroll_documentation_down" },
        ["<C-u>"] = { "scroll_documentation_up" },
        ["<C-k>"] = {
          function(cmp)
            if cmp.is_signature_visible() then
              cmp.hide_signature()
            else
              cmp.show_signature()
            end
          end,
        },
        ["<C-e>"] = {
          function(cmp)
            if cmp.is_menu_visible() then
              if cmp.is_documentation_visible() then
                cmp.hide_documentation()
              else
                cmp.show_documentation()
              end
            else
              cmp.show()
            end
          end,
        },
      },
      signature = {
        enabled = true,
        window = {
          border = "rounded",
        },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        menu = {
          border = "rounded",
        },
        documentation = { auto_show = true, window = { border = "rounded" } },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
