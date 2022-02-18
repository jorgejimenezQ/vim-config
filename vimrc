"=================================================================
"                             vimrc                              "
"=================================================================
"=================================================================
"  Revision  004
"  Modified  Tuesday, 16 February 2021
"=================================================================
set exrc                                " if vimrc in local folder execute it
"=================================================================
" Set the Leader Key {
"=================================================================
let g:mapleader = "\<Space>"            " set leader key
"} ===

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
"set guifont=DroidSansMono\ Nerd\ Font\ 11
"let g:airline_powerline_fonts = 1      " for vim-arline
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			        " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4 softtabstop=4             " Insert 4 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set relativenumber                      " Set relative line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set noswapfile                          " Do not keep swap files
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set noerrorbells
"set nohlsearch                          " Do not keep the search highlighted
"set autochdir                           " Your working directory will always be the same as your working directory
set undodir=~/.vim/undodir              " For undoing history
set undofile
set scrolloff=8                         " Scrol when there are 8 lines left
set colorcolumn=80                      " Visual aid for column 80
set signcolumn=yes                      " Add extra column for diagnostic

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %
" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else
"inoremap jk <Esc>
"inoremap kj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
" use ctr:+hjkl to move between split/vsplit panels
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

"=================================================================
" Vim-Plug Plugin Manager Auto Install {
"=================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    augroup plugmanager
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | q
    augroup end
endif
"} ===


"=================================================================
"= #### Plugin Options #### {
"=================================================================
call plug#begin('~/.vim/bundle')

"=================================================================
" NerdTree to see files in tree mode {
"=================================================================
let g:JV_showEol=1       " Show EOL marker
let g:JV_codePretty = 1  " Show indent guides when
Plug 'john-warnes/jvim'
"} ===



"=================================================================
" NerdTree [Ctrl-B] {
"=================================================================
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
let g:NERDTreeMapOpenInTab  ='<ENTER>'  " Open file in newtab
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen    =1          " close NERDTree after  file is opened
let g:NERDTreeShowHidden    =1          " show hidden files in NERDTree
let g:NERDTreeWinSize       =20
"let g:NERDTreeMapOpenInTab  ='<ENTER>'  " Open file in newtab
let g:NERDTreeMapOpenInTab  =' '  " Open file in newtab
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeIndicatorMapCustom = {
            \ 'Modified'  : '✹',
            \ 'Staged'    : '✚',
            \ 'Untracked' : '✭',
            \ 'Renamed'   : '➜',
            \ 'Unmerged'  : '═',
            \ 'Deleted'   : '✖',
            \ 'Dirty'     : '✗',
            \ 'Clean'     : '✔︎',
            \ 'Ignored'   : '☒',
            \ 'Unknown'   : '?'
            \ }
"} ===

"=================================================================
" Language Support
"=================================================================
"
Plug 'WolfgangMehner/bash-support'
let g:Bash_MapLeader  = ' '
"} ===



"=================================================================
" Color Scheme {
"=================================================================
" Plug 'lifepillar/vim-solarized8'
" Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
" <F5> to switch from dark to light
" <F6> to cycle the 3 levels of contrast
nnoremap <silent> <F5> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
nnoremap <silent> <F6> :call GruvCycleContrast()<CR>
function! GruvCycleContrast()
    if &background ==? 'dark'
        if g:gruvbox_contrast_dark ==? 'soft'
            let g:gruvbox_contrast_dark='medium'
        elseif g:gruvbox_contrast_dark ==? 'medium'
            let g:gruvbox_contrast_dark='hard'
        elseif g:gruvbox_contrast_dark ==? 'hard'
            let g:gruvbox_contrast_dark='soft'
        endif
    else
        if g:gruvbox_contrast_light ==? 'soft'
            let g:gruvbox_contrast_light='medium'
        elseif g:gruvbox_contrast_light ==? 'medium'
            let g:gruvbox_contrast_light='hard'
        elseif g:gruvbox_contrast_light ==? 'hard'
            let g:gruvbox_contrast_light='soft'
        endif
    endif
    colorscheme gruvbox
endfunction

set background=dark            " Start with dark background theme
silent! colorscheme2yy gruvbox    " Color scheme supports truecolor
colorscheme default           " this is the default vim scheme
"} ===

"=================================================================
" Startify: The fancy start screen for vim
"=================================================================
" :SLoad    load a session
" :SSave    save a session
" :SDelete  delete a session
" :SClose   close current session
"

let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 0
let g:startify_bookmarks = [ {'c': '~/.vimrc'} ]
Plug 'mhinz/vim-startify'

"=================================================================
"=####################= END Plugin System =######################=
"=================================================================
call plug#end()
set synmaxcol=1000      " Only syntax hightlight 1000 columns right


"=================================================================
" Color Scheme
"=================================================================
if has('gui_running')
    set background=light
else
    set background=dark
endif

" colorscheme wombat256mod
" colorscheme default
silent! colorscheme gruvbox " colorscheme support truecolor
"highlight Normal guibg=none

if (has("termguicolors"))
  set termguicolors
endif
syntax enable
