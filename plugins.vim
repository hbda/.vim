"-----------------------------------------------------------------------------
" Vim-plug
"-----------------------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'ap/vim-css-color'
Plug 'bkad/CamelCaseMotion'
Plug 'bling/vim-airline'
Plug 'briancollins/vim-jst'
Plug 'cakebaker/scss-syntax.vim'
Plug 'elzr/vim-json'
Plug 'kchmck/vim-coffee-script'
Plug 'keithbsmiley/rspec.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'mxw/vim-jsx'
Plug 'nanotech/jellybeans.vim'
Plug 'ngmy/vim-rubocop'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'Yggdroot/indentLine'
Plug 'wincent/command-t', {
  \   'do': 'cd ruby/command-t/ext/command-t && RBENV_VERSION=system ruby extconf.rb && make'
  \ }
Plug 'airblade/vim-gitgutter'
Plug 'henrik/vim-indexed-search'
Plug 'mhinz/vim-hugefile'
Plug 'posva/vim-vue'
Plug 'isRuslan/vim-es6'
Plug 'SirVer/ultisnips'
call plug#end()

"-----------------------------------------------------------------------------
" fugitive
"-----------------------------------------------------------------------------
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete
set diffopt+=vertical

"-----------------------------------------------------------------------------
" supertab
"-----------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = '<C-n>'

"-----------------------------------------------------------------------------
" syntastic
"-----------------------------------------------------------------------------
" let g:syntastic_ruby_checkers=['mri', 'rubylint', 'rubocop']
" let g:syntastic_ruby_mri_args='-T1 -c'
let g:syntastic_coffee_checkers=['coffee'] ", 'coffeelint'
let g:syntastic_slim_checkers=['slimrb']
let g:syntastic_json_checkers=['jsonlint'] " npm install -g jsonlint
let g:syntastic_sass_checkers=[]
let g:vim_json_syntax_conceal = 0
" let g:syntastic_ruby_mri_exec = 'ruby2.2.2'
let g:syntastic_ruby_mri_quiet_messages = {
\ 'regex': [
\   '\m`&'' interpreted as argument prefix',
\   '\m`*'' interpreted as argument prefix'
\ ] }
"\   '\m^shadowing outer local variable',
"let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1

nnoremap <silent> <leader>ru :SyntasticCheck ruby rubocop<CR>
nnoremap <silent> <leader>ra :!bundle exec rubocop --auto-correct %<CR>


"-----------------------------------------------------------------------------
" Rubocop vim
"-----------------------------------------------------------------------------
let g:vimrubocop_keymap = 0

"-----------------------------------------------------------------------------
" matchit
"-----------------------------------------------------------------------------
runtime macros/matchit.vim

"-----------------------------------------------------------------------------
" powerline
"-----------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
set laststatus=2

"-----------------------------------------------------------------------------
" Command-T
"-----------------------------------------------------------------------------
let g:CommandTFileScanner = 'git'
let g:CommandTMatchWindowReverse = 0
let g:CommandTMaxHeight = 17
let g:CommandTMaxFiles = 300000
let g:CommandTWildIgnore = &wildignore."*.o,*.obj,.git,.svn,*.log,public/uploads/**,public/system/**,public/images/**,tmp/cache/**,public/assets/**,tmp/sass-cache/**,tmp/pages/**,tmp/cache/**,test/pages/**,spec/pages/**"

nmap <silent> <leader>t :CommandT<cr>
nmap <silent> <leader>r :CommandTFlush<cr>:CommandT<cr>
nmap <silent> <leader>j :CommandTJump<CR>

"-----------------------------------------------------------------------------
" Ctrl-P
"-----------------------------------------------------------------------------
" nmap <silent> <leader>t :CtrlPMixed<cr>

" if executable('ag')
"   " Use Ag over Grep
"   set grepprg=ag\ --nogroup\ --nocolor

"   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"   let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
"   let g:ctrlp_clear_cache_on_exit = 1
"   let g:ctrlp_show_hidden = 1
"   let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
"   let g:ctrlp_max_files = 0
"   set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
" endif

" nmap <f1> :CommandT<cr>
" nmap ,<f1>r :CommandTFlush<cr>:CommandT<cr>

" буферы закрываем всегда
"function! s:set_bufhidden()
  "if empty(&buftype)
    "setlocal bufhidden=wipe
  "endif
"endfunction

"autocmd! BufRead * call s:set_bufhidden()

"-----------------------------------------------------------------------------
" LustyExplorer
"-----------------------------------------------------------------------------
nmap <silent> <leader>l :LustyBufferGrep<cr>
nmap <f4> :LustyBufferGrep<cr>

silent! unmap <leader>lf
silent! unmap <leader>lr
silent! unmap <leader>lb
silent! unmap <leader>lg
silent! unmap <leader>lj

"-----------------------------------------------------------------------------
" NerdTree
"-----------------------------------------------------------------------------
map <silent> <leader>n :NERDTreeToggle<cr>
map <silent> <leader>N :NERDTreeFind<cr>
nmap <f2> :NERDTreeFind<cr>
nmap <f3> :NERDTreeToggle<cr>

"-----------------------------------------------------------------------------
" NerdCommenter
"-----------------------------------------------------------------------------
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
map ,<space> <plug>NERDCommenterToggle

"-----------------------------------------------------------------------------
" Ag
"-----------------------------------------------------------------------------
let g:ag_search_ignore = 'log,public,tmp,spec/vcr_cassettes'
let g:ag_prg="ag --nogroup --nocolor --column "
let g:ag_qhandler="copen 12"
map <Leader>/ <esc>:call AgSearch()<cr>

function! AgSearch()
  let l:search_phrase=input('Ag ')
  redraw
  echo "Ack Searching..."
  silent execute ':LAg --ignore-dir={'.g:ag_search_ignore.'} '.l:search_phrase
endfunction

"-------------------------------------------------------------------------------
" vim-rails
"
" example projections: https://gist.github.com/henrik/5676109
"-------------------------------------------------------------------------------


set splitright
nmap <F4> :A<CR>
nmap gs :AV<CR>
nmap <Leader><F4> :AV<CR>

let g:rails_projections = {
\   'app/*.rb': {
\     'alternate': 'spec/{}_spec.rb'
\   },
\   'app/admin/*.rb': {
\     'alternate': 'spec/controllers/admin/{}_controller_spec.rb'
\   },
\   'spec/controllers/admin/*_controller_spec.rb': {
\     'alternate': 'app/admin/{}.rb'
\   },
\   'lib/*.rb': {
\     'alternate': 'spec/lib/{}_spec.rb'
\   },
\   'spec/lib/*_spec.rb': {
\     'alternate': 'lib/{}.rb'
\   },
\ }

"-----------------------------------------------------------------------------
" vim-vue
"-----------------------------------------------------------------------------
let g:vue_disable_pre_processors=1
