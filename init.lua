vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")

require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.autocmds")
