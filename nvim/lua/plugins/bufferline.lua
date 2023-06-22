return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  config = function()
    require('bufferline').setup({
      options = {
        indicator = { icon = " *" },
        buffer_close_icon = "x",
        close_icon = "x",
        left_trunc_marker = '<',
        right_trunc_marker = '>',
        truncate_names = false,
        tab_size = 0,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and "E "
              or (e == "warning" and "W " or "H " )
            s = s .. n .. sym
          end
          return vim.trim(s)
        end,
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        move_wraps_at_ends = false,
        always_show_bufferline = true,
        hover = { enabled = false },
      }
    })

    vim.keymap.set('n', '<s-tab>', '<cmd>BufferLineCyclePrev<cr>', {
      desc = "Prev buffer"
    })
    vim.keymap.set('n', '<tab>', '<cmd>BufferLineCycleNext<cr>', {
      desc = "Next buffer"
    })
    vim.keymap.set('n', '<leader>`', '<cmd>e #<cr>', {
      desc = "Switch to other buffer"
    })
  end
}
