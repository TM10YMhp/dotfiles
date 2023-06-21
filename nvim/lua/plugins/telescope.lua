return {
  "nvim-telescope/telescope.nvim",
  event = "BufEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function ()
    vim.api.nvim_set_hl(0, 'TelescopeSelection', {})

    local augroup = vim.api.nvim_create_augroup('tm10ymhp', {clear = true})
    vim.api.nvim_create_autocmd('ColorScheme', {
      group = augroup,
      desc = 'Clear TelescopeSelection',
      callback = function()
        vim.api.nvim_set_hl(0, 'TelescopeSelection', {})
      end
    })

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
              -- https://github.com/nvim-telescope/telescope.nvim/issues/1048
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
        lsp_references = {
          layout_strategy = 'vertical',
          path_display = { tail = true },
          preview = { hide_on_startup = false },
          jump_type = 'never',
          show_line = false,
        },
        lsp_type_definitions = {
          layout_strategy = 'vertical',
          path_display = { tail = true },
          preview = { hide_on_startup = false },
          jump_type = 'never',
          show_line = false,
        },
        lsp_dynamic_workspace_symbols = {
          layout_strategy = 'vertical',
          path_display = { tail = true },
        },
        colorscheme = { enable_preview = true },
        current_buffer_fuzzy_find = {
          sorter = require('telescope.sorters').get_substr_matcher({})
        },
        keymaps = {
          modes = { "", "n", "v", "s", "x", "o", "!", "i", "l", "c", "t" }
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

    vim.keymap.set('n', '<leader>t', '<cmd>Telescope file_browser<cr>', {
      desc = 'Telescope: Explorer (rood dir)'
    })

    vim.keymap.set('n', '<leader>T', '<cmd>Telescope file_browser path=%:p:h<cr>', {
      desc = 'Telescope: Explorer (cwd)'
    })

    vim.keymap.set('n', '<leader>k', function()
      builtin.keymaps({
        show_plug = false,
        layout_config = { width = 75 }
      })
    end, { desc = 'Telescope: Key Maps' })

    vim.keymap.set('n', '<leader>uc', builtin.colorscheme, {
      desc = 'Telescope: Colorscheme preview'
    })
    vim.keymap.set('n', '<leader>f', builtin.find_files, {
      desc = 'Telescope: Find Files'
    })
    vim.keymap.set('n', '<leader>b', builtin.buffers, {
      desc = 'Telescope: Buffers'
    })
    vim.keymap.set('n', '<leader>/', builtin.live_grep, {
      desc = 'Telescope: Grep'
    })
    vim.keymap.set('n', '<leader>w', builtin.current_buffer_fuzzy_find, {
      desc = 'Telescope: Search Word'
    })

    vim.keymap.set('n', '<leader>D', builtin.diagnostics, {
      desc = 'Telescope: Workspace Diagnostics'
    })
    vim.keymap.set('n', '<leader>d', '<cmd>Telescope diagnostics bufnr=0<cr>', {
      desc = 'Telescope: Document Diagnostics'
    })
    vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {
      desc = 'Telescope: Goto Definitions'
    })
    vim.keymap.set('n', '<leader>gt', builtin.lsp_type_definitions, {
      desc = 'Telescope: Goto Type Definitions'
    })
    vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {
      desc = 'Telescope: Goto References'
    })
    vim.keymap.set('n', '<leader>gs', builtin.lsp_document_symbols, {
      desc = 'Telescope: Goto Symbols'
    })
    vim.keymap.set('n', '<leader>gS', builtin.lsp_dynamic_workspace_symbols, {
      desc = 'Telescope: Goto Symbols (workspace)'
    })
  end
}
