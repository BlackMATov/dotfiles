﻿" -------------------------------------
" VUNDLE BEGIN
set nocompatible
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
" -------------------------------------

" -------------------------------------
" DEPS
" -------------------------------------

Bundle 'gmarik/Vundle.vim'
Bundle 'xolox/vim-misc'
Bundle 'tpope/vim-dispatch'
Bundle 'Shougo/vimproc.vim'

" -------------------------------------
" COMMON
" -------------------------------------

Bundle 'vim-syntastic/syntastic'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'

Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'jlanzarotta/bufexplorer'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdcommenter'

" -------------------------------------
" NERDTREE
" -------------------------------------

Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Xuyuanp/nerdtree-git-plugin'

" -------------------------------------
" THEMES
" -------------------------------------

Bundle 'bfrg/vim-cpp-modern'
Bundle 'jonathanfilip/vim-lucius'

" -------------------------------------
" BundleMake
" -------------------------------------

if has('unix')
  function! MyBundleInitFunc()
    execute "!(git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim)"
  endfunction
  command! MyBundleInit call MyBundleInitFunc()

  function! MyBundleMakeFunc()
    execute "!(cd $HOME/.vim/bundle/vimproc.vim && make clean && make)"
  endfunction
  command! MyBundleMake call MyBundleMakeFunc()
endif

" -------------------------------------
" VUNDLE END
call vundle#end()
" -------------------------------------

" включаем плагины, выравнивания и синтаксис
filetype plugin indent on
syntax on

" не стоит переводить начальное меню
set langmenu=none

" разрешаем перегружать глобальные настройки
set exrc
set secure

" вырубаем бикалку
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" показ позиции курсора
set ruler
set cursorline
set nocursorcolumn

" мышь в терминале
set mouse=a
set mousehide

" быстрый терминал
set ttyfast
set lazyredraw

" используем системный буфер обмена
set clipboard=unnamed

" убираем менюшки всякие и полосы прокрутки
set guioptions-=T
set guioptions-=m
set guioptions+=lLrRb
set guioptions-=lLrRb
set guioptions+=c

" показывает незавершенные команды в статусбаре
set showcmd

" вкл относительную нумерацию строк
set relativenumber

" выкл перенос строк
set nowrap

" автозачитывание файла после изменения, без вопроса
set autoread

" возможность скрывать буферы не теряя историю undo
set hidden

" удобный поиск
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <Leader><CR> :nohlsearch<CR>

" высота строки набора команд
set cmdheight=1
set laststatus=2

" отступы и табы
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4

" сколько строк оставлять при скроллинге
set scrolloff=4

" цветовая схема
set background=dark
colorscheme lucius

" скрываем фон вертикального разделителя между окнами
exe 'hi! VertSplit ctermbg=NONE guibg=NONE'

" кодировочки
set encoding=utf-8
set termencoding=utf-8

" дополнение команд в менюшке
set wildmenu
set wildmode=longest,full
set wildignorecase

" не нужно показывать превью дополняемого
set completeopt-=preview

" нормальный бекспейс
set backspace=indent,eol,start

" выкл своп файлы
set nobackup
set noswapfile

" показывать имя буфера в заголовке терминала
set title

" Фолдинг
set foldmethod=indent " Фолдинг по отступам
set foldnestmax=10    " Глубина фолдинга 10 уровней
set nofoldenable      " Не фолдить по умолчанию

" хранить больше истории команд
set history=10000
set undofile
set undodir=$HOME/.vim/undodir
set undolevels=10000
set undoreload=10000

" подсветка <>
set showmatch
set matchpairs+=<:>

" Подсвечивать табы и пробелы в конце строки
set list
set listchars=tab:»·,trail:·,extends:$,nbsp:%
nnoremap <silent> <F11> :set list<CR>

" quick search
nnoremap * *N
map <Space> /
map <S-Space> ?

" splits
set splitbelow
set splitright

" -------------------------------------
" move text
" -------------------------------------

nnoremap <silent> <C-J> :m .+1<CR>==
nnoremap <silent> <C-K> :m .-2<CR>==
inoremap <silent> <C-J> <Esc>:m .+1<CR>==gi
inoremap <silent> <C-K> <Esc>:m .-2<CR>==gi
vnoremap <silent> <C-J> :m '>+1<CR>gv=gv
vnoremap <silent> <C-K> :m '<-2<CR>gv=gv

" -------------------------------------
" buffers
" -------------------------------------

nnoremap <Tab>   <C-W>w
nnoremap <S-Tab> <C-W>W

nnoremap <S-Left>  <C-W>h
nnoremap <S-Right> <C-W>l
nnoremap <S-Down>  <C-W>j
nnoremap <S-Up>    <C-W>k

" -------------------------------------
" syntastic
" -------------------------------------

let g:syntastic_c_config_file = '.clang_complete'
let g:syntastic_cpp_config_file = '.clang_complete'

" -------------------------------------
" nerdtree
" -------------------------------------

map <Leader>n :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDTreeGitStatusIndicatorMapCustom={
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "?",
    \ "Renamed"   : "~",
    \ "Unmerged"  : "#",
    \ "Deleted"   : "!",
    \ "Dirty"     : "*",
    \ "Clean"     : "&",
    \ "Unknown"   : "?"}

" -------------------------------------
" vim-airline
" -------------------------------------

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='bubblegum'

let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#whitespace#enabled=0

" -------------------------------------
" clever tab
" -------------------------------------

function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
