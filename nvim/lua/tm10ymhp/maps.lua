local opts = { noremap = true, silent = true }

--[[move in wrap lines
vim.keymap.set('n', 'k', 'gk', opts)
vim.keymap.set('n', 'j', 'gj', opts)
vim.keymap.set('n', '<up>', 'gk', opts)
vim.keymap.set('n', '<down>', 'gj', opts)
vim.keymap.set('i', '<up>', '<c-o>gk', opts)
vim.keymap.set('i', '<down>', '<c-o>gj', opts)
]]

vim.keymap.set('n', 'Z', '<nop>', opts)
vim.keymap.set('n', 'ZZ', '<nop>', opts)
vim.keymap.set('n', 'ZQ', '<nop>', opts)
vim.keymap.set('n', '<c-z>', '<nop>', opts)

vim.keymap.set('n', '<tab>', '<cmd>bnext<cr>', opts)
vim.keymap.set('n', '<s-tab>', '<cmd>bprevious<cr>', opts)
vim.keymap.set('n', '\\', [[:%s///gc<left><left><left>]], opts)

vim.keymap.set('n', '<leader>h', '<cmd>nohls<cr>', opts)
vim.keymap.set('n', '<leader>o', '<cmd>set list!<cr>', opts)

vim.keymap.set('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition<cr>', opts)
vim.keymap.set('n', '<leader>=', '<cmd>lua vim.lsp.buf.format<cr>', opts)
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover<cr>', opts)

vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float<cr>', opts)
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev<cr>', opts)
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next<cr>', opts)
