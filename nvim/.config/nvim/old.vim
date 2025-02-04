" let g:ackprg = 'ag --vimgrep'
" set grepprg=ag\ --vimgrep
" set grepprg=ag\ --vimgrep\ --smart-case\ --hidden\ --follow
" https://www.reddit.com/r/vim/comments/bmh977/automatically_open_quickfix_window_after/
" function! Grep(...)
"     return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
" endfunction
" command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
" command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)
" cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
" cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'
" augroup quickfix
"     autocmd!
"     autocmd QuickFixCmdPost cgetexpr cwindow
"     autocmd QuickFixCmdPost lgetexpr lwindow
" augroup END
