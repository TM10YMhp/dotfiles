if vim.g.colors_name then
  vim.cmd("hi clear")
end

vim.g.colors_name = "serene"

local groups = {
  Normal = {},
  NormalFloat = { link = "Normal" },
  NonText = {},
  Conceal = {},
  Comment = { ctermfg = "gray" },
  TabLine = {},
  TabLineSel = {},
  TabLineFill = { link = "Comment" },
  Constant = {},
  Identifier = {},
  Statement = {},
  PreProc = {},
  Type = {},
  Special = {},
  Underlined = {},
  Ignore = {},
  Todo = {},
  WildMenu = {},
  StatusLine = {},
  StatusLineNC = { link = "Comment" },
  StatusLineTerm = { link = "StatusLine" },
  StatusLineTermNC = { link = "StatusLineNC" },
  IncSearch = { ctermfg = "darkyellow" },
  Search = { ctermfg = "blue" },
  LineNr = {},
  CursorLineNr = { reverse = true },
  CursorLine = {},
  FoldColumn = { link = "LineNr" },
  Folded = { link = "LineNr" },
  Visual = { reverse = true },
  VisualNOS = { link = "Visual" },
  Pmenu = { reverse = true },
  PmenuSel = {},
  PmenuSbar = {},
  PmenuThumb = { reverse = true },
  ColorColumn = { reverse = true },
  SignColumn = {},
  MatchParen = { reverse = true },
  Title = {},
  Directory = {},
  SpecialKey = {},
  DiffDelete = { ctermfg = "red" },
  DiffAdd = { ctermfg = "lightgreen" },
  DiffChange = { ctermfg = "darkyellow" },
  DiffText = { ctermfg = "cyan" },
  DiagnosticError = {},
  DiagnosticWarn = {},
  DiagnosticInfo = {},
  DiagnosticHint = {},
  DiagnosticOk = {},
  TelescopeSelection = {},
  TelescopeMatching = { link = "Comment" },
}

for group, hl in pairs(groups) do
  vim.api.nvim_set_hl(0, group, hl)
end
