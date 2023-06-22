return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function ()
    vim.api.nvim_set_hl(0, 'TelescopeSelection', {})
    vim.api.nvim_set_hl(0, 'TelescopeMatching', { link = "Comment" })

    local augroup = vim.api.nvim_create_augroup('tm10ymhp', { clear = true })
    vim.api.nvim_create_autocmd('ColorScheme', {
      group = augroup,
      desc = 'Clear TelescopeSelection',
      callback = function()
        vim.api.nvim_set_hl(0, 'TelescopeSelection', {})
        vim.api.nvim_set_hl(0, 'TelescopeMatching', { link = "Comment" })
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
        autocommands = { layout_strategy = 'vertical' },
        help_tags = { layout_strategy = 'vertical' },
        colorscheme = { enable_preview = true },
        keymaps = {
          modes = { "", "n", "v", "s", "x", "o", "!", "i", "l", "c", "t" }
        }
      },
      extensions = {
        file_browser = {
          hidden = true,
          hijack_netrw = true,
          file_ignore_patterns = nil,
        },
        fzf = {
          fuzzy = false,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case"
        }
      }
    })

    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")

    local builtin = require("telescope.builtin")

    vim.keymap.set('n', '<leader>et', '<cmd>Telescope file_browser<cr>', {
      desc = 'Explorer'
    })

    vim.keymap.set('n', '<leader>eT', '<cmd>Telescope file_browser path=%:p:h<cr>', {
      desc = 'Explorer (cwd)'
    })

    vim.keymap.set('n', '<leader>ek', function()
      builtin.keymaps({
        show_plug = false,
        layout_config = { width = 75 }
      })
    end, { desc = 'Key Maps' })

    vim.keymap.set('n', '<leader>uc', builtin.colorscheme, {
      desc = 'Colorscheme with preview'
    })
    vim.keymap.set('n', '<leader>ef', builtin.find_files, {
      desc = 'Find Files'
    })
    vim.keymap.set('n', '<leader>eF', '<cmd>Telescope find_files cwd=%:p:h<cr>', {
      desc = 'Find Files (cwd)'
    })
    vim.keymap.set('n', '<leader>eb', builtin.buffers, {
      desc = 'Buffers'
    })
    vim.keymap.set('n', '<leader>eg', builtin.live_grep, {
      desc = 'Grep'
    })
    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {
      desc = 'Search Word'
    })
    vim.keymap.set('n', '<leader>ea', builtin.autocommands, {
      desc = 'Autocommands'
    })
    vim.keymap.set('n', '<leader>eh', builtin.help_tags, {
      desc = 'Help Pages'
    })
    vim.keymap.set('n', '<leader>eH', builtin.highlights, {
      desc = 'Highlight Groups'
    })

    vim.keymap.set('n', '<leader>cD', builtin.diagnostics, {
      desc = 'Workspace Diagnostics'
    })
    vim.keymap.set('n', '<leader>cd', '<cmd>Telescope diagnostics bufnr=0<cr>', {
      desc = 'Document Diagnostics'
    })
    vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {
      desc = 'Goto Definitions'
    })
    vim.keymap.set('n', '<leader>gt', builtin.lsp_type_definitions, {
      desc = 'Goto Type Definitions'
    })
    vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {
      desc = 'Goto References'
    })
    vim.keymap.set('n', '<leader>gs', builtin.lsp_document_symbols, {
      desc = 'Goto Symbols'
    })
    vim.keymap.set('n', '<leader>gS', builtin.lsp_dynamic_workspace_symbols, {
      desc = 'Goto Symbols (workspace)'
    })
  end
}
