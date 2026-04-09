return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "lua", "rust", "javascript", "typescript", "csharp" },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
