filetype plugin indent on
syntax on
:set t_Co=256
"colorscheme cobalt2

colorscheme distinguished
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight CocFloating ctermbg=black

"automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

set re=0
set nocompatible
set mouse=a
set relativenumber
set number
set ruler
set clipboard=unnamed
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
"set runtimepath+=/usr/local/opt/fzf
set runtimepath+=/opt/homebrew/bin/fzf:


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

" :source ~/.vimrc to reinitialize vim
" :PlugInstall to install the new plugins.
call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-haml'

" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'jparise/vim-graphql'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'wincent/command-t'
Plug 'burnettk/vim-angular'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-theme'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plug 'thoughtbot/vim-rspec'
"Plug '/opt/homebrew/opt/fzf'
"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'janko/vim-test'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call plug#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PlugList       - lists configured plugins
" :PlugInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PlugSearch foo - searches for foo; append `!` to refresh local cache
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
nnoremap <C-s> <C-C>
nnoremap <C-q> :FZF<ddCR>
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
:let mapleader = " "
" RSpec.vim mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:rspec_command = "call VtrSendCommand('rspec {spec}')"
let g:VtrUseVtrMaps = 1
"nnoremap <leader>or :call VtrOpenRunner()<cr>
"nnoremap <leader>sl :call VtrSendLinesToRunner()<cr>

nnoremap <leader>va :VtrAttachToPane<cr>
nnoremap <leader>ror :VtrReorientRunner<cr>
nnoremap <leader>sc :VtrSendCommandToRunner<cr>
nnoremap <leader>sl :VtrSendLinesToRunner<cr>
vnoremap <leader>sl :VtrSendLinesToRunner<cr>
nnoremap <leader>or :VtrOpenRunner<cr>
nnoremap <leader>kr :VtrKillRunner<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>
nnoremap <leader>dr :VtrDetachRunner<cr>
nnoremap <leader>cr :VtrClearRunner<cr>
nnoremap <leader>fc :VtrFlushCommand<cr>
nnoremap <leader>sf :VtrSendFile<cr>

" rspec test bindings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" minitest bindings
let test#strategy = "vtr"
map <leader>n :TestNearest<cr> 
map <leader>f :TestFile<cr>
map <leader>s :TestSuite<cr>
map <leader>l :TestLast<cr>
map <leader>g :TestVisit<cr>

command! E Explore

"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:snipMate = { 'snippet_version' : 1 }
"let g:snipMate = {}
"let g:snipMate.scope_aliases = {}
"let g:snipMate.scope_aliases['ruby'] = 'ruby, ruby-rails'

" Airline customization
let g:airline#extensions#branch#displayed_head_limit = 8

"cnoremap jk <C-C>
nnoremap ; :FZF<CR>
nnoremap <C-p> :FZF<CR>
nnoremap F :FZF<CR>
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

let g:coc_global_extensions = [ 'coc-tsserver', 'coc-solargraph' ]

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
