local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- General
map({ "n" }, "s", "<nop>", {})

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", {})

-- Window
map("n", "<C-h>", "<C-w>h", {})
map("n", "<C-j>", "<C-w>j", {})
map("n", "<C-k>", "<C-w>k", {})
map("n", "<C-l>", "<C-w>l", {})
map("n", "<C-Up>", "<cmd>resize +2<CR>", {})
map("n", "<C-Down>", "<cmd>resize -2<CR>", {})
map("n", "<C-Left>", "<cmd>vertical resize +2<CR>", {})
map("n", "<C-Right>", "<cmd>vertical resize -2<CR>", {})

-- Terminal
map("t", "<esc>", function()
  if vim.bo.filetype ~= "toggleterm" then
    return "<C-\\><C-n>"
  else
    return "<esc>"
  end
end, { expr = true })

map("t", "<C-n>", function()
  if vim.bo.filetype == "toggleterm" then
    return "<C-\\><C-n>"
  end
end, { expr = true })

-- Neotree
map("n", "\\", "<cmd>Neotree reveal<CR>", {})

-- Bufferline
map("n", "H", "<cmd>BufferLineCyclePrev<CR>", {})
map("n", "L", "<cmd>BufferLineCycleNext<CR>", {})
map("n", "<M-H>", "<cmd>BufferLineMovePrev<CR>", {})
map("n", "<M-L>", "<cmd>BufferLineMoveNext<CR>", {})
map("n", "<leader>bd", "<cmd>bd<CR>", {})
map("n", "<leader>bD", "<cmd>BufferLineCloseOthers<CR>", {})
map("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", {})
map("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", {})
map("n", "<leader>ba", "<cmd>bufdo bd<CR>", {})

-- Git
map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", {})
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", {})
map("n", "<leader>gH", "<cmd>DiffviewFileHistory<CR>", {})
map("n", "<leader>gc", "<cmd>DiffviewClose<CR>", {})

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<CR>", {})

-- Lazygit
map("n", "<leader>gg", "<cmd>lua Lazygit_toggle()<CR>", {})

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>fg", builtin.live_grep, {})
map("n", "<leader>fb", builtin.buffers, {})
map("n", "gd", builtin.lsp_definitions, {})
map("n", "gI", builtin.lsp_implementations, {})
map("n", "gr", builtin.lsp_references, {})
map("n", "gt", builtin.lsp_type_definitions, {})
map("n", "<leader>fn", "<cmd>Telescope notify<CR>", {})
map("n", "<leader>yh", "<cmd>Telescope yank_history<CR>", {})
map("n", "<leader>fp", "<cmd>Proot<CR>", {})
map("n", "<leader>fd", function()
  local diagnostic = require("tiny-inline-diagnostic").get_diagnostic_under_cursor()
  for _, d in ipairs(diagnostic) do
    vim.notify(d.message)
  end
end, {})

-- Copilot
vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
  script = true,
})

-- Mason
map("n", "<leader>ms", "<cmd>Mason<CR>", {})

-- LSP
-- map("n", "K", vim.lsp.buf.hover, {})
map("n", "<leader>rn", vim.lsp.buf.rename, {})
map("n", "<leader>cf", vim.lsp.buf.format, {})
map("n", "<leader>ca", require("actions-preview").code_actions, {})

-- dadbod
map("n", "<leader>db", "<cmd>DBUIToggle<CR>", {})

-- Snippets
local ls = require("luasnip")
map({ "i", "s" }, "<C-l>", function()
  ls.expand_or_jump()
end, {})
map({ "i", "s" }, "<C-h>", function()
  ls.jump(-1)
end, {})

-- rip-substitute
map({ "n", "x" }, "<leader>fq", function()
  require("rip-substitute").sub()
end, {})

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", {})
