return {
  "nvim-telescope/telescope.nvim",
  event = "BufEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function ()
    vim.cmd[[ hi TelescopeSelection cterm='none' ]]

    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")
    local action_state = require("telescope.actions.state")

    telescope.setup({
      defaults = {
        preview = { hide_on_startup = true },
        dynamic_preview_title = true,
        prompt_prefix = "",
        color_devicons = false,
        file_ignore_patterns = { ".git", ".class" },
        border = true,
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        sorting_strategy = "ascending",
        path_display = {
          -- shorten = { len = 3, exclude = { 1, -1} },
          truncate = true
        },
        layout_config = {
          width = { 0.7, min = 90 },
          height = 40,
          preview_cutoff = 0,
          prompt_position = "top",
          horizontal = {
            preview_width = 0.6,
          },
          vertical = {
            preview_height = 0.6,
            mirror = true
          }
        },
        vimgrep_arguments = {
          "rg", "--color=never", "--no-heading", "--with-filename",
          "--line-number", "--column", "--smart-case", "--hidden"
        },
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
      },
      pickers = {
        find_files = {
          --theme = "ivy",
          hidden = true,
        },
        diagnostics = {
          layout_strategy = 'vertical',
          path_display = { tail = true },
          preview = { hide_on_startup = false }
        },
        lsp_definitions = {
          layout_strategy = 'vertical',
          path_display = { tail = true },
          preview = { hide_on_startup = false },
          jump_type = 'never',
          show_line = false,
        },
        colorscheme = { enable_preview = true },
        current_buffer_fuzzy_find = {
          -- sorter = require('telescope.sorters').get_substr_matcher({})
          -- sorter = require('telescope.sorters').get_fuzzy_file({})
        }
      },
      extensions = {
        file_browser = {
          hidden = true,
          hijack_netrw = true,
          file_ignore_patterns = nil,
        }
      }
    })

    telescope.load_extension("file_browser")

    local builtin = require("telescope.builtin")

    vim.keymap.set('n', '<leader>t', function()
      telescope.extensions.file_browser.file_browser()
    end, { desc = 'file_browser', noremap = true })

    vim.keymap.set('n', '<leader>T', function()
      telescope.extensions.file_browser.file_browser({ path = "%:p:h" })
    end, { desc = 'file_browser (cwd)', noremap = true })

    vim.keymap.set('n', '<leader>G', function()
      builtin.live_grep({
        search_dirs = { "%:p" },
        disable_coordinates = true,
        path_display = "hidden"
      })
    end, { desc = 'live_grep (cwd)', noremap = true })

    vim.keymap.set('n', '<leader>k', function()
      builtin.keymaps({
        show_plug = false,
        layout_config = { width = 75 },
        modes = { "n", "i", "c", "x", "o", }
      })
    end, { desc = 'keymaps', noremap = true })

    vim.keymap.set('n', '<leader>C', builtin.colorscheme, {
      desc = 'colorscheme preview', noremap = true
    })
    vim.keymap.set('n', '<leader>f', builtin.find_files, {
      desc = 'find_files', noremap = true
    })
    vim.keymap.set('n', '<leader>b', builtin.buffers, {
      desc = 'buffers', noremap = true
    })
    vim.keymap.set('n', '<leader>g', builtin.live_grep, {
      desc = 'live_grep', noremap = true
    })
    vim.keymap.set('n', '<leader>d', builtin.lsp_definitions, {
      desc = 'Definitions', noremap = true
    })
    vim.keymap.set('n', '<leader>x', builtin.diagnostics, {
      desc = 'Diagnostics (Telescope)', noremap = true
    })

    -- vim.keymap.set('n', '<leader>a', builtin.current_buffer_fuzzy_find, {
    --   noremap = true
    -- })
  end
}
