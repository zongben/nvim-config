return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy", -- Or `LspAttach`
  priority = 1000, -- needs to be loaded in first
  config = function()
    require("tiny-inline-diagnostic").setup()

    local map = require("utils").map
    map("n", "<leader>yd", function()
      local diagnostic = require("tiny-inline-diagnostic").get_diagnostic_under_cursor()
      for _, d in ipairs(diagnostic) do
        vim.fn.setreg("+", d.message)
        vim.notify("message yanked: " .. d.message)
      end
    end, {})
  end,
}
