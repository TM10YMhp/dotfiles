local cmp_kinds = {
  Text = 'v',
  Method = 'f',
  Function = 'f',
  Constructor = 'f',
  Field = 'm',
  Variable = 'v',
  Class = 'C',
  Interface = 'I',
  Module = 'M',
  Property = 'm',
  Unit = 'U',
  Value = 'v',
  Enum = 'E',
  Keyword = 'k',
  Snippet = 'S',
  Color = 'v',
  File = 'F',
  Reference = 'r',
  Folder = 'F',
  EnumMember = 'm',
  Constant = 'v',
  Struct = 'S',
  Event = 'E',
  Operator = 'O',
  TypeParameter = 'T',
}

return {
  "hrsh7th/nvim-cmp",
  event = "VeryLazy",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "L3MON4D3/LuaSnip",
  },
  config = function ()
    local cmp = require'cmp'
    local luasnip = require 'luasnip'

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      formatting = {
        fields = { "abbr", "kind" },
        format = function(_, vim_item)
          --vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
          --vim_item.abbr = vim_item.abbr:match("[^(]+")
          vim_item.kind = cmp_kinds[vim_item.kind] or ""
          return vim_item
        end
      },
      sorting = {
        comparators = {
          --cmp.config.compare.length,
        },
      },
      mapping = cmp.mapping.preset.insert({
        --['<C-Space>'] = cmp.mapping.complete(),
        --['<BS>'] = cmp.mapping.close(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item({
          behavior = cmp.SelectBehavior.Select
        }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({
          behavior = cmp.SelectBehavior.Select
        })
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        },{
        {
          name = 'buffer',
          --max_item_count = 4
          option = {
            --keyword_pattern = [[\k\+]]
          },
        },
      }),
      completion = {
        --keyword_length = 1,
        --autocomplete = false
      },
      window = {
        --completion = { border = "single" },
        --documentation = cmp.config.disable
        --documentation = cmp.config.window.bordered()
        --documentation = {
        --  border = "single",
        --  max_width = 45,
        --  max_height = 25,
        --}
      },
      performance = {
        debounce = 100,
        throttle = 100,
        fetching_timeout = 100,
      },
      matching = {
        disallow_fuzzy_matching = true,
        disallow_prefix_unmatching = true,
        disallow_partial_matching = true,
      }
    })
  end
}
