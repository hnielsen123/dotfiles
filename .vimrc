" Disable compatibiliy with vi which can cause unexpected issues.
set nocompatible

" Enable file type detection. Vim will be able to try to detect the type of
" file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add line numbers to the file.
set number

" Hightlight cursor line underneath the cursor horizontally.
set cursorline

" Enable mouse compatibility
set mouse=a

" Set table width to 4 columns
set tabstop=4

" While searching through a file, incrementally highlight matching characters
" as you type
set incsearch

" Show the mode you are in on the last line.
set showmode

" Set the commands to save in history, default number is 20.
set history=1000

" Theme
colorscheme sorbet

" Transparent background
hi Normal ctermbg=NONE guibg=NONE
