vim.keymap.set('n', 'ZZ', '<nop>')
vim.keymap.set('n', 'ZQ', '<nop>')
vim.keymap.set('n', '<c-z>', '<nop>')

vim.keymap.set('n', '<leader>qq', '<cmd>bw<cr>', {
  desc = "Delete Buffer (wipeout)"
})
vim.keymap.set('n', '<leader>qa', '<cmd>%bw<cr>', {
  desc = "Delete All Buffers (wipeout)"
})
vim.keymap.set('n', '<leader>qc', function()
    local total = vim.fn.len(vim.fn.getbufinfo({buflisted = 1 }))
    if total > 1 then
      local file = vim.fn.expand("%")
      vim.cmd('silent %bw')
      vim.cmd('e '..file)
      if total-1 > 1 then
        vim.print(total-1 .. ' buffers wiped out')
      end
    else
      vim.print('no buffers were found for deletion')
    end
  end, {
  desc = "Delete All Buffers and Reopen Previous Buffer (wipeout)"
})

vim.keymap.set('n', '<leader>cw', [[<cmd>%s/\s\+$//e<cr>'']], {
  desc = "Remove Trailing Whitespace"
})

vim.keymap.set('n', [[\\]], [[:%s///gc<left><left><left>]], {
  desc = "Substitute"
})
vim.keymap.set('x', [[\\]], [[:s///gc<left><left><left>]], {
  desc = "Substitute"
})

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
vim.keymap.set('n', '<c-down>', '<cmd>resize -2<cr>', {
  desc = "Decrease window height"
})
vim.keymap.set('n', '<c-left>', '<cmd>vertical resize -2<cr>', {
  desc = "Decrease window width"
})
vim.keymap.set('n', '<c-right>', '<cmd>vertical resize +2<cr>', {
  desc = "Increase window width"
})

vim.keymap.set({'n', 'i'}, '<esc>', '<cmd>nohlsearch<cr><esc>', {
  desc = 'Escape and clear hlsearch'
})
vim.keymap.set('n', '<leader>uo', '<cmd>set list!<cr>', {
  desc = "Toogle list mode"
})
