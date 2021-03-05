set nocompatible
filetype off 

call plug#begin('~/.config/nvim/plugged')
" Declare the list of plugins.
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'caenrique/nvim-toggle-terminal'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" List ends here.
call plug#end()

syntax on
syntax enable
filetype plugin indent on
let mapleader = '`'

set encoding=utf-8

" -----------------Allow Copy From Outside & Mouse Interaction -----------------
set clipboard+=unnamedplus
set mouse=a    

" --------------Setting for Wrap, Indentataion, LineNr, and Tab ----------------
set autoindent
set nowrap
set number relativenumber
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab smartindent
set cursorline                            " highlight the Line of Current Cursor
set display+=lastline
set scrolloff=1                           " Prevent Scrolling till the last line

" ---------------------------- Setting Default Split ---------------------------
set splitbelow
set splitright

" -------------------------------Set Folding Method ----------------------------
set foldmethod=syntax
set nofoldenable                              "Code Folding Off, Initial setting
nnoremap <F9> za
au BufNewFile,BufRead *.py setlocal foldmethod=indent

" ---------------------- AutoComplete Menu and Spell checking ------------------
set complete+=kspell
set completeopt=menuone,longest,noinsert
set shortmess+=c
set pumheight=25

" -------------------Write Files automically when switching buffer--------------
set autowrite
set autoread
set noswapfile               " not 2 generate *.sqp file by autowrite/autoread

" ----------------------Persists The Undos After The Sessions-------------------
"set undofile

" ------------------ Line Commment/Uncomment Toggling -------------------------- 
autocmd FileType c,cpp,java       let b:comment_leader = '//'
autocmd FileType sh,python        let b:comment_leader = '#'
autocmd FileType vim              let b:comment_leader = '"'

function! CommentToggle()
    execute ':silent! s/\([^ ]\)/' . escape(b:comment_leader,'\/') . ' \1/'
    execute ':silent! s/^\( *\)' . escape(b:comment_leader,'\/') . ' \?' . escape(b:comment_leader,'\/') . ' \?/\1/'
endfunction
nnoremap   <silent> cc :call CommentToggle()<CR>

" ----------------------------Auto Close Brackets ------------------------------
set signcolumn=yes
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O

" ----------------------------Tab/Buffer Nevigation ----------------------------
nnoremap <C-S-Tab> :tabprevious<CR>
nnoremap <C-Tab> :tabnext<CR>
nnoremap <C-Left> :bprevious<CR>
nnoremap <C-Right> :bnext<CR>

" --------------------------------Search Settings ------------------------------
set ignorecase 
set smartcase 
set incsearch 
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>


" ---------------------Command Line integration & others ------------------------
set history=50
set wildmenu

" ------------------------- Colorscheme Customization --------------------------
set termguicolors
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark
let g:gruvbox_invert_selection = '0'
let g:gruvbox_contrast_dark = 'hard'

" --------------------------------- NERDTree Customization ---------------------
nnoremap <leader>a :NERDTreeToggle<CR> 
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeIgnore = ['\.git$[[dir]]', '\node_modules$[[dir]]', '\.sass-cache$']
autocmd StdinReadPre * let s:std_in = 1 
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif 
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" -----------------------------AirLine Line Customization------------------------
let g:airline_section_y=''
let g:airline_symbols_ascii = 1
let g:airline_skip_empty_sections = 1
let g:airline_focuslost_inactive = 1
let g:airline_extensions = ['branch', 'tabline' ]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#nerdtree_statusline = 1
" let g:airline#extensions#tabline#show_tab_nr = 1
" let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_nr_show = 1 
let g:airline#extensions#tabline#ignore_bufadd_pat =
  \ 'gundo|undotree|vimfiler|tagbar|nerd_tree|startify|!'

let g:airline#extensions#nvimlsp#enabled = 1         "|
let airline#extensions#nvimlsp#error_symbol = 'E:'   "| Neo Vim LSP Status Line interation
let airline#extensions#nvimlsp#warning_symbol = 'W:' "|

" -------------------------------Git Fugitive Customization-----------------------
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''

" ---------------------Command Line integration & others ------------------------
" augroup custom_term
" 	autocmd!
" 	autocmd TermOpen * setlocal nonumber norelativenumber 
" 	autocmd TermOpen * set nohidden nobuflisted 
" 	autocmd TermOpen * startinsert 
" augroup END
" nnoremap <leader>t :tabnew<CR>:terminal<CR>

tnoremap <Esc> <C-\><C-n>
nnoremap <leader><leader> :ToggleTerminal<Enter>
tnoremap <leader><leader> :ToggleTerminal<Enter>
augroup terminal_close
	autocmd!
	autocmd TermOpen * nnoremap <buffer><C-E> aexit<CR>exit<CR>  
	autocmd TermOpen * tnoremap <buffer><C-E> exit<CR>exit<CR>  
augroup END
" To exit from terminal press Esc Key , that will Switch the mode to Normal,
" Then Type exit or pres <Ctrl+E>
 
" -------------------------------Language  Customization-----------------------------
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua << EOF
   vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
     vim.lsp.diagnostic.on_publish_diagnostics, {
       underline = true,
       virtual_text = false,
       signs = true,
       update_in_insert = false,
     }
   )
   local nvim_lsp = require'lspconfig'
   local nvim_command = vim.api.nvim_command
   local on_attach = function(client)
       require'completion'.on_attach(client)
       nvim_command('autocmd CursorHold <buffer> lua vim.lsp.util.show_line_diagnostics()')
   end
   nvim_lsp.pyls.setup({
       on_attach=on_attach,
   })
   nvim_lsp.vimls.setup({
       on_attach=on_attach,
   })
   nvim_lsp.rust_analyzer.setup({
       on_attach=on_attach,
       settings = {
           ["rust-analyzer"] = {
               assist = {
                   importMergeBehavior = "last",
                   importPrefix = "by_self",
               },
               cargo = {
                   loadOutDirsFromCheck = true
               },
               procMacro = {
                   enable = true
               },
           }
       }
   })
EOF
