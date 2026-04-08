return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "\\",
      function()
        vim.cmd("NvimTreeToggle")
      end,
      mode = { "n" },
    },
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      sync_root_with_cwd = true,
      view = {
        side = "right",
        number = true,
        relativenumber = true,
        width = 35,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    })
  end,
}
