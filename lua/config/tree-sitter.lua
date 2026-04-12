local cli = "tree-sitter"
local path = vim.fs.joinpath

local config_path = vim.fn.stdpath("config")
local ts_path = path(config_path, "vendors", "tree-sitters")
local parser_path = path(config_path, "parser")
local queries_path = path(config_path, "queries")

local languages = { "lua", "rust", "javascript", "typescript", "csharp", "html", "c", "bash", "css", "xml", "hyprlang" }

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

local build_css = function()
  local css_ts_path = path(ts_path, "css")
  vim.fn.system({ cli, "build", css_ts_path, "-o", path(parser_path, "css.so") })
  vim.fn.system({ "cp", "-r", path(css_ts_path, "queries", "."), path(queries_path, "css") })
end

local build_xml = function()
  local xml_ts_path = path(ts_path, "xml")
  vim.fn.system({ cli, "build", xml_ts_path, "-o", path(parser_path, "xml.so") })
  vim.fn.system({ "cp", "-r", path(xml_ts_path, "queries", "."), path(queries_path, "xml") })
end

local build_hyprlang = function()
  local hyprlang_ts_path = path(ts_path, "hyprlang")
  vim.fn.system({ cli, "build", hyprlang_ts_path, "-o", path(parser_path, "hyprlang.so") })
  vim.fn.system({ "cp", "-r", path(hyprlang_ts_path, "queries", "hyprlang", "."), path(queries_path, "hyprlang") })
end

local build_all = function()
  build_javascript()
  build_typescript()
  build_json()
  build_html()
  build_c()
  build_bash()
  build_rust()
  build_csharp()
  build_css()
  build_xml()
  build_hyprlang()
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

  if lang == "css" then
    build_css()
    return
  end

  if lang == "xml" then
    build_xml()
    return
  end

  if lang == "hyprlang" then
    build_hyprlang()
    return
  end
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
  callback = function()
    vim.treesitter.start()
  end,
})
