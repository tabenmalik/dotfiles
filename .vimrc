" Based on the vimrc by Doug Black http://dougblack.io/words/a-good-vimrc.html

set nowrap

"###### Color and syntax ######
set background=dark
colorscheme gruvbox	" color scheme
syntax enable		" enable syntax processing

"###### Spaces and Tabs ######
" default settings
set tabstop=4		" number of visual spaces per tab when reading in tabs
set shiftwidth=4    "
set softtabstop=4	" number of spaces in tab when editing
set expandtab		" tabs are spaces
" Highlight unwanted extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"###### UI Config ######
set number relativenumber " show hybrid line numbers
set cursorline		" highlight current line
set wildmenu        " visual autocomplete
set showmatch       " highlights matching brackets
set cc=100          " sets a column at the 100 mark
set mouse=a         " allows mouse support
set statusline+=%F  " shows the current file name in status line
set laststatus=2    " turns on the status line
set noerrorbells    " turns off audio beep
set visualbell t_vb=
set incsearch       " Search as I am typing the search string
set hlsearch        " Highlight all mataches in a search
filetype on
filetype plugin indent on

" GDScript files use literal tab characters. Why!?!?
au! BufRead,BufNewFile *.gd setfiletype gdscript
au FileType gdscript set expandtab!
