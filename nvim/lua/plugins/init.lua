return {
  --"bling/vim-bufferline",
  --"tamton-aquib/keys.nvim",
  {
    "ap/vim-buftabline",
    lazy = false,
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require('Comment').setup({
        padding = false
      })
    end
  },
  {
    "ojroques/nvim-osc52",
    event = "VeryLazy",
    config = function()
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
