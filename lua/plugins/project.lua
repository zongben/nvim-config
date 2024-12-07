return {
  "ZongBen/project.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    require("project_nvim").setup({})
    require("telescope").load_extension("projects")
  end,
}
