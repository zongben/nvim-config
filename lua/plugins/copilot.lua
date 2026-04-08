return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enable = false,
      },
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-j>",
          accept_word = "<C-l>",
        },
      },
    })

    vim.g.copilot_no_tab_map = true
    vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<cr>")', {
      expr = true,
      replace_keycodes = false,
      script = true,
    })
  end,
}
