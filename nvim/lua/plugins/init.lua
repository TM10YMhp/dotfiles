return {
  {
    "ap/vim-buftabline",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
      vim.g.buftabline_show = 2
      vim.g.buftabline_separators = 0
      vim.g.buftabline_numbers = 2
      vim.g.buftabline_plug_max = 10

      local opts = { noremap = true }
      vim.keymap.set('n', '<leader>1', '<Plug>BufTabLine.Go(1)<cr>', opts)
      vim.keymap.set('n', '<leader>2', '<Plug>BufTabLine.Go(2)<cr>', opts)
      vim.keymap.set('n', '<leader>3', '<Plug>BufTabLine.Go(3)<cr>', opts)
      vim.keymap.set('n', '<leader>4', '<Plug>BufTabLine.Go(4)<cr>', opts)
      vim.keymap.set('n', '<leader>5', '<Plug>BufTabLine.Go(5)<cr>', opts)
      vim.keymap.set('n', '<leader>6', '<Plug>BufTabLine.Go(6)<cr>', opts)
      vim.keymap.set('n', '<leader>7', '<Plug>BufTabLine.Go(7)<cr>', opts)
      vim.keymap.set('n', '<leader>8', '<Plug>BufTabLine.Go(8)<cr>', opts)
      vim.keymap.set('n', '<leader>9', '<Plug>BufTabLine.Go(9)<cr>', opts)
      vim.keymap.set('n', '<leader>0', '<Plug>BufTabLine.Go(10)<cr>', opts)
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

      vim.keymap.set('n', '<s-b>"',
        '<cmd>FloatermNew --wintype=split --height=0.35<cr>',
        { noremap = true }
      )
    end
  },
  {
    "unblevable/quick-scope",
    event = "VeryLazy",
    init = function()
      vim.g.qs_highlight_on_keys = { "f", "F", "t", "T"}
      vim.g.qs_lazy_highlight = 1
      vim.cmd[[hi QuickScopePrimary ctermfg=green]]
      vim.cmd[[hi QuickScopeSecondary ctermfg=cyan]]
    end
  },
  {
    "machakann/vim-sandwich",
    event = "VeryLazy",
  },
}
