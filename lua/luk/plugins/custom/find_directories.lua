local finders = require 'telescope.finders'
local pickers = require 'telescope.pickers'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

local M = {}

local open_as_netrw = function(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  actions.close(prompt_bufnr)
  vim.cmd('edit ' .. selection[1]) -- Opens dir as Netrw buffer
end

function M.find_dirs()
  pickers
    .new({}, {
      prompt_title = 'Find Directories',
      finder = finders.new_oneshot_job({ 'fd', '-t', 'd' }, {}),
      sorter = conf.file_sorter(),
      attach_mappings = function(_, map)
        map('i', '<CR>', open_as_netrw)
        map('n', '<CR>', open_as_netrw)
        return true
      end,
    })
    :find()
end

return M
