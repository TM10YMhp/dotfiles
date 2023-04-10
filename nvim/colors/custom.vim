" Generated with RNB (https://github.com/romainl/vim-rnb)
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "custom"

hi Normal           NONE
hi NormalFloat      NONE
hi NonText          NONE
hi Comment          NONE cterm=italic

if has("win32")
  hi Comment NONE ctermfg=gray
endif

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

hi IncSearch        NONE cterm=reverse
hi Search           NONE cterm=reverse

hi LineNr           NONE
hi CursorLineNr     NONE cterm=reverse
hi CursorLine       NONE

hi FoldColumn NONE
hi Folded     NONE
hi! link FoldColumn LineNr
hi! link Folded     LineNr

hi Visual      NONE cterm=reverse
hi! link VisualNOS Visual

hi Pmenu       NONE
hi PmenuSel    NONE cterm=reverse
hi PmenuSbar   NONE
hi PmenuThumb  NONE cterm=reverse

hi! link BufTabLineActive TabLineSel

hi ColorColumn NONE cterm=reverse
hi SignColumn  NONE

hi MatchParen  NONE cterm=reverse
hi Title       NONE
hi Directory   NONE
hi SpecialKey  NONE

hi DiffDelete NONE ctermfg=1
hi DiffAdd    NONE ctermfg=2
hi DiffChange NONE ctermfg=3
hi DiffText NONE ctermfg=3 cterm=underline

hi DiagnosticError NONE
hi DiagnosticWarn  NONE
hi DiagnosticInfo  NONE
hi DiagnosticHint  NONE
hi DiagnosticOk    NONE
