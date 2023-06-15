return {
  "echasnovski/mini.statusline",
  event = "BufEnter",
  config = function()
    local MiniStatusline = require("mini.statusline")
    function custom_statusline()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 60 })
      local diagnostics   = MiniStatusline.section_diagnostics({})
      local filename      = '%t%m %r'
      local fileinfo      = '%y'
      local location      = MiniStatusline.section_location({ trunc_width = 75 })
      return MiniStatusline.combine_groups({
        { hl = 'Normal', strings = { mode, diagnostics } },
        '%<', -- Mark general truncate point
        { hl = 'Normal', strings = { filename } },
        '%=', -- End left alignment
        { hl = 'Normal', strings = { fileinfo, location } },
      })
    end

    MiniStatusline.setup({
      content = {
        active = custom_statusline,
      },
      use_icons = false,
      set_vim_settings = false
    })
  end
}
