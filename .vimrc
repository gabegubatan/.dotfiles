set nocompatible          " Disable vi compatibility
syntax on                 " Enable syntax highlighting
set number                " Show line numbers
set relativenumber        " Set Relative Numbers
set encoding=utf-8        " Set UTF-8 encoding
set tabstop=4             " Number of spaces a <Tab> counts for
set shiftwidth=4          " Number of spaces to use for each step of (auto)indent
set softtabstop=4         " Number of spaces that a <Tab> counts for while performing editing operations
set expandtab             " Use spaces instead of tabs
set autoindent            " Copy indent from current line when starting a new line
set smartindent           " Smart autoindenting when starting a new line
set hlsearch              " Highlight search results
set incsearch             " Show search matches as you type
set showmatch             " Highlight matching parenthesis
set background=dark       " Use colors suitable for a dark background
set hidden                " Allow switching buffers without saving
set laststatus=2          " Always show the status line
set showcmd               " Show (partial) command in the last line of the screen


" Begin plugin section
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
" Optional: Add more plugins as needed

call plug#end()

### to install vim-plug run:

# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# open vim and :PlugInstall to install plug-ins. Delete all # Comments before using.
