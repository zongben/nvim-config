return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  config = function()
    local kulala = require("kulala")
    kulala.setup({
      vscode_rest_client_environmentvars = true,
      ui = {
        win_opts = {
          wo = {
            foldmethod = "manual",
          },
        },
      },
      global_keymaps = {
        ["Send request"] = {
          "<leader>rr",
          function()
            kulala.run()
          end,
          mode = { "n", "v" },
        },
        ["Select environment"] = {
          "<leader>re",
          function()
            kulala.set_selected_env()
          end,
        },
      },
    })
  end,
}
