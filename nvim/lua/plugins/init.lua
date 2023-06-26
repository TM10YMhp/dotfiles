return {
  {
    "folke/tokyonight.nvim",
    event = "VeryLazy",
  },
  {
    "junegunn/vim-easy-align",
    event = "VeryLazy",
    init = function()
      vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', {
        desc = "Align"
      })
    end
  },
  {
    "FooSoft/vim-argwrap",
    event = "VeryLazy",
    init = function()
      vim.keymap.set('n', 'gW', '<cmd>ArgWrap<cr>', {
        desc = "Toogle Argument Wrapping"
      })
    end
  },
  {
    "machakann/vim-sandwich",
    event = "VeryLazy",
    init = function()
      vim.g.sandwich_no_default_key_mappings = 1

      vim.keymap.set({ 'n', 'x', 'o' }, '<leader>za', '<Plug>(sandwich-add)')
      vim.keymap.set({ 'n', 'x' }, '<leader>zd', '<Plug>(sandwich-delete)')
      vim.keymap.set({ 'n', 'x' }, '<leader>zr', '<Plug>(sandwich-replace)')
      vim.keymap.set({ 'x', 'o' }, 'ab', '<Plug>(textobj-sandwich-auto-a)')
      vim.keymap.set({ 'x', 'o' }, 'ib', '<Plug>(textobj-sandwich-auto-i)')
      vim.keymap.set({ 'x', 'o' }, 'as', '<Plug>(textobj-sandwich-query-a)')
      vim.keymap.set({ 'x', 'o' }, 'is', '<Plug>(textobj-sandwich-query-i)')
      vim.keymap.set('n', '<leader>zdb', '<Plug>(sandwich-delete-auto)')
      vim.keymap.set('n', '<leader>zrb', '<Plug>(sandwich-replace-auto)')
    end
  },
}
