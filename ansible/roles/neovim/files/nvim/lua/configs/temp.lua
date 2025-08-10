-- Internal state for notification replacement ids
local state = {
  status = { id = nil },
  diag = { id = nil },
}

local lvlmap = {
  info = vim.log.levels.INFO,
  warn = vim.log.levels.WARN,
  error = vim.log.levels.ERROR,
}

local function notify_with_replace(kind, msg, level_str)
  local level = lvlmap[level_str] or vim.log.levels.INFO
  local title = (kind == 'diag') and 'LSP Diagnostics' or 'LSP Status'
  local bucket = state[kind]

  local opts = {
    title = title,
    timeout = 500,
    hide_from_history = true,
    on_close = function()
      bucket.id = nil
    end,
  }

  if bucket.id then
    opts.replace = bucket.id
  end

  local record = vim.notify(msg, level, opts)
  -- Some notify implementations return a table w/ id, others return an integer.
  -- We store whatever comes back so long as it's not nil for replacement.
  bucket.id = record and (record.id or record) or nil
end

-- Diagnostics notification builder
local function diagnostics_notify()
  local info = vim.b.coc_diagnostic_info or {}

  if vim.tbl_isempty(info) then
    return
  end

  local msgs = {}
  local level = 'info'
  if (info.warning or 0) > 0 then
    level = 'warn'
  end
  if (info.error or 0) > 0 then
    level = 'error'
  end

  if (info.error or 0) > 0 then
    table.insert(msgs, ' Errors: ' .. info.error)
  end
  if (info.warning or 0) > 0 then
    table.insert(msgs, ' Warnings: ' .. info.warning)
  end
  if (info.information or 0) > 0 then
    table.insert(msgs, '󰀨 Infos: ' .. info.information)
  end
  if (info.hint or 0) > 0 then
    table.insert(msgs, ' Hints: ' .. info.hint)
  end

  local msg
  if #msgs == 0 then
    msg = ' All OK'
  else
    msg = table.concat(msgs, '\n')
  end

  notify_with_replace('diag', msg, level)
end

local function status_notify()
  local status = vim.g.coc_status or ''
  if status == '' then
    return
  end
  notify_with_replace('status', status, 'info')
end

-- Initialization notification
local function init_coc()
  vim.notify('Initialized coc.nvim for LSP support', vim.log.levels.INFO, { title = 'LSP Status' })
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'CocNvimInit',
  callback = init_coc,
  desc = 'Notify when coc.nvim initializes',
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'CocDiagnosticChange',
  callback = diagnostics_notify,
  desc = 'Notify diagnostics changes from coc.nvim',
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'CocStatusChange',
  callback = status_notify,
  desc = 'Notify status changes from coc.nvim',
})
