local joinpath = vim.fs.joinpath

local config_path = vim.fn.stdpath("config")
local ts_path = joinpath(config_path, "vendors", "tree-sitters")
local parser_path = joinpath(config_path, "parser")

local languages = {
  "lua",
  "rust",
  "javascript",
  "typescript",
  "csharp",
  "html",
  "c",
  "bash",
  "css",
  "xml",
  "hyprlang",
  "go",
  "sql",
}

local build_parser = function(lang)
  local build = function(src_path)
    vim.system({ "tree-sitter", "build", src_path, "-o", joinpath(parser_path, lang .. ".so") }, function(out)
      if out.code ~= 0 then
        vim.schedule(function()
          vim.notify("Error building parser for " .. lang .. ": " .. out.stderr, vim.log.levels.ERROR)
        end)
        return
      end

      vim.schedule(function()
        vim.notify('"' .. lang .. '"' .. " parser built successfully.", vim.log.levels.INFO)
      end)
    end)
  end

  local src_path = joinpath(ts_path, lang)

  if lang == "typescript" then
    src_path = joinpath(src_path, "typescript")
  end

  if lang == "xml" then
    src_path = joinpath(src_path, "xml")
  end

  if lang == "sql" then
    local files = vim.fs.find({ "parser.c" }, { path = joinpath(src_path, "src"), type = "file" })
    if #files == 0 then
      vim.system({ "tree-sitter", "generate" }, { cwd = src_path }, function(out)
        if out.code ~= 0 then
          vim.schedule(function()
            vim.notify("Error generating parser for " .. lang .. ": " .. out.stderr, vim.log.levels.ERROR)
          end)
          return
        end
        build(src_path)
      end)
      return
    end
  end

  build(src_path)
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

vim.treesitter.language.register("handlebars", "html")

vim.api.nvim_create_autocmd("FileType", {
  pattern = languages,
  callback = function(args)
    local bufnr = args.buf
    if not vim.treesitter.highlighter.active[bufnr] then
      vim.treesitter.start(bufnr)
    end
  end,
})
