set lines=54
set columns=300
" save
nmap <c-s> :w<cr>
vmap <c-s> <esc>:w<cr>gv
imap <c-s> <esc>:w<cr>a
nnoremap <S-F2> :tabnew<CR>
inoremap <S-F2> <Esc>:tabnew<CR>
nnoremap <S-F1> :tabclose<CR>
inoremap <S-F1> <Esc>:tabclose<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
