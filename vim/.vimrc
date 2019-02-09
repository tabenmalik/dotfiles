" Based on the vimrc by Doug Black http://dougblack.io/words/a-good-vimrc.html

" Color and syntax
colorscheme badwolf	" color scheme from Steve Losh http://stevelosh.com/projects/badwolf
syntax enable		" enable syntax processing

" Opening typescript files sets the filetype to xml
" Line below overrides this for *.ts files
" Determined by in issue thread #96 of typescript-vim https://github.com/leafgarland/typescript-vim/issues/96#issuecomment-247805808
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

" Spaces and Tabs
set tabstop=4		" number of visual spaces per tab when readind in tabs
set softtabstop=4	" number of spaces in tab when editing
set expandtab		" tabs are spaces

" UI Config
set number          " show line numbers
set cursorline		" highlight current line
