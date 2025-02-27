vim.api.nvim_create_user_command('CopyFullPath', function()
  local file_path = vim.fn.expand '%:p'
  vim.fn.setreg('+', file_path)
  return file_path
end, {})

vim.api.nvim_create_user_command('CopyRelativePath', function()
  local file_path = vim.fn.expand '%'
  vim.fn.setreg('+', file_path)
  return file_path
end, {})

vim.api.nvim_create_user_command('CopyFileName', function()
  local file_path = vim.fn.expand '%:t'
  vim.fn.setreg('+', file_path)
  return file_path
end, {})

return {}
