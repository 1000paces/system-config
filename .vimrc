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

set runtimepath^=~/.vim/bundle/ctrlp.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" enable status line always
set laststatus=2

hi CursorLine ctermbg=17
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
  set grepformat=%f:%l:%c%m
  
"  nmap <silent> <RIGHT> :cnext<CR>
"  nmap <silent> <LEFT> :cprev<CR>
  nmap <silent> <S-RIGHT> :cnext<CR>
  nmap <silent> <S-LEFT> :cprev<CR>
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif

call vundle#begin()
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'wincent/command-t'
Plugin 'leafgarland/typescript-vim'
Plugin 'burnettk/vim-angular'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-airline/vim-airline'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'thoughtbot/vim-rspec'
" All of your Plugins must be added before the following line
call vundle#end()            " required
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

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1


