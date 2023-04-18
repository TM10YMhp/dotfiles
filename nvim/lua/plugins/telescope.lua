return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function ()
    vim.cmd [[
      hi TelescopeSelection cterm='none'
    ]]

    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")
    local action_state = require("telescope.actions.state")

    telescope.setup({
      defaults = {
        color_devicons = false,
        file_ignore_patterns = { ".git", ".class" },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden"
        },
        border = true,
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        sorting_strategy = "ascending",
        layout_config = {
          width = { 0.7, min = 90 },
          height = 30,
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
      pickers = {
        find_files = {
          hidden = true,
          --theme = "ivy",
        },
        --current_buffer_fuzzy_find = {
        --  sorter = require('telescope.sorters').get_substr_matcher({})
        --}
      },
      extensions = {
        file_browser = {
          hidden = true,
          --git_status = false
        }
      }
    })

    telescope.load_extension("file_browser")

    local builtin = require("telescope.builtin")
    local opts = { noremap = true, silent = true }

    --[[vim.keymap.set('n', '<leader>a', function()
      builtin.current_buffer_fuzzy_find({
        sorter = require('telescope.sorters').get_fuzzy_file({})
      })
    end, opts)]]

    vim.keymap.set('n', '<leader>l', function()
      builtin.live_grep({
        search_dirs = { "%:p" },
        path_display = "hidden"
      })
    end, opts)

    vim.keymap.set('n', '<leader>t', function()
      telescope.extensions.file_browser.file_browser()
    end, opts)
    vim.keymap.set('n', '<leader>c', function()
      telescope.extensions.file_browser.file_browser({
        path = "%:p:h"
      })
    end, opts)
    vim.keymap.set('n', '<leader>f', builtin.find_files, opts)
    vim.keymap.set('n', '<leader>b', builtin.buffers, opts)
    vim.keymap.set('n', '<leader>g', builtin.live_grep, opts)
    vim.keymap.set('n', '<leader>m', builtin.keymaps, opts)
  end
}
