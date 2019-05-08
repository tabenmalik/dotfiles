" By leafgarland at https://github.com/leafgarland/typescript-vim

" use `set filetype` to override default filetype=xml for *.ts files
autocmd BufNewFile,BufRead *.ts  set filetype=typescript
" use `setfiletype` to not override any other plugins like ianks/vim-tsx
autocmd BufNewFile,BufRead *.tsx setfiletype typescript
