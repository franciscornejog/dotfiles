" Personal Neovim Configuration
" Author:  Francisco Cornejo-Garcia

" Default ----------------------------------------------------------------------
colorscheme noired             " Set specified colorscheme 
set cursorline                 " Highlight cursor line
set cursorcolumn               " Highlight cusor column
set colorcolumn=80             " Highlight column line

" Text -------------------------------------------------------------------------
set linebreak                  " Wrap lines
set textwidth=80               " Set line width
set expandtab                  " Turn tab to spaces
set smartindent		       " Smart autoindenting
set tabstop=4                  " Set tab width
set softtabstop=4              " Set specific whitespace
set shiftwidth=4               " Indent with specific whitespace

" Terminal ---------------------------------------------------------------------
autocmd TermOpen * startinsert           " Insert when open terminal
autocmd TermOpen * setlocal nonumber     " Remove line number when open terminal
autocmd BufEnter term://* startinsert    " Insert when enter terminal
tnoremap <C-w>N <C-\><C-N>
tnoremap <C-w>h <C-\><C-N><C-w>h
tnoremap <C-w>j <C-\><C-N><C-w>j
tnoremap <C-w>k <C-\><C-N><C-w>k
tnoremap <C-w>l <C-\><C-N><C-w>l

" Plugins ----------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

Plug 'chrisbra/Colorizer'

call plug#end()

