local map = require("utils").map

-- General
map({ "n" }, "s", "<nop>", {})
map({ "n" }, "n", "<nop>", {})

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

-- Lazy
map("n", "<leader>ll", "<cmd>Lazy<cr>", {})

-- LSP
map("n", "<leader>rn", vim.lsp.buf.rename, {})
map("n", "<leader>ca", vim.lsp.buf.code_action, {})

-- Save
map("n", "<C-s>", "<cmd>w<cr>", {})
-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", {})
