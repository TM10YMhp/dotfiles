return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup({
      options = {
        style_preset = {
          bufferline.style_preset.no_bold,
          bufferline.style_preset.no_italic
        },
        themable = false,
        numbers = function(opts)
          return string.format('%s.%s', opts.ordinal, opts.id)
        end,
        close_command = "bwipeout! %d",
        right_mouse_command = "",
        left_mouse_command = "",
        middle_mouse_command = "",
        indicator = { icon = " *" },
        buffer_close_icon = "x",
        modified_icon = '●',
        close_icon = "x",
        left_trunc_marker = '<',
        right_trunc_marker = '>',
        truncate_names = false,
        tab_size = 0,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(_, _, diagnostics_dict)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and "E "
              or (e == "warning" and "W " or "H " )
            s = s .. n .. sym
          end
          return vim.trim(s)
        end,
        color_icons = false,
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        move_wraps_at_ends = false,
        separator_style = { "|", "|" },
        always_show_bufferline = true,
        hover = { enabled = false },
      },
      highlights = {
        separator = { link = 'TabLineFill' },
        separator_selected = { link = 'TabLine' },
        background = { link = 'TabLine' },
        buffer_selected = { link = 'TabLineSel' },
        fill = { link = 'TabLineFill' },
      },
    })

    vim.keymap.set('n', '<s-tab>', '<cmd>BufferLineCyclePrev<cr>', {
      desc = "Prev buffer"
    })
    vim.keymap.set('n', '<tab>', '<cmd>BufferLineCycleNext<cr>', {
      desc = "Next buffer"
    })
    vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<cr>', {
      desc = "Prev buffer"
    })
    vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<cr>', {
      desc = "Next buffer"
    })
    vim.keymap.set('n', '<leader>b`', '<cmd>e #<cr>', {
      desc = "Switch to other buffer"
    })
    vim.keymap.set('n', '<leader>bn', '<cmd>BufferLineMoveNext<cr>', {
      desc = "Move Buffer Forward"
    })
    vim.keymap.set('n', '<leader>bp', '<cmd>BufferLineMovePrev<cr>', {
      desc = "Move Buffer Backward"
    })
    vim.keymap.set('n', '<leader>bN', '<cmd>BufferLineCloseRight<cr>', {
      desc = "Close All Buffers To The Right"
    })
    vim.keymap.set('n', '<leader>bP', '<cmd>BufferLineCloseLeft<cr>', {
      desc = "Close All Buffers To The Left"
    })
    vim.keymap.set('n', '<leader>b1',
      "<cmd>lua require('bufferline').go_to(1, true)<cr>",
      { desc = "Go To Buffer 1" }
    )
    vim.keymap.set( 'n', '<leader>b2',
      "<cmd>lua require('bufferline').go_to(2, true)<cr>",
      { desc = "Go To Buffer 2" }
    )
    vim.keymap.set('n', '<leader>b3',
      "<cmd>lua require('bufferline').go_to(3, true)<cr>",
      { desc = "Go To Buffer 3" }
    )
    vim.keymap.set( 'n', '<leader>b4',
      "<cmd>lua require('bufferline').go_to(4, true)<cr>",
      { desc = "Go To Buffer 4" }
    )
    vim.keymap.set( 'n', '<leader>b5',
      "<cmd>lua require('bufferline').go_to(5, true)<cr>",
      { desc = "Go To Buffer 5" }
    )
    vim.keymap.set( 'n', '<leader>b6',
      "<cmd>lua require('bufferline').go_to(6, true)<cr>",
      { desc = "Go To Buffer 6" }
    )
    vim.keymap.set( 'n', '<leader>b7',
      "<cmd>lua require('bufferline').go_to(7, true)<cr>",
      { desc = "Go To Buffer 7" }
    )
    vim.keymap.set( 'n', '<leader>b8',
      "<cmd>lua require('bufferline').go_to(8, true)<cr>",
      { desc = "Go To Buffer 8" }
    )
    vim.keymap.set( 'n', '<leader>b9',
      "<cmd>lua require('bufferline').go_to(9, true)<cr>",
      { desc = "Go To Buffer 9" }
    )
    vim.keymap.set( 'n', '<leader>b$',
      "<cmd>lua require('bufferline').go_to(-1, true)<cr>",
      { desc = "Go To Last Buffer" }
    )
  end
}
