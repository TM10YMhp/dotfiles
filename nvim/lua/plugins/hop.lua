return {
  "phaazon/hop.nvim",
  event = "VeryLazy",
  config = function()
    local hop = require("hop")

    hop.setup({
      case_insensitive = false,
      create_hl_autocmd = false,
    })

    vim.cmd[[hi HopUnmatched NONE]]
    vim.cmd[[hi HopNextKey  NONE cterm=reverse,bold]]
    vim.cmd[[hi HopNextKey1 NONE cterm=reverse,bold]]
    vim.cmd[[hi HopNextKey2 NONE cterm=reverse,bold]]

    local opts = { remap = false }

    vim.keymap.set('n', [[\f]], hop.hint_char2, opts)
    vim.keymap.set('v', [[\f]], hop.hint_char2, opts)
    vim.keymap.set('n', [[\F]], hop.hint_words, opts)
    vim.keymap.set('v', [[\F]], hop.hint_words, opts)
  end
}
