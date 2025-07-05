return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enable = false
      },
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-j>",
          accept_word = "<C-l>",
        }
      }
    })
  end,
}
