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
    "echasnovski/mini.splitjoin",
    event = "VeryLazy",
    opts = {}
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {}
  },
}
