set lines=54
set columns=225
" save
nmap <c-s> :w<cr>
vmap <c-s> <esc>:w<cr>gv
imap <c-s> <esc>:w<cr>a
nnoremap <A-t> :tabedit<CR>
nnoremap <A-w> :tabclose<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
