local map = require("utils").map

-- General
map({ "n" }, "s", "<nop>", {})

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", {})

-- Window
map("n", "<C-h>", "<C-w>h", {})
map("n", "<C-j>", "<C-w>j", {})
map("n", "<C-k>", "<C-w>k", {})
map("n", "<C-l>", "<C-w>l", {})
map("n", "<C-Up>", "<cmd>resize +2<cr>", {})
map("n", "<C-Down>", "<cmd>resize -2<cr>", {})
map("n", "<C-Left>", "<cmd>vertical resize +2<cr>", {})
map("n", "<C-Right>", "<cmd>vertical resize -2<cr>", {})

-- Tab
map("n", "<leader>td", "<cmd>tabclose<cr>", {})
map("n", "<leader>tD", "<cmd>tabonly<cr>", {})

-- Lazy
map("n", "<leader>ll", "<cmd>Lazy<cr>", {})

-- Restart
map("n", "<leader>,,", "<cmd>restart<cr>", {})

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", {})

-- LSP
local lsp_log_path = vim.fs.joinpath(vim.fn.stdpath("state"), "lsp.log")

map("n", "<leader>rn", vim.lsp.buf.rename, {})
map("n", "<leader>ca", vim.lsp.buf.code_action, {})

vim.api.nvim_create_user_command("LspInfo", function()
  vim.cmd("checkhealth vim.lsp")
end, {})

vim.api.nvim_create_user_command("LspRestart", function()
  vim.cmd("lsp restart")
end, {})

vim.api.nvim_create_user_command("LspLog", function()
  vim.cmd("edit " .. lsp_log_path)
end, {})

vim.api.nvim_create_user_command("LspLogClear", function()
  local f = io.open(lsp_log_path, "w")
  if f then
    f:write("")
    f:close()
    vim.notify("LSP log cleared.", vim.log.levels.INFO)
  else
    vim.notify("Failed to clear LSP log.", vim.log.levels.ERROR)
  end
end, {})
