return {
  "ZongBen/project.nvim",
  config = function()
    require("project_nvim").setup({
      force_chdir = true,
    })
    require("telescope").load_extension("projects")
  end,
}
