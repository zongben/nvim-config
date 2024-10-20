return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      auto_install = true,
      ensure_installed = {
        "bash",
        "lua",
        "c_sharp",
        "css",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitignore",
        "go",
        "html",
        "javascript",
        "json",
        "rust",
        "scss",
        "svelte",
      },
      sync_install = false,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
