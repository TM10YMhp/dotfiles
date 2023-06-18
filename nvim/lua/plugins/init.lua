return {
  {
    "justinmk/vim-sneak",
    event = "VeryLazy",
    init = function()
      vim.g['sneak#label'] = 1
      vim.g['sneak#map_netrw'] = 0
      vim.g['sneak#s_next'] = 1

      vim.cmd[[hi Sneak cterm=reverse]]
      vim.cmd[[hi SneakLabel cterm=reverse]]
      vim.cmd[[hi SneakLabelMask ctermbg=white]]
    end
  },
  {
    "ap/vim-buftabline",
    event = "BufEnter",
    init = function()
      vim.g.buftabline_show = 2
      vim.g.buftabline_separators = 0
      vim.g.buftabline_numbers = 2
      vim.g.buftabline_plug_max = 9

      vim.keymap.set('n', '<leader>1', '<Plug>BufTabLine.Go(1)')
      vim.keymap.set('n', '<leader>2', '<Plug>BufTabLine.Go(2)')
      vim.keymap.set('n', '<leader>3', '<Plug>BufTabLine.Go(3)')
      vim.keymap.set('n', '<leader>4', '<Plug>BufTabLine.Go(4)')
      vim.keymap.set('n', '<leader>5', '<Plug>BufTabLine.Go(5)')
      vim.keymap.set('n', '<leader>6', '<Plug>BufTabLine.Go(6)')
      vim.keymap.set('n', '<leader>7', '<Plug>BufTabLine.Go(7)')
      vim.keymap.set('n', '<leader>8', '<Plug>BufTabLine.Go(8)')
      vim.keymap.set('n', '<leader>9', '<Plug>BufTabLine.Go(9)')
    end
  },
  {
    "voldikss/vim-floaterm",
    event = "VeryLazy",
    init = function()
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_autohide = 2
      vim.g.floaterm_keymap_new = '<s-b>c'
      vim.g.floaterm_keymap_prev = '<s-b>p'
      vim.g.floaterm_keymap_next = '<s-b>n'
      vim.g.floaterm_keymap_toggle = '<s-b>h'
    end
  },
  {
    "machakann/vim-sandwich",
    event = "VeryLazy",
    init = function()
      vim.g.sandwich_no_default_key_mappings = 1

      vim.keymap.set({ 'n', 'x', 'o' }, '<leader>sa', '<Plug>(sandwich-add)')
      vim.keymap.set({ 'n', 'x' }, '<leader>sd', '<Plug>(sandwich-delete)')
      vim.keymap.set({ 'n', 'x' }, '<leader>sr', '<Plug>(sandwich-replace)')
      vim.keymap.set({ 'x', 'o' }, 'ab', '<Plug>(textobj-sandwich-auto-a)')
      vim.keymap.set({ 'x', 'o' }, 'ib', '<Plug>(textobj-sandwich-auto-i)')
      vim.keymap.set({ 'x', 'o' }, 'as', '<Plug>(textobj-sandwich-query-a)')
      vim.keymap.set({ 'x', 'o' }, 'is', '<Plug>(textobj-sandwich-query-i)')
      vim.keymap.set('n', '<leader>sdb', '<Plug>(sandwich-delete-auto)')
      vim.keymap.set('n', '<leader>srb', '<Plug>(sandwich-replace-auto)')
    end
  },
}
