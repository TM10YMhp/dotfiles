return {
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

      vim.keymap.set('n', 'Bc', '<cmd>FloatermNew<cr>', {
        desc = "Open a floaterm window"
      })
      vim.keymap.set('n', 'Bp', '<cmd>FloatermPrev<cr>', {
        desc = "Switch to the previous floaterm instance"
      })
      vim.keymap.set('n', 'Bn', '<cmd>FloatermNext<cr>', {
        desc = "Switch to the next floaterm instance"
      })
      vim.keymap.set('n', 'Bh', '<cmd>FloatermToggle<cr>', {
        desc = "Open or hide the floaterm window"
      })

      vim.keymap.set('t', 'Bc', [[<c-\><c-n><cmd>FloatermNew<cr>]], {
        desc = "Open a floaterm window"
      })
      vim.keymap.set('t', 'Bp', [[<c-\><c-n><cmd>FloatermPrev<cr>]], {
        desc = "Switch to the previous floaterm instance"
      })
      vim.keymap.set('t', 'Bn', [[<c-\><c-n><cmd>FloatermNext<cr>]], {
        desc = "Switch to the next floaterm instance"
      })
      vim.keymap.set('t', 'Bh', [[<c-\><c-n><cmd>FloatermToggle<cr>]], {
        desc = "Open or hide the floaterm window"
      })
    end
  },
  {
    "machakann/vim-sandwich",
    event = "VeryLazy",
    init = function()
      vim.g.sandwich_no_default_key_mappings = 1

      vim.keymap.set({ 'n', 'x', 'o' }, '<leader>aa', '<Plug>(sandwich-add)')
      vim.keymap.set({ 'n', 'x' }, '<leader>ad', '<Plug>(sandwich-delete)')
      vim.keymap.set({ 'n', 'x' }, '<leader>ar', '<Plug>(sandwich-replace)')
      vim.keymap.set({ 'x', 'o' }, 'ab', '<Plug>(textobj-sandwich-auto-a)')
      vim.keymap.set({ 'x', 'o' }, 'ib', '<Plug>(textobj-sandwich-auto-i)')
      vim.keymap.set({ 'x', 'o' }, 'as', '<Plug>(textobj-sandwich-query-a)')
      vim.keymap.set({ 'x', 'o' }, 'is', '<Plug>(textobj-sandwich-query-i)')
      vim.keymap.set('n', '<leader>adb', '<Plug>(sandwich-delete-auto)')
      vim.keymap.set('n', '<leader>arb', '<Plug>(sandwich-replace-auto)')
    end
  },
}
