vim.keymap.set('n', 'ZZ', '<nop>')
vim.keymap.set('n', 'ZQ', '<nop>')
vim.keymap.set('n', '<c-z>', '<nop>')

vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

vim.keymap.set('n', '<leader>qq', '<cmd>bw<cr>', {
  desc = "Delete Buffer (wipeout)"
})
vim.keymap.set('n', '<leader>qa', '<cmd>%bw<cr>', {
  desc = "Delete All Buffers (wipeout)"
})
vim.keymap.set('n', '<leader>qc', function()
    local total = vim.fn.len(vim.fn.getbufinfo({buflisted = 1 }))
    if total < 1 then
      return vim.api.nvim_err_writeln('no buffers were found for deletion')
    end

    local file = vim.fn.expand("%")
    local ok, msg = pcall(vim.cmd, "%bw")

    if not ok then
      return vim.api.nvim_err_writeln(msg:match(":(%a%d.+)"))
    end
    vim.cmd('e '..file)
  end, {
  desc = "Delete All, Reopen (wipeout)"
})
vim.keymap.set('n', '<leader>qr', function()
    local file = vim.fn.expand("%")
    local ok, msg = pcall(vim.cmd, "bw")
    if not ok then
      return vim.api.nvim_err_writeln(msg:match(":(%a%d.+)"))
    end
    vim.cmd('e '..file)
  end, {
  desc = "Reopen Previous Buffer (wipeout)"
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
