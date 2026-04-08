return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/snacks.nvim",
  },
  keys = {
    {
      "\\",
      "<cmd>NvimTreeToggle<CR>",
      mode = { "n" },
    },
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local prev = { new_name = "", old_name = "" }
    vim.api.nvim_create_autocmd("User", {
      pattern = "NvimTreeSetup",
      callback = function()
        local events = require("nvim-tree.api").events
        events.subscribe(events.Event.NodeRenamed, function(data)
          if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
            data = data
            require("snacks").rename.on_rename_file(data.old_name, data.new_name)
          end
        end)
      end,
    })

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
