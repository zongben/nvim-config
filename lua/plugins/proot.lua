local try_create_stack = function(name, path)
  local stack = require("navimark.stack")
  for _, s in ipairs(stack.stacks) do
    if s.root_dir == path then
      return
    end
  end

  stack.new_stack(name, path)
  stack.next_stack()
end

return {
  "zongben/proot.nvim",
  config = function()
    require("proot").setup({
      ignore = {
        lsp = {
          "kulala",
        },
      },
      events = {
        detected = function(name, path)
          try_create_stack(name, path)
        end,
        entered = function(name, path)
          if require("toggleterm.terminal").get(1) then
            vim.cmd("TermExec cmd='exit'")
          end

          vim.cmd("bufdo bd")

          for _, client in pairs(vim.lsp.get_clients()) do
            vim.lsp.stop_client(client)
          end

          try_create_stack(name, path)
        end,
      },
    })
  end,
}
