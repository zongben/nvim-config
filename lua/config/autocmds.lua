local function cmd(mode, cmd) 
  vim.api.nvim_create_autocmd(mode, {
    pattern = "*",
    callback = function()
      vim.cmd(cmd)
    end,
  })
end

cmd("InsertLeave", "CapsLockOff")
