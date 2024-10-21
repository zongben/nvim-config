vim.opt.relativenumber = true
vim.g.copilot_no_tab_map = true
vim.o.clipboard = "unnamedplus"
vim.opt.termguicolors = true

-- LazyVim automatically configures lazygit:
--  * theme, based on the active colorscheme.
--  * editPreset to nvim-remote
--  * enables nerd font icons
-- Set to false to disable.
-- Set the options you want to override in `~/.config/lazygit/custom.yml`
-- WARN: on Windows you might want to set `editPreset: "nvim"` due to
-- this issue https://github.com/jesseduffield/lazygit/issues/3467
vim.g.lazygit_config = true

vim.opt.confirm = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.ignorecase = true
vim.opt.linebreak = true
vim.opt.mouse = "a"
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
