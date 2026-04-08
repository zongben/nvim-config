return {
  'Exafunction/windsurf.vim',
  event = 'BufEnter',
  config = function ()
    vim.g.codeium_disable_bindings = 1
    vim.api.nvim_call_function("codeium#GetStatusString", {})
    vim.keymap.set('i', '<C-j>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
  end
}
