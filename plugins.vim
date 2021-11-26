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
Plug 'morhetz/gruvbox'
Plug 'ap/vim-css-color'
Plug 'bkad/CamelCaseMotion'
Plug 'itchyny/lightline.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'elzr/vim-json'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'keithbsmiley/rspec.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'tap349/ack.vim'
Plug 'tap349/QFEnter'
" Plug 'scrooloose/nerdcommenter'
Plug 'tyru/caw.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'scrooloose/nerdtree'
" Plug 'vim-syntastic/syntastic'
Plug 'maximbaz/lightline-ale' | Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'Yggdroot/indentLine'
" Plug 'wincent/command-t', {
"  \   'do': 'cd ruby/command-t/ext/command-t && /opt/homebrew/opt/ruby/bin/ruby extconf.rb && make'
"  \ }
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'henrik/vim-indexed-search'
Plug 'mhinz/vim-hugefile'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'

"-------------------------------------------------------------------------------
" javascript
"-------------------------------------------------------------------------------
Plug 'pangloss/vim-javascript'
" Plug 'briancollins/vim-jst'
Plug 'kchmck/vim-coffee-script'
" Plug 'maksimr/vim-jsbeautify'
Plug 'digitaltoad/vim-pug'
Plug 'posva/vim-vue'
" Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'amadeus/vim-jsx'


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
" " let g:syntastic_ruby_checkers=['mri', 'rubylint', 'rubocop']
" let g:syntastic_ruby_checkers=['mri', 'rubylint']
" " let g:syntastic_ruby_mri_args='-T1 -c'
" let g:syntastic_coffee_checkers=['coffee'] ", 'coffeelint'
" let g:syntastic_slim_checkers=['slimrb']
" let g:syntastic_json_checkers=['jsonlint'] " npm install -g jsonlint
" let g:syntastic_sass_checkers=[]
" let g:vim_json_syntax_conceal = 0
" " let g:syntastic_ruby_mri_exec = 'ruby2.2.2'
" let g:syntastic_ruby_mri_quiet_messages = {
"\ 'regex': [
"\   '\m`&'' interpreted as argument prefix',
"\   '\m`*'' interpreted as argument prefix'
"\ ] }
" "\   '\m^shadowing outer local variable',
" "let g:syntastic_enable_signs=1
" " let g:syntastic_auto_loc_list=1
"
" nnoremap <silent> <leader>ru :SyntasticCheck ruby rubocop<CR>
" nnoremap <silent> <leader>ra :!bundle exec rubocop --auto-correct %<CR>

"-----------------------------------------------------------------------------
" ale
"-----------------------------------------------------------------------------
" only linters from g:ale_linters are enabled
let g:ale_linters_explicit = 1

" hi ALEWarningSign guibg=#FDE1FD guifg=#0512FB gui=bold
" hi ALEErrorSign guibg=#F4DBDC guifg=#662529 gui=bold

" location list is populated by default -
" this might overwrite the contents of already
" opened location list (e.g., search results)
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0

let g:ale_sign_warning = 'W>'
let g:ale_sign_error = 'E>'

" https://github.com/w0rp/ale/issues/505
" to disable g:ale_lint_on_enter, it's necessary
" to disable g:ale_lint_on_filetype_changed as well
"let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

"\   'elixir': ['credo'],
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\   'jsx': ['eslint'],
\   'coffee': ['coffeelint'],
\   'ruby': ['rubocop']
\ }

