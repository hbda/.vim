"-----------------------------------------------------------------------------
" Vim-plug
"-----------------------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"-------------------------------------------------------------------------------
" git
"-------------------------------------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'


Plug 'altercation/vim-colors-solarized'
Plug 'ap/vim-css-color'
Plug 'bkad/CamelCaseMotion'
Plug 'itchyny/lightline.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'elzr/vim-json'
Plug 'keithbsmiley/rspec.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ngmy/vim-rubocop'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
" Plug 'tyru/caw.vim'
" Plug 'Shougo/context_filetype.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'Yggdroot/indentLine'
Plug 'wincent/command-t', {
  \   'do': 'cd ruby/command-t/ext/command-t && RBENV_VERSION=system ruby extconf.rb && make'
  \ }
Plug 'henrik/vim-indexed-search'
Plug 'mhinz/vim-hugefile'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'

"-------------------------------------------------------------------------------
" javascript
"-------------------------------------------------------------------------------
Plug 'pangloss/vim-javascript'
Plug 'briancollins/vim-jst'
Plug 'kchmck/vim-coffee-script'
Plug 'maksimr/vim-jsbeautify'
Plug 'digitaltoad/vim-pug'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'


call plug#end()

"-----------------------------------------------------------------------------
" fugitive
"-----------------------------------------------------------------------------
autocmd User fugitive
  \ if get(b:, 'fugitive_type', '') =~# '^\%(tree\|blob\)$' |
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
let g:CommandTFileScanner = 'find'
let g:CommandTMatchWindowReverse = 0
let g:CommandTMaxHeight = 17
let g:CommandTMaxFiles = 300000
let g:CommandTWildIgnore = &wildignore.",*.o,*.obj,.git,.svn,*.log,*/public/uploads,*/public/system,*/public/images,*/tmp/cache,*/public/assets,*/tmp/sass-cache,*/tmp/pages,*/tmp/cache,*/test/pages,*/spec/pages,*/node_modules/*"

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

"-------------------------------------------------------------------------------
" lightline.vim
"
" on how statusline of lightline is updated:
" https://github.com/itchyny/lightline.vim/issues/236#issuecomment-315203103
"-------------------------------------------------------------------------------

set laststatus=2
" disable GUI tab pages line
set guioptions-=e

let g:lightline = {}
let g:lightline.enable = { 'statusline': 1, 'tabline': 1 }
" let g:lightline.colorscheme = 'solarized'
" https://github.com/itchyny/lightline.vim/issues/220
let g:lightline.winwidth = 220

" statusline

" https://github.com/itchyny/lightline.vim/issues/223
" it's not possible to hide right arrow separators for NerdTree
" when component returns empty string
" let g:lightline.separator = { 'left': '⮀', 'right': '⮂' }
" let g:lightline.subseparator = { 'left': '⮁', 'right': '⮃' }

" or else use letters: N, I, R, V, VL, VB, C
let g:lightline.mode_map = {
      \   'n' : 'NORMAL',
      \   'i' : 'INSERT',
      \   'R' : 'REPLACE',
      \   'v' : 'VISUAL',
      \   'V' : 'V-LINE',
      \   "\<C-v>": 'V-BLOCK',
      \   'c' : 'COMMAND'
      \ }

" https://github.com/itchyny/lightline.vim/issues/203
" group linter components with filetype to avoid extra left
" arrow when linter components are hidden in plugin window
let g:lightline.active = {
      \   'left': [['mode'], ['fugitive'], ['filename']],
      \   'right': [['lineinfo'], ['filetype', 'linter_warnings', 'linter_errors', 'linter_ok']]
      \ }
let g:lightline.inactive = {
      \   'left': [['filename']],
      \   'right': [['lineinfo'], ['filetype']]
      \ }

" tabline

let g:lightline.tabline = { 'left': [['tabs']], 'right': [] }
let g:lightline.tabline_separator = { 'left': '', 'right': '' }
let g:lightline.tabline_subseparator = { 'left': '', 'right': '' }
let g:lightline.tab = {
      \   'active': ['filename', 'modified'],
      \   'inactive': ['filename', 'modified']
      \ }

" components

let g:lightline.component = {
      \   'fileencodingformat': '%{&fenc !=# "" ? &fenc : &enc}[%{&ff}]'
      \ }
" function components are updated on every cursor motion
let g:lightline.component_function = {
      \   'mode': 'MyLightlineMode',
      \   'fugitive': 'MyLightlineFugitive',
      \   'filename': 'MyLightlineFilename',
      \   'filetype': 'MyLightlineFiletype',
      \   'lineinfo': 'MyLightlineLineinfo'
      \ }
