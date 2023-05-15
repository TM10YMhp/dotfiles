vim.keymap.set('n', 'Z', '<nop>')
vim.keymap.set('n', 'ZZ', '<nop>')
vim.keymap.set('n', 'ZQ', '<nop>')
vim.keymap.set('n', '<c-z>', '<nop>')

vim.keymap.set('n', [[\q]], ':%bw')
vim.keymap.set('n', [[\\]], [[:%s///gc<left><left><left>]])
vim.keymap.set('x', [[\\]], [[:s///gc<left><left><left>]])

local opts = { noremap = true, silent = true }

--[[move in wrap lines
vim.keymap.set('n', 'k', 'gk', opts)
vim.keymap.set('n', 'j', 'gj', opts)
vim.keymap.set('n', '<up>', 'gk', opts)
vim.keymap.set('n', '<down>', 'gj', opts)
vim.keymap.set('i', '<up>', '<c-o>gk', opts)
vim.keymap.set('i', '<down>', '<c-o>gj', opts)
]]

vim.keymap.set('n', '<tab>', '<cmd>bnext<cr>', opts)
vim.keymap.set('n', '<s-tab>', '<cmd>bprevious<cr>', opts)

vim.keymap.set('n', '<leader>h', '<cmd>set hls!<cr>', opts)
vim.keymap.set('n', '<leader>o', '<cmd>set list!<cr>', opts)
