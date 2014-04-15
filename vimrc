set nocompatible
set autoindent
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
set nowrap
set number
set tabstop=4 "This makes tabs work more like Sublimte Text, so the text lines up.
set shiftwidth=4
set expandtab
"Toggle highlighting with F3 (below)
nnoremap <F3> :set hlsearch!<CR> 
nmap <silent> cp "_cw<C-R>"<Esc>

" github repos for vim plugins
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'yegappan/mru'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vividchalk'
 
" vim-scripts repos
Plugin 'EasyGrep'
 
" non github repos
Plugin 'git://git.wincent.com/command-t.git'
 
filetype plugin indent on
 
 
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif
 
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
 
set nobackup      " do not keep a backup file, use versions instead

set history=100     " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch       " do incremental searching; that is, as you type, highlights will appear on the partial search, like in Firefox's search. Cool, right?
set hlsearch        " hlighlight search results.
 
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
 
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
 
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
 
" Only do this part when compiled with support for autocommands.
if has("autocmd")
 
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
 
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
 
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
 
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
 
  augroup END
endif " has("autocmd")
 
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
colorscheme vividchalk

" Tell command-t to ignore certain files when searching
let g:CommandTWildIgnore=&wildignore . ",target/**"
