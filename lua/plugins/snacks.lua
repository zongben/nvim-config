local stopinsert = function()
  vim.cmd.stopinsert()
end

-- LSP progress
---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
    if not client or type(value) ~= "table" then
      return
    end
    local p = progress[client.id]

    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
        p[i] = {
          token = ev.data.params.token,
          msg = ("[%3d%%] %s%s"):format(
            value.kind == "end" and 100 or value.percentage or 100,
            value.title or "",
            value.message and (" **%s**"):format(value.message) or ""
          ),
          done = value.kind == "end",
        }
        break
      end
    end

    local msg = {} ---@type string[]
    progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
    end, p)

    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(table.concat(msg, "\n"), "info", {
      id = "lsp_progress",
      title = client.name,
      opts = function(notif)
        notif.icon = #progress[client.id] == 0 and " "
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = function()
    local snacks = require("snacks")
    return {
      {
        "<leader>fn",
        function()
          snacks.picker.notifications()
        end,
        mode = { "n" },
      },
      {
        "<leader>ff",
        function()
          snacks.picker.files()
        end,
        mode = { "n" },
      },
      {
        "<leader>fg",
        function()
          snacks.picker.grep()
        end,
        mode = { "n" },
      },
      {
        "<leader>fs",
        function()
          snacks.picker.lsp_symbols()
        end,
        mode = { "n" },
      },
      {
        "<leader>fc",
        function()
          snacks.picker.command_history()
        end,
        mode = { "n" },
      },
      {
        "<leader>yh",
        function()
          snacks.picker.cliphist()
        end,
        mode = { "n" },
      },
      {
        "<leader>gs",
        function()
          snacks.picker.git_status()
        end,
        mode = { "n" },
      },
      {
        "gd",
        function()
          snacks.picker.lsp_definitions()
        end,
        mode = { "n" },
      },
      {
        "gD",
        function()
          snacks.picker.lsp_declarations()
        end,
        mode = { "n" },
      },
      {
        "gI",
        function()
          snacks.picker.lsp_implementations()
        end,
        mode = { "n" },
      },
      {
        "gr",
        function()
          snacks.picker.lsp_references()
        end,
        mode = { "n" },
      },
      {
        "gt",
        function()
          snacks.picker.lsp_type_definitions()
        end,
        mode = { "n" },
      },
      {
        "<leader>/",
        function()
          snacks.picker.lines()
        end,
        mode = { "n" },
      },
      {
        "<leader>gg",
        function()
          snacks.lazygit()
        end,
        mode = { "n" },
      },
      {
        "<leader>bd",
        function()
          snacks.bufdelete()
        end,
        mode = { "n" },
      },
      {
        "<leader>bD",
        function()
          snacks.bufdelete.other()
        end,
        mode = { "n" },
      },
      {
        "<leader>ba",
        function()
          snacks.bufdelete.all()
        end,
        mode = { "n" },
      },
      {
        "<leader>fb",
        function()
          snacks.picker.buffers()
        end,
        mode = { "n" },
      },
      {
        "<leader>ud",
        function()
          snacks.picker.undo()
        end,
        mode = { "n" },
      },
    }
  end,
  opts = {
    indent = {
      enable = true,
      animate = {
        enabled = false,
      },
    },
    notifier = {
      enable = true,
      top_down = false,
    },
    picker = {
      enable = true,
      sources = {
        notifications = {
          on_show = stopinsert,
          actions = {
            yank_msg = function(_, item)
              vim.fn.setreg(vim.v.register, item.item.msg)
            end,
          },
          confirm = { "yank_msg", "close" },
        },
        cliphist = {
          on_show = stopinsert,
        },
        command_history = {
          on_show = stopinsert,
        },
        git_status = {
          on_show = stopinsert,
        },
        lsp_declarations = {
          on_show = stopinsert,
        },
        lsp_definitions = {
          on_show = stopinsert,
        },
        lsp_implementations = {
          on_show = stopinsert,
        },
        lsp_references = {
          on_show = stopinsert,
        },
        lsp_symbols = {
          on_show = stopinsert,
        },
        lsp_type_definitions = {
          on_show = stopinsert,
        },
        select = {
          on_show = stopinsert,
        },
        dbout = {
          on_show = stopinsert,
        },
        buffers = {
          on_show = stopinsert,
        },
        undo = {
          on_show = stopinsert,
        },
      },
    },
    styles = {
      notification_history = {
        width = 0.8,
        height = 0.8,
      },
      lazygit = {
        border = true,
      },
    },
  },
}
