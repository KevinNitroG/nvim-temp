local M = {}

M.get_path_from_executable = function(executable)
  local path = vim.fn.fnamemodify(vim.fn.exepath(executable), ":h")
  return path == "." and nil or path
end

return M
