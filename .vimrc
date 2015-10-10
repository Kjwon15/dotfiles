set nocompatible
colo desert
se nu
se ru
se sw=4
se sts=4
se ts=8
se et
se ai
se cin
set smartindent
syntax on
set noeol
set nobackup
set hlsearch
set incsearch " 순간검색
set ignorecase
set smartcase " 대문자로 검색하면 구분 함
set noea "창을 나눌 때 똑같이 만들지 않음.
set mouse=a "마우스 사용 가능
set autoread "외부에서 변경시 자동 읽기
set ve=onemore "줄 끝까지 커서 이동 가능
set modeline
set modelines=5
set autochdir
set showcmd
set wildmenu
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'toggle'

Plug 'rking/ag.vim'
Plug 'airblade/vim-gitgutter'
au VimEnter *
            \ hi clear SignColumn |
            \ hi clear LineNr |
            \ hi GitGutterAdd ctermfg=2 |
            \ hi GitGutterDelete ctermfg=1 |
            \ hi GitGutterChange ctermfg=3
Plug 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
let g:solarized_termtrans=1
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings=1
nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>
nnoremap <silent> <C-w>w :TmuxNavigatePrevious<cr>

inoremap <silent> <C-w>h <esc>:TmuxNavigateLeft<cr>
inoremap <silent> <C-w>j <esc>:TmuxNavigateDown<cr>
inoremap <silent> <C-w>k <esc>:TmuxNavigateUp<cr>
inoremap <silent> <C-w>l <esc>:TmuxNavigateRight<cr>
inoremap <silent> <C-w>w <esc>:TmuxNavigatePrevious<cr>
Plug 'ciaranm/detectindent'
au BufRead * DetectIndent
Plug 'mattn/emmet-vim', { 'for': ['xml', 'html', 'css']} " HTML zencoding.
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

call plug#end()



set list
set lcs=tab:↹\ ,trail:.,extends:>,precedes:<

au filetype python setlocal cc=80
au filetype javascript setlocal sw=2 sts=2

"Spell check
au filetype gitcommit setlocal spell textwidth=72 | nnoremap <C-]> 1z=``
autocmd BufRead,BufNewFile *.md,*.rst setlocal spell | nnoremap <C-]> 1z=``


"Scroll before edge
set scrolloff=10

set fencs=utf-8,cp949,euc-kr


map <C-S> :w<cr>
imap <C-s> <esc>:w<cr>i

map <C-J> <C-W>-
map <C-K> <C-W>+
map <C-H> <C-W><
map <C-L> <C-W>>
imap <C-J> <esc><C-W>-i
imap <C-K> <esc><C-W>+i
imap <C-H> <esc><C-W><i
imap <C-L> <esc><C-W>>i

"Up and Down for wrapped lines
nnoremap j gj
nnoremap k gk

"Jump to start and end of line
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

"Force saving root permimssion file
cnoremap w!! %!sudo tee > /dev/null %

"Clear search highlights
nnoremap <silent><leader>/ :nohls<cr>
"When syntax highlight malfunctioning
nnoremap <silent><leader>' :syntax sync fromstart<cr>

"insert one charactor
nnoremap <space> i_<esc>r
"indent all of files
nmap <leader>g gg=G``
" Insert one line
nnoremap <cr> o<esc>


if filereadable('Makefile')
  au Filetype c setlocal makeprg=make
else
  au FileType c setlocal makeprg=gcc\ -o\ %<\ %
    au FileType python setlocal makeprg=python\ -i\ %
endif
au FileType html setlocal sw=2


" set cursor to the last worked line
set viewoptions=cursor
au BufWinLeave *.c,*.cc,*.h,*.html,*.php,Makefile,*.py,*.sh mkview
au BufWinEnter *.c,*.cc,*.h,*.html,*.php,Makefile,*.py,*.sh loadview
" ---

if has("gui_running")
    colo solarized
    set lines=60 columns=100
    set background=light
else
    set background=dark
endif

" for macvim
if has("gui_macvim")
  set guifont=source\ code\ pro\ semibold:h12
  set transparency=15
  set imd
endif

" for gvim
if has("gui_gtk2")
  set guifont=Source\ Code\ Pro\ Semi-Bold\ 11
endif
