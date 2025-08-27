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
map("n", "<C-Up>", "<cmd>resize +2<cr>", {})
map("n", "<C-Down>", "<cmd>resize -2<cr>", {})
map("n", "<C-Left>", "<cmd>vertical resize +2<cr>", {})
map("n", "<C-Right>", "<cmd>vertical resize -2<cr>", {})

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
map("n", "\\", "<cmd>Neotree reveal<cr>", {})

-- Bufferline
map("n", "H", "<cmd>BufferLineCyclePrev<cr>", {})
map("n", "L", "<cmd>BufferLineCycleNext<cr>", {})
map("n", "<M-H>", "<cmd>BufferLineMovePrev<cr>", {})
map("n", "<M-L>", "<cmd>BufferLineMoveNext<cr>", {})
map("n", "<leader>bd", "<cmd>bd<cr>", {})
map("n", "<leader>bD", "<cmd>BufferLineCloseOthers<cr>", {})
map("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", {})
map("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", {})
map("n", "<leader>ba", "<cmd>bufdo bd<cr>", {})

-- Git
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", {})
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", {})
map("n", "<leader>gH", "<cmd>DiffviewFileHistory<cr>", {})
map("n", "<leader>gc", "<cmd>DiffviewClose<cr>", {})

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", {})

-- Lazygit
map("n", "<leader>gg", "<cmd>lua Lazygit_toggle()<cr>", {})

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>fg", builtin.live_grep, {})
map("n", "<leader>fb", builtin.buffers, {})
map("n", "gd", builtin.lsp_definitions, {})
map("n", "gI", builtin.lsp_implementations, {})
map("n", "gr", builtin.lsp_references, {})
map("n", "gt", builtin.lsp_type_definitions, {})
map("n", "<leader>fn", "<cmd>Telescope notify<cr>", {})
map("n", "<leader>yh", "<cmd>Telescope yank_history<cr>", {})
map("n", "<leader>fp", "<cmd>Proot<cr>", {})
map("n", "<leader>fd", function()
  local diagnostic = require("tiny-inline-diagnostic").get_diagnostic_under_cursor()
  for _, d in ipairs(diagnostic) do
    vim.notify(d.message)
  end
end, {})

-- Copilot
-- vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<cr>")', {
--   expr = true,
--   replace_keycodes = false,
--   script = true,
-- })

-- kulala
map("n", "<leader>rr", function()
  require("kulala").run()
end, {})
map("n", "<leader>re", function()
  require("kulala").set_selected_env()
end, {})

-- Mason
map("n", "<leader>ms", "<cmd>Mason<cr>", {})

-- LSP
map("n", "K", require("pretty_hover").hover, {})
map("n", "<leader>rn", vim.lsp.buf.rename, {})
map("n", "<leader>ca", require("actions-preview").code_actions, {})

-- rip-substitute
map({ "n", "x" }, "<leader>qf", function()
  require("rip-substitute").sub()
end, {})

-- Save
map("n", "<C-s>", "<cmd>w<cr>", {})

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", {})
