set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" All of your Plugins must be added before the following line
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'easymotion/vim-easymotion'
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'
Plugin 'Shougo/neomru.vim'
Plugin 'christoomey/vim-tmux-navigator'

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

" autocmd BufWritePost *.py call Flake8()

colorscheme ir_black

set expandtab ts=4 sw=4 ai
set ic
set nowrap
set hlsearch
set nu
set laststatus=2
set enc=utf-8

highlight Search ctermfg=green
nmap <F2> :TagbarToggle<CR>
nmap <F9> :register<CR>

let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -vertical -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
"   " Play nice with supertab
     let b:SuperTabDisabled=1
"       " Enable navigation with control-j and control-k in insert mode
     imap <buffer> <C-j>   <Plug>(unite_select_next_line)
     imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" Uncomment the following to have VIM jump to the last position when reopen it.
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" nnoremap <C-p> :Unite file_rec/async<cr>
" nnoremap <space>/ :Unite grep:./<cr>
" nnoremap <C-f> :Unite file<cr>
" nnoremap <C-d> :Unite directory<cr>
" nnoremap <C-p> :Unite file file_rec buffer file_mru<cr>
" nnoremap <C-l> :Unite line<cr>
" For easy motion mapping 
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>. <Plug>(easymotion-repeat)

vnoremap // y/<C-R>"<CR>

