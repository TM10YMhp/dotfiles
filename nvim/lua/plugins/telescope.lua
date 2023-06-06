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
          height = { 0.9, max = 30 },
          preview_cutoff = 0,
          prompt_position = "top",
          horizontal = {
            preview_width = 0.6,
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
          layout_config = { mirror = true },
          path_display = { tail = true },
          preview = { hide_on_startup = false }
        },
        lsp_definitions = {
          path_display = { tail = true },
          preview = { hide_on_startup = false },
          jump_type = 'never',
          show_line = false,
        },
        --current_buffer_fuzzy_find = {
        --  sorter = require('telescope.sorters').get_substr_matcher({})
        --  sorter = require('telescope.sorters').get_fuzzy_file({})
        --}
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
    local opts = { noremap = true, silent = true }
    local function set_desc(desc)
      return vim.tbl_extend('force', opts, { desc = desc })
    end

    vim.keymap.set('n', '<leader>t', function()
      telescope.extensions.file_browser.file_browser()
    end, set_desc('file_browser'))

    vim.keymap.set('n', '<leader>c', function()
      telescope.extensions.file_browser.file_browser({ path = "%:p:h" })
    end, set_desc('file_browser in current path'))

    vim.keymap.set('n', '<leader>l', function()
      builtin.live_grep({
        search_dirs = { "%:p" },
        path_display = "hidden"
      })
    end, set_desc('live_grep in current file'))

    vim.keymap.set('n', '<leader>m', function()
      builtin.keymaps({
        show_plug = false,
        layout_config = { width = 75 }
      })
    end, set_desc('keymaps'))

    vim.keymap.set('n', '<leader>f', builtin.find_files, set_desc('find_files'))
    vim.keymap.set('n', '<leader>b', builtin.buffers, set_desc('buffers'))
    vim.keymap.set('n', '<leader>g', builtin.live_grep, set_desc('live_grep'))

    vim.keymap.set('n', '<leader>d', builtin.lsp_definitions, set_desc('definitions'))
    vim.keymap.set('n', '<leader>p', builtin.diagnostics, set_desc('diagnostics'))

    -- vim.keymap.set('n', '<leader>a', builtin.current_buffer_fuzzy_find, opts)
  end
}
