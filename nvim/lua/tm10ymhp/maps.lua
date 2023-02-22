local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<tab>', ':bnext<cr>', opts)
vim.keymap.set('n', '<s-tab>', ':bprevious<cr>', opts)
vim.keymap.set('n', '\\', ':%s///gc<left><left><left>', opts)

vim.keymap.set('n', '<leader>h', ':set hls!<cr>', opts)
vim.keymap.set('n', '<leader>o', ':set list!<cr>', opts)

vim.keymap.set('n', '<leader>nt', ':Telescope file_browser<cr>', opts)
vim.keymap.set('n', '<leader>t', ':Telescope find_files<cr>', opts)
vim.keymap.set('n', '<leader>b', ':Telescope buffers<cr>', opts)
vim.keymap.set('n', '<leader>g', ':Telescope live_grep<cr>', opts)

vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, opts)
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
