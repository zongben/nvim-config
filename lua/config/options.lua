local utils = require("utils")

vim.g.mapleader = " "
vim.g.copilot_no_tab_map = true
vim.g.disable_autoformat = true

vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.confirm = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.ignorecase = true
vim.opt.linebreak = true
vim.opt.mouse = "a"
vim.opt.mousemoveevent = true
vim.opt.number = true
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.scrolloff = 5
vim.opt.undofile = true
vim.opt.virtualedit = "block"
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.jumpoptions = "view"
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("I")

vim.diagnostic.config({ virtual_text = false })

if utils.get_os() == "Windows" then
  vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
      vim.bo.fileformat = "unix"
    end,
  })
end
