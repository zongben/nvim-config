return {
  {
    "mfussenegger/nvim-dap",
    lazy = "VeryLazy",
    config = function()
      local dap = require("dap")
      local utils = require("utils")
      local packages_path = utils.packages_path

      local netcoredbg_path = ""
      if utils.get_os() == "Windows" then
        netcoredbg_path = utils.combined_path(packages_path, "netcoredbg", "netcoredbg", "netcoredbg.exe")
      else
        netcoredbg_path = utils.combined_path(packages_path, "netcoredbg", "netcoredbg")
      end

      vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#CE0000", bg = "" })
      vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "" })
      vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "" })

      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "" })

      dap.adapters.coreclr = {
        type = "executable",
        command = netcoredbg_path,
        args = { "--interpreter=vscode" },
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end,
        },
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