au BufNewFile,BufRead *.rb nnoremap <silent> ,R :w<cr>:silent !rubocop --auto-correct %<cr>:edit!<cr>
au BufNewFile,BufRead *.js nnoremap <silent> ,R :w<cr>:silent !yarn run eslint --fix %<cr>:edit!<cr>
au BufNewFile,BufRead *.jsx nnoremap <silent> ,R :w<cr>:silent !yarn run eslint --fix %<cr>:edit!<cr>
au BufNewFile,BufRead *.vue nnoremap <silent> ,R :w<cr>:silent !yarn run eslint --fix %<cr>:edit!<cr>

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
" let g:CommandTFileScanner = 'find'
" let g:CommandTMatchWindowReverse = 0
" let g:CommandTMaxHeight = 17
" let g:CommandTMaxFiles = 300000
" let g:CommandTWildIgnore = &wildignore.",*.o,*.obj,.git,.svn,*.log,*/public/uploads,*/public/system,*/public/images,*/tmp/cache,*/public/assets,*/tmp/sass-cache,*/tmp/pages,*/tmp/cache,*/tmp/themes,*/test/pages,*/spec/pages,*/node_modules/*"
" 
" nmap <silent> <leader>t :CommandT<cr>
" nmap <silent> <leader>r :CommandTFlush<cr>:CommandT<cr>
" nmap <silent> <leader>j :CommandTJump<CR>

"-----------------------------------------------------------------------------
" FZF
"-----------------------------------------------------------------------------
nmap <silent> <leader>t :FZF<cr>

"-----------------------------------------------------------------------------
" Ctrl-P
"-----------------------------------------------------------------------------
" nmap <silent> <leader>t :CtrlPMixed<cr>
" 
" if executable('ag')
"   " Use Ag over Grep
"   set grepprg=ag\ --nogroup\ --nocolor
" 
"   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"   let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
"   let g:ctrlp_clear_cache_on_exit = 1
"   let g:ctrlp_show_hidden = 1
"   let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
"   let g:ctrlp_max_files = 0
"   set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*
" endif
" 
" nmap <f1> :CommandT<cr>
" nmap ,<f1>r :CommandTFlush<cr>:CommandT<cr>
" 
" " буферы закрываем всегда
" function! s:set_bufhidden()
"   if empty(&buftype)
"     setlocal bufhidden=wipe
"   endif
" endfunction
" 
" autocmd! BufRead * call s:set_bufhidden()

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
" let g:NERDSpaceDelims = 1
" let g:NERDDefaultAlign = 'left'
" map ,<space> <plug>NERDCommenterToggle

"-----------------------------------------------------------------------------
" CAW.vim
"-----------------------------------------------------------------------------
map ,<space> <plug>(caw:hatpos:toggle)

"-------------------------------------------------------------------------------
" ack.vim
"-------------------------------------------------------------------------------

let g:ackprg = 'rg --fixed-strings --smart-case --vimgrep'
" disable empty search (searching the word under cursor) -
" it complicates the logic to parse user input excessively
"
" use <C-r><C-w> to paste the word under cursor
let g:ack_use_cword_for_empty_search = 0

" QFEnter works with both quickfix windows and location lists
map <Leader>/ :call <SID>Search()<CR>
map <Leader>\ :call <SID>SearchWithGlob()<CR>

function! s:Search()
  echohl AckSearch
  let l:input_phrase = input('⎸SEARCH > ')
  echohl None

  call <SID>MyLAck(l:input_phrase, '')
endfunction

function! s:SearchWithGlob()
  echohl AckSearch
  let l:input_phrase = input('⎸SEARCH [1/2] > ')
  redraw!
  let l:glob = input('⎸GLOB [2/2] > ')
  echohl None

  call <SID>MyLAck(l:input_phrase, l:glob)
endfunction

" `!` is not allowed in function name
"
" https://github.com/mileszs/ack.vim/issues/5
" https://stackoverflow.com/a/15403852/3632318
" https://stackoverflow.com/questions/5669194
" :help escape()
" :help shellescape()
"
" for rg to work we need:
"
" - not to escape `!` at all
" - to escape `%#` twice
" - to escape other special characters (slashes, etc.) once
" - not to treat strings starting with dashes as rg options
"
" useful functions:
"
" - `shellescape({string})`:
"   escapes all special characters once (excluding `!%#`)
" - `shellescape({string}, 1)`:
"   escapes all special characters once (including `!%#`)
" - `escape({string}, {chars})`:
"   escapes only the characters it's told to escape
" - `--` (options delimiter):
"   signifies the end of rg options
"
" => escape all special characters excluding `!%#` with
"    `shellescape`, escape `%#` with `escape` twice
"    and let `--` deal with strings starting with dashes
function! s:MyLAck(input_phrase, ...)
  let l:glob = get(a:, 1, '')
  let l:glob_option = len(l:glob) ? '-g ''*' . l:glob . '*''' : ''

  let l:delimiter = ' -- '
  let l:split_args = split(a:input_phrase, l:delimiter)
  let l:args_len = len(l:split_args)

  " no arguments
  if l:args_len == 0
    call <SID>ShowWarningMessage('Empty search')
    return
  " options only (`-w -- `)
  elseif l:args_len == 1 && a:input_phrase =~ l:delimiter . '$'
    call <SID>ShowWarningMessage('Empty search')
    return
  " search phrase only (` -- foo` or `foo`)
  elseif l:args_len == 1
    let l:options = l:glob_option
    let l:search_phrase = join(l:split_args)
  " options and search phrase
  else
    let l:options = l:glob_option . ' ' . l:split_args[0]
    let l:search_phrase = join(l:split_args[1:-1], l:delimiter)
  endif

  " ack.vim already escapes `|%#` once in autoload/ack.vim -
  " escape `%#` once again here so that they're escaped twice
  let l:escaped_search_phrase = escape(shellescape(l:search_phrase), '%#')

  " don't use `silent` - it suppresses 'no match found' message
  "
  " search might break if ' -- ' is a substring of search phrase
  " and user doesn't provide options - then part of search phrase
  " is parsed as options which might yield unpredictable results
  exec ':LAck! ' . l:options . l:delimiter . l:escaped_search_phrase
endfunction

function! s:ShowWarningMessage(message)
  redraw!
  echohl WarningMsg
  echo a:message
  echohl None
endfunction

"-------------------------------------------------------------------------------
" QFEnter
" QFEnter respects `switchbuf` option! if selected file is opened
" in another tab all mappings below just switch to that tab
"-------------------------------------------------------------------------------

" disable automatic opening of quickfix window (or location list)
" when opening file from current quickfix window in a new tab
let g:qfenter_enable_autoquickfix = 0

let g:qfenter_keymap = {}
let g:qfenter_keymap.open = ['<C-CR>']
let g:qfenter_keymap.open_keep = ['<S-CR>']
let g:qfenter_keymap.open_close = ['<CR>']
let g:qfenter_keymap.hopen = ['<C-s>']
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.topen = ['<C-t>']"

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
