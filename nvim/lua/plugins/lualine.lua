return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = false,
        theme = {
          normal = {
            a = "StatusLine",
            b = "StatusLine",
            c = "StatusLine"
          },
          inactive = {
            a = "StatusLineNC",
            b = "StatusLineNC",
            c = "StatusLineNC"
          }
        },
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', {
            'diff',
            diff_color = {
              added    = 'DiffAdd',
              modified = 'DiffChange',
              removed  = 'DiffDelete',
            },
          }, {
            'diagnostics',
            sources = {'nvim_diagnostic'},
            diagnostics_color = {
              error = 'DiagnosticError',
              warn  = 'DiagnosticWarn',
              info  = 'DiagnosticInfo',
              hint  = 'DiagnosticHint',
            },
            update_in_insert = false
          }
        },
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {},
        lualine_z = {'%L:%-2{virtcol("$") - 1} %l:%-2v'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
    })
  end
}
