" XXX

set number
set ruler
call pathogen#infect('~/.vim/bundle/{}')
filetype plugin indent on
syntax enable
syntax on
set backspace=indent,eol,start
set ai
set si
set wrap
set confirm
set mouse=a
set lbr
set shiftwidth=4
set tabstop=4
set pastetoggle=<F10>
inoremap {	{}<left>
inoremap {<CR>	{<CR>}<Esc>O
inoremap {{	{
inoremap {}	{}
inoremap (	()<left>
inoremap (<CR>	(<CR>)<Esc>O
inoremap ((	(
inoremap ()	()
inoremap [	[]<left>
inoremap [<CR>	[<CR>]<Esc>O
inoremap [[	[
inoremap []	[]
inoremap "	""<left>
inoremap ""	"
inoremap '	''<left>
inoremap ''	'
inoremap /*<CR>	/*<CR>*/<ESC>O
inoremap /* /**/<left><left>

let g:solarized_termtrans = 1
colorscheme hybrid "wombat256mod 256-grayvim
set background=dark
set hidden
set linebreak
set hlsearch
set incsearch
set wrapscan
set expandtab
set softtabstop=4
set t_Co=256
set copyindent
set history=1000
set laststatus=2
set pastetoggle=<F3>
set textwidth=80
set timeoutlen=200
set foldmethod=marker
set foldnestmax=4
filetype indent on

set completeopt=longest,menuone,preview

set wildmode=longest,list,full
set wildmenu

set clipboard=unnamedplus

" backup

set backup
set backupdir=$HOME/.vim/backup//
set backupdir+=.

if !isdirectory($HOME . '/.vim/backup/')
    call mkdir($HOME . '/.vim/backup/')
endif

set undofile
set undodir=$HOME/.vim/backup/undo//
set undodir+=.
set undolevels=1000
set undoreload=10000

if !isdirectory($HOME . '/.vim/backup/')
    call mkdir($HOME . './vim/backup/')
endif

" spellcheck
" set spell
set spelllang=en
set spellfile=$HOME/Dropbox/vim/spell/en.utf-8.add

set sessionoptions-=options
set sessionoptions-=folds

set cursorline

hi CursorLine   cterm=underline ctermbg=59
hi CursorColumn cterm=NONE ctermbg=green

nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
nnoremap <Leader>s :set spell!<CR>
nnoremap <Leader>b :bnext<CR>

function EnterWord()
    if !exists('#Sentence#InsertCharPre')
        augroup Sentence
            autocmd InsertCharPre * if search('\v(%^|[.!?\n]\_s)\_s*%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif
        augroup END
    else
        augroup Sentence
            autocmd!
        augroup END
    endif

    set spell!
endfunction

" word mode!!
nnoremap <Leader>w :call EnterWord()<CR>

" autocommands
autocmd BufWritePost,FileWritePost *.tex :silent !pdflatex -interaction=nonstopmode % &> /dev/null

" Chesley's word counter!

set runtimepath+=$HOME/.vim/bundle/wordCount.vim 

" Status line madness
set statusline=[%n]\    " buffer number
set statusline+=%.30F\   " Full filepath
set statusline+=%y\    " Filetype
set statusline+=[%{strlen(&fenc)?&fenc:'none'},\  " File encoding
set statusline+=%{&ff}] " file format
" set statusline+=%h  " help file flag
set statusline+=\ %m  " Modified flag
set statusline+=%r  " RO flag
set statusline+=\[%{strftime('%Y/%b/%d\ %a\ %I:%M\ %p')}\]
" set statusline+=\ Char:\ 0x%04B  " current character
set statusline+=%= " Seperator
set statusline+=\ WordCount:\ %{wordCount#WordCount()},  " Word counter
set statusline+=%c, " cursor column
set statusline+=%l/%L   " cursor line/total line
set statusline+=\ %P    " % through 

" Calculators!
inoremap <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

tnoremap <ESC> <C-\><C-n><CR>

" vim notes config
let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.txt'
let g:notes_ruler_text = 1

" NERDTree config
autocmd vimenter * NERDTree

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir="~/.nvim/UltiSnips"

let g:syntastic_cpp_compiler='g++'
let g:syntastic_cpp_compiler_options=' -std=c++11'
