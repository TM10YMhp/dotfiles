return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim"
  },
  config = function ()
    vim.cmd [[
      hi TelescopeSelection cterm='none'
    ]]
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")
    local action_state = require("telescope.actions.state")

    require("telescope").setup({
      defaults = {
        border = true,
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        --layout_strategy = "bottom_pane",
        sorting_strategy = "ascending",
        layout_config = {
          width = { 0.7, min = 80 },
          height = 35,
          preview_cutoff = 0,
          preview_width = 0.6,
          prompt_position = "top"
        },
        prompt_prefix = "",
        mappings = {
          i = {
            ["<C-p>"] = action_layout.toggle_preview,
            ["<M-q>"] = function(pb)
              local picker = action_state.get_current_picker(pb)
              local multi = picker:get_multi_selection()
              actions.select_default(pb) -- the normal enter behaviour
              for _, j in pairs(multi) do
                if j.path ~= nil then -- is it a file -> open it as well:
                  vim.cmd(string.format("%s %s", "edit", j.path))
                end
              end
            end,
          }
        },
        preview = {
          hide_on_startup = true
        }
      },
      --pickers = {
      --  find_files = {
      --    theme = "ivy",
      --  }
      --},
    })

    require("telescope").load_extension("file_browser")
  end
}
