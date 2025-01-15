return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Padding
    local dashboard_height = 25
    local top_padding = math.floor((vim.fn.winheight(0) - dashboard_height) / 2) - 1
    if top_padding < 0 then
      top_padding = 0
    end

    -- Header
    local header = {
      type = "text",
      val = {
        "                                                    ",
        " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                    ",
      },
      opts = {
        position = "center",
        hl = "Type",
      },
    }

    -- Buttons
    local buttons = {
      type = "group",
      val = {
        { type = "padding", val = 1 },
        dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
        dashboard.button("n", "  New file", ":ene<CR>"),
        dashboard.button("g", "  Search", ":Telescop live_grep<CR>"),
        dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
        dashboard.button("p", "  Projects", ":Telescope projects theme=dropdown<CR>"),
        dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
      },
      opts = {
        spacing = 1,
      },
    }

    -- Footer
    local footer = {
      type = "text",
      val = "NVIM v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
      opts = {
        position = "center",
        hl = "Type",
      },
    }

    local config = {
      layout = {
        { type = "padding", val = top_padding },
        header,
        buttons,
        footer,
      },
      opts = {},
    }

    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function()
        vim.opt.showtabline = 0
      end,
    })

    vim.api.nvim_create_autocmd("BufUnload", {
      buffer = 0,
      callback = function()
        vim.opt.showtabline = 2
      end,
    })

    alpha.setup(config)
  end,
}
