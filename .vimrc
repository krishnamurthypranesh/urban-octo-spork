" file encodings
set encoding=utf-8

" File splits

" set split positions
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Code Folding
" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with spacebar
nnoremap <space> za

" Enabling PEP8 Standards
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Flagging unnecessary whitespace
" define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set nocompatible
filetype off

" set the runtimepath to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Autocompletion plugin: YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fisadev/vim-ctrlp-cmdpalette'
Plugin 'fisadev/fisa-vim-colorscheme'
Plugin 'davidhalter/jedi-vim'
Plugin 'fisadev/vim-isort'
Plugin 'lilydjwg/colorizer'
call vundle#end()            " required

filetype plugin indent on    " required

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" remapping shortcut for NERDTree
map <C-o> :NERDTreeToggle<CR>

" setting the powerline status for vim
set laststatus=2

" easy resizing of splits
if bufwinnr(1)
  map - <C-W><UP>
  map + <C-W><DOWN>
endif

" state retention for vim-todo-lists.
" Searches inside file with extension '.todo'.
" Assumes that an item starts with any number of
" followed by text. Change the stuff between // to
" change the search pattern.
command Todo noautocmd vimgrep /^\s*[ ].*/j **/*.todo | cw

" Enable spell check
set spell

" Enable spelling correction without moving cursor
function! FixLastSpellingError()
	normal! mm[s1z=`m
endfunction
nnoremap <leader>sp :call FixLastSpellingError()<cr>
