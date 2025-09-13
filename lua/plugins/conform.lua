return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format()
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    config = function()
      require("conform").setup({
        default_format_opts = {
          timeout_ms = 3000,
          lsp_format = "fallback",
          async = false,
          quiet = false,
        },
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          cs = { "csharpier" },
          -- go = { "goimports" },
          -- xml = { "xmlformatter" },
        },
        formatters = {
          csharpier = {
            command = "csharpier",
            args = { "format" },
          },
        },
        format_on_save = function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return nil
          end
        end,
      })
    end,
  },
}
