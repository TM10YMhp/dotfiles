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
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require('Comment').setup({
        padding = false,
      })
    end
  },
  {
    "ojroques/nvim-osc52",
    event = "VeryLazy",
    config = function()

      --Here is a non-exhaustive list of the status of popular terminal
      --emulators regarding OSC52  (https://github.com/ojroques/vim-oscyank)

      --If you are using tmux, run these steps first: enabling OSC52 in tmux.
      --Then make sure set-clipboard is set to on: set -s set-clipboard on.

      local osc52 = require('osc52')
      osc52.setup {
        max_length = 0, --Maximum length of selection (0 for no limit)
        silent = false, --Disable message on successful copy
        trim = false,   --Trim text before copy
      }
      vim.keymap.set('x', '%', osc52.copy_visual)
    end
  },
}
