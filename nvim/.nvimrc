" XXX TODO WTF FIXME NOTE REVIEW BUG ERROR BROKEN HACK

set number
set ruler
call pathogen#infect('~/.nvim/bundle/{}')
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
inoremap $ $$<left>
inoremap $$ $$

colorscheme hybrid "256-grayvim
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
filetype plugin indent on


syntax enable
syntax on

set completeopt=longest,menuone,preview

set wildmode=longest,list,full
set wildmenu

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

nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
nnoremap <Leader>s :set spell!<CR>
nnoremap <Leader>b :bnext<CR>

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

set background=dark
au BufWinEnter * let w:m1=matchadd('Error', 'BROKEN\|WTF\|ERROR', -1)
au BufWinEnter * let w:m1=matchadd('Todo', 'HACK\|BUG\|REVIEW\|FIXME\|TODO\|NOTE', -1)

set cursorline

hi CursorLine   cterm=underline ctermbg=59
hi CursorColumn cterm=NONE ctermbg=green

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

" Jedi vimsettings
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "top"
autocmd FileType python setlocal completeopt-=preview
