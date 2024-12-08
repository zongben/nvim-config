local M = {}

M.get_os = function()
  if vim.fn.has("win32") == 1 then
    return "Windows"
  elseif vim.fn.has("mac") == 1 then
    return "macOS"
  elseif vim.fn.has("unix") == 1 then
    return "Linux"
  else
    return nil
  end
end

M.combined_path = function(...)
  local path = ""
  local slash = "/"
  if M.get_os() == "Windows" then
    slash = "\\"
  end
  for _, part in ipairs({ ... }) do
    path = path .. part .. slash
  end
  return path:sub(1, -2)
end

return M
