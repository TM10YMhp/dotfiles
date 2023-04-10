vim.cmd("autocmd!")

vim.opt.mouse = ""
vim.opt.matchpairs = ""
vim.opt.eventignore:append("CursorMovedI")
vim.opt.clipboard:prepend { "unnamed", "unnamedplus" }

vim.cmd('filetype plugin indent off')
--vim.cmd('filetype indent on') --polyglot - equal sign(=)

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.compatible = false
vim.opt.shortmess:append("IF")

vim.opt.formatoptions = "cqj"
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
--vim.opt.fillchars = "lastline: "

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
vim.opt.pumheight = 0
vim.opt.cmdheight = 1
vim.opt.ruler = false
vim.opt.rulerformat = [[%l:%c%V|%L]]
vim.opt.foldmethod = "manual"
vim.opt.foldenable = false
vim.opt.complete = "."
--vim.opt.completeopt = "menu,menuone,noinsert,noselect,preview"
vim.opt.completeopt = "menu"
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
vim.opt.hlsearch = false
vim.opt.cursorline = false
vim.opt.cursorlineopt = "number"
vim.opt.termguicolors = false
vim.opt.background = "dark"

vim.cmd('syntax on')
vim.cmd('colorscheme custom')
vim.cmd([[match Error /\s\+$/]])
