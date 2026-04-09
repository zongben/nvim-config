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
        mode = "n",
      },
    },
    config = function()
      require("conform").setup({
        default_format_opts = {
          timeout_ms = 3000,
          lsp_format = "fallback",
          async = true,
          quiet = true,
        },
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          cs = { "csharpier" },
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
