local cli = "tree-sitter"
local path = vim.fs.joinpath

local config_path = vim.fn.stdpath("config")
local ts_path = path(config_path, "vendors", "tree-sitters")
local parser_path = path(config_path, "parser")
local queries_path = path(config_path, "queries")

local languages = { "lua", "rust", "javascript", "typescript", "csharp", "html", "c", "bash", "jsdoc" }

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
  local line = ";; inherits: jsdoc"
  prepend_line(path(queries_path, "jsdoc", "highlights.scm"), line)
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

local build_jsdoc = function()
  local jsdoc_ts_path = path(ts_path, "jsdoc")
  vim.fn.system({ cli, "build", jsdoc_ts_path, "-o", path(parser_path, "jsdoc.so") })
  vim.fn.system({ "cp", "-r", path(jsdoc_ts_path, "queries", "."), path(queries_path, "jsdoc") })
end

local build_json = function()
  local json_ts_path = path(ts_path, "json")
  vim.fn.system({ cli, "build", json_ts_path, "-o", path(parser_path, "json.so") })
  vim.fn.system({ "cp", "-r", path(json_ts_path, "queries", "."), path(queries_path, "json") })
end

local build_html = function()
  local html_ts_path = path(ts_path, "html")
  vim.fn.system({ cli, "build", html_ts_path, "-o", path(parser_path, "html.so") })
  vim.fn.system({ "cp", "-r", path(html_ts_path, "queries", "."), path(queries_path, "html") })
end

local build_c = function()
  local c_ts_path = path(ts_path, "c")
  vim.fn.system({ cli, "build", c_ts_path, "-o", path(parser_path, "c.so") })
  vim.fn.system({ "cp", "-r", path(c_ts_path, "queries", "."), path(queries_path, "c") })
end

local build_bash = function()
  local bash_ts_path = path(ts_path, "bash")
  vim.fn.system({ cli, "build", bash_ts_path, "-o", path(parser_path, "bash.so") })
  vim.fn.system({ "cp", "-r", path(bash_ts_path, "queries", "."), path(queries_path, "bash") })
end

local build_rust = function()
  local rust_ts_path = path(ts_path, "rust")
  vim.fn.system({ cli, "build", rust_ts_path, "-o", path(parser_path, "rust.so") })
  vim.fn.system({ "cp", "-r", path(rust_ts_path, "queries", "."), path(queries_path, "rust") })
end

local build_csharp = function()
  local csharp_ts_path = path(ts_path, "csharp")
  vim.fn.system({ cli, "build", csharp_ts_path, "-o", path(parser_path, "csharp.so") })
  vim.fn.system({ "cp", "-r", path(csharp_ts_path, "queries", "."), path(queries_path, "csharp") })
end

local build_all = function()
  build_jsdoc()
  build_javascript()
  build_typescript()
  build_json()
  build_html()
  build_c()
  build_bash()
  build_rust()
  build_csharp()
end

vim.api.nvim_create_user_command("TSBuild", function(opts)
  vim.fn.system({ "mkdir", "-p", parser_path })
  vim.fn.system({ "mkdir", "-p", queries_path })

  local lang = opts.args

  if lang == "" then
    build_all()
    return
  end

  if lang == "javascript" then
    build_javascript()
    return
  end

  if lang == "typescript" then
    build_typescript()
    return
  end

  if lang == "json" then
    build_json()
    return
  end

  if lang == "html" then
    build_html()
    return
  end

  if lang == "c" then
    build_c()
    return
  end

  if lang == "bash" then
    build_bash()
    return
  end

  if lang == "rust" then
    build_rust()
    return
  end

  if lang == "csharp" then
    build_csharp()
    return
  end

  if lang == "jsdoc" then
    build_jsdoc()
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
