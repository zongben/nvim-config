local joinpath = vim.fs.joinpath

local config_path = vim.fn.stdpath("config")
local ts_path = joinpath(config_path, "vendors", "tree-sitters")
local parser_path = joinpath(config_path, "parser")

local languages = { "lua", "rust", "javascript", "typescript", "csharp", "html", "c", "bash", "css", "xml", "hyprlang" }

local build_parser = function(lang)
  local src_path = joinpath(ts_path, lang)

  if lang == "typescript" then
    src_path = joinpath(ts_path, "typescript", "typescript")
  end

  vim.system({ "tree-sitter", "build", src_path, "-o", joinpath(parser_path, lang .. ".so") })
end

vim.api.nvim_create_user_command("TSBuild", function(opts)
  vim.system({ "mkdir", "-p", parser_path })

  local lang = opts.args

  if lang == "" then
    for _, l in ipairs(languages) do
      build_parser(l)
    end
    return
  end

  if not vim.tbl_contains(languages, lang) then
    print("Language not supported: " .. lang)
    return
  end

  build_parser(lang)
end, {
  nargs = "?",
  complete = function(ArgLead)
    return vim.tbl_filter(function(item)
      return item:find("^" .. ArgLead)
    end, languages)
  end,
})

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = languages,
  callback = function(args)
    local bufnr = args.buf
    if not vim.treesitter.highlighter.active[bufnr] then
      vim.treesitter.start(bufnr)
    end
  end,
})
