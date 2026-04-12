local cli = "tree-sitter"
local path = vim.fs.joinpath

local config_path = vim.fn.stdpath("config")
local ts_path = path(config_path, "vendors", "tree-sitters")
local parser_path = path(config_path, "parser")
local queries_path = path(config_path, "queries")

local languages = { "lua", "rust", "javascript", "typescript", "csharp", "html" }

local function prepend_line(filepath, line)
  local f = io.open(filepath, "r")
  if not f then
    return
  end
  local content = f:read("*a")
  f:close()

  if content:sub(1, #line) == line then
    return
  end

  f = io.open(filepath, "w")
  if f then
    f:write(line .. "\n" .. content)
    f:close()
  end
end

local build_javascript = function()
  local js_ts_path = path(ts_path, "javascript")
  vim.fn.system({ cli, "build", js_ts_path, "-o", path(parser_path, "javascript.so") })
  vim.fn.system({ "cp", "-r", path(js_ts_path, "queries", "."), path(queries_path, "javascript") })
end

local build_typescript = function()
  local ts_ts_path = path(ts_path, "typescript")
  vim.fn.system({ cli, "build", ts_ts_path, "-o", path(parser_path, "typescript.so") })
  vim.fn.system({ "cp", "-r", path(ts_ts_path, "queries", "."), path(queries_path, "typescript") })
  local line = ";; inherits: javascript"
  prepend_line(path(queries_path, "typescript", "highlights.scm"), line)
  prepend_line(path(queries_path, "typescript", "locals.scm"), line)
  prepend_line(path(queries_path, "typescript", "tags.scm"), line)
end

vim.api.nvim_create_user_command("TSBuild", function(opts)
  vim.fn.system({ "mkdir", "-p", parser_path })
  vim.fn.system({ "mkdir", "-p", queries_path })

  local lang = opts.args

  if lang == "" then
    build_typescript()
    return
  end

  if lang == "javascript" then
    build_javascript()
    return
  end

  if lang == "typescript" then
    build_javascript()
    build_typescript()
    return
  end
end, {
  nargs = 1,
  complete = function(ArgLead)
    return vim.tbl_filter(function(item)
      return item:find("^" .. ArgLead)
    end, languages)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = languages,
  callback = function()
    vim.treesitter.start()
  end,
})
