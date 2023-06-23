" Generated with RNB (https://github.com/romainl/vim-rnb)
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "custom"

hi Normal           NONE
hi NormalFloat      NONE
hi! link NormalFloat Normal
hi NonText          NONE
hi Comment          NONE ctermfg=darkgreen

hi TabLine     NONE
hi! link TabLine Comment
hi TabLineSel  NONE
hi TabLineFill NONE

hi Conceal          NONE cterm=underline

hi Constant         NONE
hi Identifier       NONE
hi Statement        NONE
hi PreProc          NONE
hi Type             NONE
hi Special          NONE

hi Underlined       NONE
hi Ignore           NONE
hi Todo             NONE

hi WildMenu         NONE

hi StatusLine       NONE
hi StatusLineNC     NONE
hi! link StatusLineNC Comment

hi StatusLineTerm   NONE
hi StatusLineTermNC NONE
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC

hi IncSearch        NONE ctermfg=darkyellow
hi Search           NONE ctermfg=blue

hi LineNr           NONE
hi CursorLineNr     NONE cterm=reverse
hi CursorLine       NONE

hi FoldColumn NONE
hi Folded     NONE
hi! link FoldColumn LineNr
hi! link Folded     LineNr

hi Visual      NONE cterm=reverse
hi! link VisualNOS Visual

hi Pmenu       NONE cterm=reverse
hi PmenuSel    NONE
hi PmenuSbar   NONE
hi PmenuThumb  NONE cterm=reverse

hi! link BufTabLineActive TabLineSel

hi ColorColumn NONE cterm=reverse
hi SignColumn  NONE

hi MatchParen  NONE cterm=reverse
hi Title       NONE
hi Directory   NONE
hi SpecialKey  NONE

hi DiffDelete NONE ctermfg=red
hi DiffAdd    NONE ctermfg=lightgreen
hi DiffChange NONE ctermfg=darkyellow
hi DiffText   NONE ctermfg=cyan

hi DiagnosticError NONE
hi DiagnosticWarn  NONE
hi DiagnosticInfo  NONE
hi DiagnosticHint  NONE
hi DiagnosticOk    NONE
