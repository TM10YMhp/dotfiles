" Generated with RNB (https://github.com/romainl/vim-rnb)
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "custom"

hi Normal           NONE
hi NonText          NONE
hi Comment          NONE cterm=italic

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
hi Error            NONE ctermfg=1

hi WildMenu         NONE

hi StatusLine       NONE cterm=BOLD
hi StatusLineNC     NONE ctermfg=8

hi StatusLineTerm   NONE
hi StatusLineTermNC NONE
hi ErrorMsg NONE
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link ErrorMsg Error

hi ModeMsg          ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi MoreMsg          ctermbg=NONE ctermfg=13   cterm=NONE guibg=NONE guifg=#ff00ff gui=NONE
hi WarningMsg       ctermbg=NONE ctermfg=1  cterm=NONE guibg=NONE guifg=#ff0000 gui=NONE

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

hi TabLine     NONE ctermfg=8
hi TabLineSel  NONE cterm=BOLD
hi TabLineFill NONE

hi Pmenu       NONE
hi PmenuSel    NONE cterm=reverse
hi PmenuSbar   NONE
hi PmenuThumb  NONE cterm=reverse

hi! link BufTabLineActive TabLineSel

"in progress
hi VertSplit        ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi Title            ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi helpLeadBlank    ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi helpNormal       ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi SpecialKey       ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi DiffAdd          ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi DiffChange       ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi DiffDelete       ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi DiffText         ctermbg=3 ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi Directory        ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi MatchParen       ctermbg=NONE ctermfg=10 cterm=reverse guibg=NONE guifg=green gui=reverse
hi SpellBad ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE guisp=#ff0000
hi SpellCap ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE guisp=#0000ff
hi SpellLocal ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE guisp=#ff00ff
hi SpellRare ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE guisp=#00ffff
hi ColorColumn      ctermbg=2  ctermfg=NONE cterm=NONE guibg=#808080 guifg=NONE gui=NONE
hi SignColumn       ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi Question         ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi QuickFixLine     ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi ToolbarLine      ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi ToolbarButton    ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi debugPC          ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi debugBreakpoint  ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
