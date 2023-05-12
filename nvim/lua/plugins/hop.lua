return {
  "phaazon/hop.nvim",
  event = "VeryLazy",
  config = function()
    local hop = require("hop")
    local directions = require("hop.hint").HintDirection

    hop.setup({
      case_insensitive = false,
      create_hl_autocmd = false,
      hint_offset = 0,
    })

    vim.cmd[[hi HopUnmatched NONE]]
    vim.cmd[[hi HopNextKey  NONE cterm=reverse,bold]]
    vim.cmd[[hi HopNextKey1 NONE cterm=reverse,bold]]
    vim.cmd[[hi HopNextKey2 NONE cterm=reverse,bold]]

    local opts = { remap = false }

    vim.keymap.set('n', "f", function()
      hop.hint_char1({
        direction = directions.AFTER_CURSOR,
        current_line_only = true,
      })
    end, opts)
    vim.keymap.set('x', "f", function()
      hop.hint_char1({
        direction = directions.AFTER_CURSOR,
        current_line_only = true
      })
    end, opts)
    vim.keymap.set('n', "F", function()
     hop.hint_char1({
       direction = directions.BEFORE_CURSOR,
       current_line_only = true,
     })
    end, opts)
    vim.keymap.set('x', "F", function()
     hop.hint_char1({
       direction = directions.BEFORE_CURSOR,
       current_line_only = true
     })
    end, opts)
  end
}
