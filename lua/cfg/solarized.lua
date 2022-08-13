vim.g.NeoSolarized_italics = 1 -- 0 or 1
vim.g.NeoSolarized_lineNr = 0 -- 0 or 1 (default) -> To Show backgroung in LineNr

vim.cmd [[
    try
    colorscheme NeoSolarized
    catch /^Vim\%((\a\+)\)\=:E18/
    colorscheme default
    set background=dark
    endtry
    highlight FloatBorder guibg=NONE ctermbg=NONE  " Removes the border of float menu (LSP and Autocompletion uses it)
    highlight link NormalFloat Normal 
    highlight NormalFloat ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE 
    highlight Pmenu ctermbg=NONE guibg=NONE 
]]
