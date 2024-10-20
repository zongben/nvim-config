vim.opt.relativenumber = true
vim.g.copilot_no_tab_map = true
vim.o.clipboard = "unnamedplus"
vim.opt.termguicolors = true

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

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