" expanding components have priority over function components
" (used for warning and critical components)
"
" expanding components are updated only when lightline#update() is called
" (github.com/itchyny/lightline.vim/blob/master/doc/lightline.txt#L415)
let g:lightline.component_expand = {
      \   'linter_warnings': 'MyLightlineLinterWarnings',
      \   'linter_errors': 'MyLightlineLinterErrors',
      \   'linter_ok': 'MyLightlineLinterOk'
      \ }
" this configuration applies to component_expand only
" values are color names from lightline colorscheme
let g:lightline.component_type = {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'ok'
      \ }

" functions for components
"
" &enc = &encoding
" &fenc = &fileencoding
" &ft = &filetype
" &ma = &modifiable
" &mod = &modified
" &ro = &readonly

function! MyLightlineMode()
  return <SID>IsNerdTree() ? 'NERD' :
        \ <SID>IsCommandT() ? 'CommandT' :
        \ <SID>IsNarrowWindow() ? '' : lightline#mode()
endfunction

function! MyLightlineFugitive()
  if <SID>IsNotebookWindow() | return '' | end
  if <SID>IsNarrowWindow() | return '' | end
  if <SID>IsPluginWindow() | return '' | end

  if !exists('*fugitive#head') | return '' | end

  let l:branch = fugitive#head()
  let l:fname = expand('%')

  if strwidth(l:branch . l:fname) > 0.6 * winwidth(0)
    let l:branch = ''
  elseif l:branch != ''
    let l:branch = '⎇ ' . l:branch
  endif

  let l:gitgutter_sign = get(g:, 'gitgutter_enabled', 0) ? ' ±' : ''

  "let l:hunks = ''
  "if get(g:, 'gitgutter_enabled', 0)
  "  let l:hunk_array = GitGutterGetHunkSummary()
  "  let l:hunk_symbols = ['+', '~', '-']
  "
  "  for i in [0, 1, 2]
  "    let l:hunks .= printf('%s%s ', l:hunk_symbols[i], l:hunk_array[i])
  "  endfor
  "endif

  return l:branch . l:gitgutter_sign
endfunction

" https://github.com/vim-airline/vim-airline/blob/master/autoload/airline/extensions/quickfix.vim
function! MyLightlineFilename()
  if <SID>IsExtradite() | return ExtraditeCommitDate() | end
  if <SID>IsVimPlug() | return expand('%') | end
  if <SID>IsPluginWindow() | return '' | end
  if <SID>IsQuickfix() | return w:quickfix_title | end

  let l:fname = <SID>IsNotebookWindow()
        \ ? expand('%:h:t') . '/' . expand('%:t')
        \ : expand('%')
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != l:fname ? l:fname : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineReadonly()
  "if <SID>IsHelp() | return '' | end
  if &ro | return '⭤' | end

  return ''
endfunction

function! LightlineModified()
  return &ma && &mod ? '+' : ''
endfunction

function! MyLightlineFiletype()
  if <SID>IsNotebookWindow() | return '' | end
  if <SID>IsPluginWindow() | return '' | end

  return &ft != '' ? &ft : 'no ft'
endfunction

function! MyLightlineLineinfo()
  if <SID>IsNarrowWindow() | return '' | end
  if <SID>IsPluginWindow() | return '' | end

  return printf('%3d/%d☰ : %-2d', line('.'), line('$'), col('.'))
endfunction

function! MyLightlineLinterWarnings()
  if <SID>IsQuickfix() | return '' | end
  if <SID>IsPluginWindow() | return '' | end

  return lightline#ale#warnings()
endfunction

function! MyLightlineLinterErrors()
  if <SID>IsQuickfix() | return '' | end
  if <SID>IsPluginWindow() | return '' | end

  return lightline#ale#errors()
endfunction

function! MyLightlineLinterOk()
  if <SID>IsQuickfix() | return '' | end
  if <SID>IsPluginWindow() | return '' | end

  return lightline#ale#ok()
endfunction

function! s:IsNarrowWindow()
  return winwidth(0) <= 60
endfunction

function! s:IsNotebookWindow()
  return winwidth(0) <= 90
endfunction

function! s:IsPluginWindow()
  if <SID>IsNerdTree() | return 1 | end
  if <SID>IsCommandT() | return 1 | end

  return 0
endfunction

function! s:IsNerdTree()
  return expand('%:t') =~ 'NERD_tree'
endfunction

function! s:IsCommandT()
  return &ft == 'command-t'
endfunction

function! s:IsExtradite()
  return &ft == 'extradite'
endfunction

function! s:IsVimPlug()
  return &ft == 'vim-plug'
endfunction

function! s:IsHelp()
  return &ft =~? 'help'
endfunction

function! s:IsQuickfix()
  return &ft == 'qf'
endfunction

" refresh lightline - or else it might become colorless after sourcing
" vimrc (command was previously called in `augroup vimrc`)
"call lightline#enable()

"-----------------------------------------------------------------------------
" vim-vue
"-----------------------------------------------------------------------------
let g:jsx_ext_required = 1
