return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  config = function()
    require("kulala").setup({
      ui = {
        win_opts = {
          wo = {
            foldmethod = "manual",
          },
        },
      },
    })

    local map = require("kulala.utils").map
    map("n", "<leader>rr", function()
      if vim.bo.filetype == "http" or vim.bo.filetype == "rest" then
        require("kulala").run()
      end
    end, {})
    map("n", "<leader>re", function()
      if vim.bo.filetype == "http" or vim.bo.filetype == "rest" then
        require("kulala").set_selected_env()
      end
    end, {})
  end,
}
