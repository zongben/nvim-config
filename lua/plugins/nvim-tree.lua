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
    vim.opt.termguicolors = true

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
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        api.map.on_attach.default(bufnr)

        local function edit_or_open()
          local node = api.tree.get_node_under_cursor()
          ---@diagnostic disable-next-line: undefined-field, need-check-nil
          if node.nodes ~= nil then
            api.node.open.edit()
          else
            api.node.open.edit()
            api.tree.close()
          end
        end

        vim.keymap.set("n", "l", edit_or_open, { buffer = bufnr })
        vim.keymap.set("n", "h", api.node.navigate.parent_close, { buffer = bufnr })
      end,
      git = {
        timeout = 2000,
      },
      update_focused_file = {
        enable = true,
        update_root = {
          enable = false,
        },
      },
      view = {
        number = true,
        relativenumber = true,
        side = "right",
        width = function()
          return math.floor(vim.opt.columns:get() * 0.25)
        end,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        highlight_git = "all",
        special_files = {},
        icons = {
          git_placement = "right_align",
          glyphs = {
            git = {
              deleted = "✖",
              renamed = "󰁕",
              untracked = "✚",
              ignored = "",
              unstaged = "",
              staged = "󰄵",
              unmerged = "",
            },
          },
        },
      },
    })

    -- vim.api.nvim_set_hl(0, "NvimTreeGitDirtyIcon", { fg = "#EBCB8B" })
  end,
}
