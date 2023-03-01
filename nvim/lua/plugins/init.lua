return {
  {
    "ap/vim-buftabline",
    lazy = false,
  },
  {
    "voldikss/vim-floaterm",
    lazy = false,
  },
  {
    "machakann/vim-sandwich",
    lazy = false,
  },
  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    config = function()
      require('hop').setup({
        case_insensitive = false,
        create_hl_autocmd = false,
      })

      vim.cmd[[hi HopUnmatched NONE]]
      vim.cmd[[hi HopNextKey  NONE cterm=reverse,bold]]
      vim.cmd[[hi HopNextKey1 NONE cterm=reverse,bold]]
      vim.cmd[[hi HopNextKey2 NONE cterm=reverse,bold]]

      vim.keymap.set('n', 'f', "<cmd>lua require'hop'.hint_char2()<cr>", { remap = false })
      vim.keymap.set('v', 'f', "<cmd>lua require'hop'.hint_char2()<cr>", { remap = false })
      vim.keymap.set('n', 'F', "<cmd>lua require'hop'.hint_words()<cr>", { remap = false })
      vim.keymap.set('v', 'F', "<cmd>lua require'hop'.hint_words()<cr>", { remap = false })
    end
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
