vim.keymap.set('n', 'ZZ', '<nop>')
vim.keymap.set('n', 'ZQ', '<nop>')
vim.keymap.set('n', '<c-z>', '<nop>')

vim.keymap.set('n', [[\q]], ':%bw')
vim.keymap.set('n', [[\\]], [[:%s///gc<left><left><left>]])
vim.keymap.set('x', [[\\]], [[:s///gc<left><left><left>]])

--[[move in wrap lines
local opts = { noremap = true }

vim.keymap.set('n', 'k', 'gk', opts)
vim.keymap.set('n', 'j', 'gj', opts)
vim.keymap.set('n', '<up>', 'gk', opts)
vim.keymap.set('n', '<down>', 'gj', opts)
vim.keymap.set('i', '<up>', '<c-o>gk', opts)
vim.keymap.set('i', '<down>', '<c-o>gj', opts)
]]

vim.keymap.set('n', '<c-up>', '<cmd>resize +2<cr>', {
  desc = "Increase window height"
})
vim.keymap.set('n', '<c-down>', '<cmd>vertical resize -2<cr>', {
  desc = "Decrease window height"
})
vim.keymap.set('n', '<c-left>', '<cmd>vertical resize -2<cr>', {
  desc = "Decrease window width"
})
vim.keymap.set('n', '<c-right>', '<cmd>resize +2<cr>', {
  desc = "Increase window width"
})

vim.keymap.set('n', '<s-tab>', '<cmd>bprevious<cr>', { desc = "Prev buffer" })
vim.keymap.set('n', '<tab>', '<cmd>bnext<cr>', { desc = "Next buffer" })
vim.keymap.set('n', '<leader>0', '<cmd>e #<cr>', {
  desc = "Switch to other buffer"
})

vim.keymap.set({'n', 'i'}, '<esc>', '<cmd>nohlsearch<cr><esc>', {
  desc = 'Escape and clear hlsearch'
})
vim.keymap.set('n', '<leader>uo', '<cmd>set list!<cr>', {
  desc = "Toogle list mode"
})
