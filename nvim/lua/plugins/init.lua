return {
  {
    "ap/vim-buftabline",
    lazy = false,
    init = function()
      vim.g.buftabline_show = 2
      vim.g.buftabline_separators = 0
      vim.g.buftabline_numbers = 1
      vim.g.buftabline_plug_max = 0
    end
  },
  {
    "voldikss/vim-floaterm",
    event = "VeryLazy",
    init = function()
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_keymap_new = '<s-b>c'
      vim.g.floaterm_keymap_prev = '<s-b>p'
      vim.g.floaterm_keymap_next = '<s-b>n'
      vim.g.floaterm_keymap_toggle = '<s-b>h'
    end
  },
  {
    "machakann/vim-sandwich",
    event = "VeryLazy",
  },
}
