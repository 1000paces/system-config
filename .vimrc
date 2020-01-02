filetype plugin indent on
syntax on
:set t_Co=256
"colorscheme cobalt2
colorscheme distinguished
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

set nocompatible
set mouse=a
set relativenumber
set number
set ruler
filetype off

set tabstop=2
set shiftwidth=2
set expandtab
set cursorline
" set cursorcolumn
set nowrap
set backspace=indent,eol,start

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
" set list

"set runtimepath^=~/.vim/autoload/ctrlp.vim
set runtimepath+=/usr/local/opt/fzf


" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim

" enable status line always
set laststatus=2


"hi CursorLine ctermbg=124
" hi CursorColumn ctermbg=237
hi StatusLine ctermbg=245
hi StatusLine ctermfg=white
hi StatusLineNC ctermbg=235
hi StatusLineNC ctermfg=243
" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=bold,reverse ctermbg=88
  au InsertLeave * hi StatusLine term=bold,reverse ctermfg=white ctermbg=245
endif

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --column 
  "set g:ackprg = 'ag --nogroup --nocolor --column' 
  set grepformat=%f:%l:%c%m
  
"  nmap <silent> <RIGHT> :cnext<CR>
"  nmap <silent> <LEFT> :cprev<CR>
"  nmap <silent> <S-RIGHT> :cnext<CR>
"  nmap <silent> <S-LEFT> :cprev<CR>
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" set rtp+=/usr/local/opt/fzf
  " ag is fast enough that CtrlP doesn't need to cache
"  let g:ctrlp_use_caching = 0

  " bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif

call plug#begin('~/.vim/plugged')
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'wincent/command-t'
Plug 'leafgarland/typescript-vim'
Plug 'burnettk/vim-angular'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-theme'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'thoughtbot/vim-rspec'
Plug '/usr/local/opt/fzf'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
"Plug 'newclide/coc.nvim, {'tag': '*', 'branch', 'release'}
" All of your Plugins must be added before the following line
call plug#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
nnoremap <C-q> :FZF<ddCR>
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" RSpec.vim mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
command! E Explore

"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" Airline customization
let g:airline#extensions#branch#displayed_head_limit = 8

nnoremap ; :FZF<CR>
nnoremap <C-p> :FZF<CR>
nnoremap F :FZF<CR>
map <C-n> :NERDTreeToggle<CR>

