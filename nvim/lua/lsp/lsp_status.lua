local lsp_status = require('lsp-status')

lsp_status.register_progress()
lsp_status.config({
  kind_labels = {},
  select_symbol = nil,
  current_function = true,
  show_filename = true,
  indicator_separator = ':',
  component_separator = ' ',
  indicator_errors = 'E',
  indicator_warnings = 'W',
  indicator_info = 'i',
  indicator_hint = '?',
  indicator_ok = 'LSP',
  spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
  status_symbol = ' |',
  diagnostics = true,
})
vim.opt.statusline:append("%{v:lua.require('lsp-status').status()} ")
