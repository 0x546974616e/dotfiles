
local colorscheme = true

-- https://github.com/chriskempson/base16-vim
if (colorscheme) then
  vim.cmd([[
    if (has("termguicolors"))
      set termguicolors
      colorscheme base16-tomorrow-night-eighties
      highlight Comment guifg=#56a64a ctermfg=2
      highlight NonText guifg=#555555 ctermfg=8
    endif
  ]])
end

