vim.cmd("autocmd!")

vim.opt.mouse = ""

if vim.fn.has('clipboard') == 1 then
  vim.opt.clipboard:prepend { "unnamed", "unnamedplus" }
end

vim.cmd('filetype plugin indent off')
--vim.cmd('filetype indent on') --polyglot - equal sign(=)

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.compatible = false
vim.opt.shortmess:append("IF")
vim.opt.diffopt:append("horizontal,foldcolumn:0")

vim.opt.formatoptions = "cqjw"
vim.opt.wildignore:append({ '**/node_modules/**', '**/.git/**' })
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.list = false
vim.opt.listchars:append({
  eol = '¬',
  nbsp = '+',
  space = ' ',
  trail = '╱',
  tab = '→ ',
  extends = '»',
  precedes = '«'
})
vim.opt.fillchars = "fold: "

vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.backup = false

--vim.cmd('set nottyfast')
vim.opt.lazyredraw = true
vim.opt.history = 100
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.timeout = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100

vim.opt.title = false
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.number = true
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.pumheight = 12
vim.opt.cmdheight = 1
vim.opt.rulerformat = [[%l:%c%V|%L]]
vim.opt.ruler = false

custom_fold_text = function()
  local line = vim.fn.getline(vim.v.foldstart)
  local line_count = vim.v.foldend - vim.v.foldstart +1
  local _, i = string.find(line, '%S')
  local fill_char = " "
  return fill_char:rep(i-1) .. "... (" .. line_count .. ")"
end
vim.opt.foldtext = 'v:lua.custom_fold_text()'
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.foldopen:remove("hor")

vim.opt.complete = "."
vim.opt.completeopt = "menu,menuone,noinsert,noselect"
vim.opt.hidden = false

vim.opt.cindent = false
vim.opt.indentexpr = ""
vim.opt.autoindent = true
vim.opt.smartindent = false
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.textwidth = 80
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showmatch = false
vim.opt.matchtime = 3
vim.opt.regexpengine = 0
vim.opt.startofline = false
vim.opt.spell = false
vim.opt.signcolumn = "yes"

vim.opt.incsearch = true
vim.opt.inccommand = ""
vim.opt.synmaxcol = 150
vim.opt.belloff = "all"
vim.opt.hlsearch = true
vim.opt.cursorline = false
vim.opt.cursorlineopt = "number"
vim.opt.termguicolors = false
vim.opt.background = "dark"

vim.cmd('syntax on')
vim.cmd([[match Error /\s\+$/]])
