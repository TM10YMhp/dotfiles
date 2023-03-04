--control character
--[[vim.g.modes = {
  ['n']     = 'NORMAL',
  ['no']    = 'O-PENDING',
  ['nov']   = 'O-PENDING',
  ['noV']   = 'O-PENDING',
  ['no\22'] = 'O-PENDING',
  ['niI']   = 'NORMAL',
  ['niR']   = 'NORMAL',
  ['niV']   = 'NORMAL',
  ['nt']    = 'NORMAL',
  ['ntT']   = 'NORMAL',
  ['v']     = 'VISUAL',
  ['vs']    = 'VISUAL',
  ['V']     = 'V-LINE',
  ['Vs']    = 'V-LINE',
  ['\22']   = 'V-BLOCK',
  ['\22s']  = 'V-BLOCK',
  ['s']     = 'SELECT',
  ['S']     = 'S-LINE',
  ['\19']   = 'S-BLOCK',
  ['i']     = 'INSERT',
  ['ic']    = 'INSERT',
  ['ix']    = 'INSERT',
  ['R']     = 'REPLACE',
  ['Rc']    = 'REPLACE',
  ['Rx']    = 'REPLACE',
  ['Rv']    = 'V-REPLACE',
  ['Rvc']   = 'V-REPLACE',
  ['Rvx']   = 'V-REPLACE',
  ['c']     = 'COMMAND',
  ['cv']    = 'EX',
  ['ce']    = 'EX',
  ['r']     = 'REPLACE',
  ['rm']    = 'MORE',
  ['r?']    = 'CONFIRM',
  ['!']     = 'SHELL',
  ['t']     = 'TERMINAL',
}]]
vim.g.min_modes = {
  ['n']     = 'N',
  ['no']    = 'N',
  ['nov']   = 'N',
  ['noV']   = 'N',
  ['no\22'] = 'N',
  ['niI']   = 'N',
  ['niR']   = 'N',
  ['niV']   = 'N',
  ['nt']    = 'N',
  ['ntT']   = 'N',
  ['v']     = 'V',
  ['vs']    = 'V',
  ['V']     = 'V',
  ['Vs']    = 'V',
  ['\22']   = 'V',
  ['\22s']  = 'V',
  ['s']     = 'S',
  ['S']     = 'S',
  ['\19']   = 'S',
  ['i']     = 'I',
  ['ic']    = 'I',
  ['ix']    = 'I',
  ['R']     = 'R',
  ['Rc']    = 'R',
  ['Rx']    = 'R',
  ['Rv']    = 'V',
  ['Rvc']   = 'V',
  ['Rvx']   = 'V',
  ['c']     = 'C',
  ['cv']    = 'E',
  ['ce']    = 'E',
  ['r']     = 'R',
  ['rm']    = 'M',
  ['r?']    = 'C',
  ['!']     = 'S',
  ['t']     = 'T',
}

--vim.opt.statusline = "%m[%{len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))}]"

vim.g.buflisted = { buflisted = 1 }
vim.opt.statusline = "%m[%{len(getbufinfo(buflisted))}]"
vim.opt.statusline:append(" %{min_modes[v:lua.vim.fn.mode()]}")
vim.opt.statusline:append(" | %t")
vim.opt.statusline:append(" | col:%v/%{strwidth(getline('.'))}")
vim.opt.statusline:append(" | row:%l/%L")
