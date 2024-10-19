local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Window
map("n", "<C-h>", "<C-w>h", {})
map("n", "<C-j>", "<C-w>j", {})
map("n", "<C-k>", "<C-w>k", {})
map("n", "<C-l>", "<C-w>l", {})

-- Neotree
map("n", "\\", "<cmd>Neotree reveal<CR>", {})

-- Bufferline
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", {})
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", {})
map("n", "<leader>bd", "<cmd>bd<CR>", {})
map("n", "<leader>bD", "<cmd>BufferLineCloseOthers<CR>", {})
map("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", {})
map("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", {})

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<CR>", {})

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>fg", builtin.live_grep, {})
map("n", "<leader>fh", builtin.help_tags, {})

-- Copilot
map("i", "<C-j>", 'copilot#Accept("\\<CR>")', { expr = true, script = true, replace_keycodes = false })

-- Mason
map("n", "<leader>ms", "<cmd>Mason<CR>", {})

-- LSP
map("n", "K", vim.lsp.buf.hover, {})

