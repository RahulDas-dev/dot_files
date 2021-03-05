call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'preservim/nerdtree'
Plug 'junegunn/seoul256.vim'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'rust-lang/rust.vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()


syntax on
syntax enable
filetype plugin indent on
set encoding=utf-8
set noerrorbells
set tabstop=4 softtabstop=4
set number relativenumber
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set termguicolors
set signcolumn=yes
set clipboard+=unnamedplus

set splitbelow
set splitright
set modifiable
" -------------------------------------------------
" ------------Status Line Customization----------
" -------------------------------------------------

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#excludes = ['branches', 'index'] 
let g:airline#extensions#tabline#buffer_nr_show=1 
nnoremap <C-S-Tab> :tabprevious<CR>
nnoremap <C-Tab> :tabnext<C>
nnoremap <C-Left> :bp<CR>
nnoremap <C-Right> :bn<CR>
" source $HOME/.config/neovim/statusline.vim
" source $HOME/.config/neovim/tabline.vim
" -------------------------------------------------
" -------------Color Scheme Customization----------
" -------------------------------------------------
colorscheme gruvbox
" colorscheme peachpuff   
" let g:seoul256_background = 236
set background=dark
" -------------------------------------------------
" -------------NERDTree Customization--------------
" -------------------------------------------------

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in = 1 
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif 

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" -------------------------------------------------
" -------------Terminal Customization--------------
" cc for commandline, cs for split first, ce to exit
" -------------------------------------------------
if has("win32")
  " Note, you need to empty the file Git\etc\motd
  " to get rid of the 'Welcome to Git' message
  set shell=cmd.exe
  nnoremap <Leader>cc :term<CR>adoskey.cmd<CR>cmd.exe /c "C:\\Progra~1\Git\bin\bash.exe --login -i"<CR>clear<CR>
  nnoremap <Leader>cs :sp<CR>:wincmd j<CR>:term<CR>adoskey.cmd<CR>cls<CR>cmd.exe /c "C:\\Progra~1\Git\bin\bash.exe --login -i"<CR>clear<CR>
  nnoremap <Leader>cd :term<CR>adoskey.cmd<CR>cls<CR>
  nnoremap <Leader>csd :sp<CR>:wincmd j<CR>:term<CR>adoskey.cmd<CR>cls<CR>
else
  nnoremap <Leader>cc :term<CR>A
  nnoremap <Leader>cs :sp<CR>:wincmd j<CR>:term<CR>A
endif
augroup TerminalMappings
  autocmd!
  if has("win32")
    autocmd TermOpen * nnoremap <buffer> <C-E> aexit<CR>exit<CR>
    autocmd TermOpen * tnoremap <buffer> <C-E> exit<CR>exit<CR>
  else
    autocmd TermOpen * nnoremap <buffer> <C-E> aexit<CR>
    autocmd TermOpen * tnoremap <buffer> <C-E> exit<CR>
  endif
augroup END
