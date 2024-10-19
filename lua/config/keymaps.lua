local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Neotree
map("n", "\\", ":Neotree reveal<CR>", {})


-- Bufferline
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", {})
map("n", "<S-l>", ":BufferLineCycleNext<CR>", {})
