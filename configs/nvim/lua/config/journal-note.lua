local function create_note(is_weekly)
  -- Close file explorers first
  local explorer_bufs = vim.tbl_filter(function(buf)
    return vim.bo[buf].filetype:match 'Tree$' -- Matches NvimTree, CHADTree, etc.
  end, vim.api.nvim_list_bufs())

  for _, buf in ipairs(explorer_bufs) do
    vim.api.nvim_buf_delete(buf, { force = true })
  end

  -- folder paths
  local folder_dir = '~/vaults/mikes-vault/chronicle/notes/'
  local template_dir = '~/vaults/mikes-vault/atlas/utilities/templates/'
  -- Calculate paths and identifiers
  local date = os.date '*t'
  local year = date.year
  local month = date.month
  local quarter = math.floor((month - 1) / 3) + 1
  local q_dir = 'q' .. quarter

  local note_path, template_path
  if is_weekly then
    local week_num = math.floor(
      (os.time(date) - os.time { year = year, month = (quarter - 1) * 3 + 1, day = 1 }) / (7 * 86400)
    ) + 1
    week_num = math.min(math.max(week_num, 1), 13)
    note_path =
      vim.fn.expand(string.format('%s/%s/%s/%s-w%d.md', folder_dir, year, q_dir, os.date '%Y-%m-%d', week_num))
    template_path = vim.fn.expand(string.format('%s/weekly.md', template_dir))
  else
    note_path = vim.fn.expand(string.format('%s/%s/%s/%s.md', folder_dir, year, q_dir, os.date '%Y-%m-%d'))
    template_path = vim.fn.expand(string.format('%s/daily.md', template_dir))
  end

  -- Isolated buffer creation
  if vim.fn.filereadable(note_path) == 0 then
    vim.fn.mkdir(vim.fn.fnamemodify(note_path, ':h'), 'p')
    vim.cmd 'enew' -- Create in new empty buffer
    vim.cmd('silent! 0r ' .. template_path)
    vim.cmd('w ' .. note_path)
    vim.cmd 'bw!' -- Wipe buffer without saving
  end

  vim.cmd('edit ' .. note_path)
end

-- Keybindings
vim.keymap.set('n', '<leader>dn', function()
  create_note(false)
end, { desc = 'Daily note' })
vim.keymap.set('n', '<leader>wp', function()
  create_note(true)
end, { desc = 'Weekly plan' })
