" set vim to chdir for each file
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" Todo: tabularize


" Visual shifting (does not exit Visual mode), allowing you to do it multiple
" times.
vnoremap < <gv
vnoremap > >gv

"spf13
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

set wrap "lbr                   " Wrap long lines, lbr=around words not mid-word.
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=8                " Use indents of 8 spaces
set noexpandtab                 " Tabs are tabs, not spaces
set tabstop=8                   " An indentation every four columns
set softtabstop=8               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

set showmode                    " Display the current mode
set cursorline                  " Highlight current line

set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator

set mouse=                  " Disable mouse
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8
set background=light

set signcolumn=yes " Force signcolumn on.


noremap L :tabn<CR>
noremap H :tabp<CR>

set backupdir=~/.vimbackup/
set directory=~/.vimswap/
set undodir=~/.vimundo/
set viewdir=~/.vimviews/
"set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set foldmethod=indent

noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

"execute pathogen#infect()

" Nvim
set wildmode=longest,list   " get bash-like tab completions
set cc=120                  " set an 80 column border for good coding style

call plug#begin()
	" Enable copilot
	Plug 'https://github.com/github/copilot.vim'
	" select and then ,c will comment the selection
	Plug 'https://github.com/terrortylor/nvim-comment'
	" Allows you to do a visual selection and then :Tabularize/<CHR> and
	" it will align based on those.
	Plug 'https://github.com/godlygeek/tabular'
	" Plug 'https://github.com/mileszs/ack.vim'
	Plug 'https://github.com/rickhowe/diffchar.vim'
	Plug 'https://github.com/neovim/nvim-lspconfig.git'
call plug#end()

" let g:ackprg = 'ag --vimgrep'
" set grepprg=ag\ --vimgrep
set grepprg=ag\ --vimgrep\ --smart-case\ --hidden\ --follow


" https://www.reddit.com/r/vim/comments/bmh977/automatically_open_quickfix_window_after/
function! Grep(...)
    return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction
command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost cgetexpr cwindow
    autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

:lua require('nvim_comment').setup()

let mapleader=","
noremap <leader>c :CommentToggle<CR>

" Restore Cursor Position when re-opening a file.
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Fix commenting in bibtex
au BufRead,BufNewFile *.bib :lua vim.bo.commentstring = '%%s'

" set diffopt+=internal,algorithm:patience
colorscheme hxr
" colorscheme hxrdark

:source /home/user/.config/nvim/main.lua
noremap grn :lua vim.lsp.buf.rename()<CR>
