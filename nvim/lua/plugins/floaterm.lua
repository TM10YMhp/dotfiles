return {
  "voldikss/vim-floaterm",
  event = "VeryLazy",
  init = function()
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.g.floaterm_autohide = 2

    vim.keymap.set('n', 'BC',
      "<cmd>exe 'FloatermNew --cwd='..expand('%:p:h')<cr>",
      { desc = "Open a floaterm window (cwd)" }
    )
    vim.keymap.set('t', 'B&',
      [[<c-\><c-n><cmd>exe 'FloatermKill'|FloatermNext<cr>]],
      { desc = "Kill the current floaterm instance" }
    )

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
}
