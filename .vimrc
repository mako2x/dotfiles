"========================================
" NeoBundle
"========================================
set nocompatible
filetype plugin indent off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

"let g:neobundle_default_git_protocol = 'https'

NeoBundleLazy 'Shougo/unite.vim', {
  \ 'autoload': { 'commands': ['Unite', 'UniteWithBufferDir', 'UniteWithCursorWord'] } }

NeoBundleLazy 'ujihisa/unite-rake', {
  \ 'depends': 'Shougo/unite.vim' }

NeoBundleLazy 'Shougo/unite-outline', {
  \ 'autoload': { 'unite_sources': 'outline' } }

NeoBundleLazy 'tsukkee/unite-tag', {
  \ 'autoload': { 'unite_sources': 'tag' } }

NeoBundleLazy 'Shougo/neocomplcache', '', 'same', {'autoload': { 'insert': 1 } }

NeoBundleLazy 'Shougo/neocomplcache-rsense', {
  \ 'depends':  'Shougo/neocomplcache', 
  \ 'autoload': { 'filetypes': 'ruby' }
  \ }

NeoBundleLazy 'Shougo/neosnippet', {
  \ 'autoload': {
  \   'insert':        1, 
  \   'filetypes':     'snippet', 
  \   'unite_sources': ['snippet', 'neosnippet/user', 'neosnippet/runtim'], 
  \ }}

NeoBundle 'Shougo/vimproc', { 'build': {
  \ 'mac':     'make -f make_mac.mak',
  \ 'unix':    'make -f make_unix.mak',
  \ 'cygwin':  'make -f make_cygwin.mak',
  \ 'windows': 'make -f make_mingw32.mak', 
  \ }}

NeoBundleLazy 'Shougo/vimshell', {
  \ 'autoload': { 'commands': 'VimShell' } }

NeoBundleLazy 'Shougo/vimfiler', {
  \ 'depends':  'Shougo/unite.vim', 
  \ 'autoload': {
  \   'commands': ['VimFiler', 'VimFilerExplorer', 'Edit', 'Write', 'Read', 'Source']
  \ }}

NeoBundle 'mattn/webapi-vim'
NeoBundleLazy 'mattn/excitetranslate-vim', {
  \ 'autoload': { 'commands': 'ExciteTranslate' } }
NeoBundleLazy 'mattn/gist-vim', {
  \ 'depends': 'mattn/webapi-vim',
  \ 'autoload': { 'commands': 'Gist' } }
NeoBundleLazy 'kana/vim-operator-user'
NeoBundleLazy 'kana/vim-operator-replace', {
  \ 'depends':  'vim-operator-user', 
  \ 'autoload': {
  \   'mappings': [['nx', '<Plug>(operator-replace)']]
  \ }}
NeoBundleLazy 'kana/vim-smartinput', {
  \ 'autoload': { 'insert': 1 } }

NeoBundle 'L9'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'ujihisa/repl.vim'
NeoBundle 'ujihisa/repl.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'glidenote/memolist.vim'

" Tags
NeoBundle 'majutsushi/tagbar'
NeoBundle 'szw/vim-tags'

" Text Object
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'rhysd/vim-textobj-ruby'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'thinca/vim-textobj-plugins'

" Display
NeoBundle 'wombat256.vim'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'kien/rainbow_parentheses.vim'

" HTML & CSS
NeoBundleLazy 'mattn/zencoding-vim', {
  \ 'autoload': { 'filetypes': ['html', 'slim', 'haml', 'css', 'javascript'] } }
NeoBundleLazy 'othree/html5.vim', {
  \ 'autoload': { 'filetypes': 'html' } }
NeoBundleLazy 'bbommarito/vim-slim', {
  \ 'autoload': { 'filetypes': 'slim' } }
NeoBundleLazy 'digitaltoad/vim-jade', {
  \ 'autoload': { 'filetypes': 'jade' } }
NeoBundleLazy 'hail2u/vim-css-syntax', {
  \ 'autoload': { 'filetypes': 'css' } }
NeoBundleLazy 'hail2u/vim-css3-syntax', {
  \ 'autoload': { 'filetypes': 'css' } }
NeoBundleLazy 'miripiruni/CSScomb-for-Vim', {
  \ 'autoload': { 'filetypes': 'css' } }
NeoBundleLazy 'lilydjwg/colorizer', {
  \ 'autoload': { 'filetypes': ['css', 'sass', 'scss', 'less'] } }
NeoBundleLazy 'Sass', {
  \ 'autoload': { 'filetypes': ['sass'] } }

" Javascript
NeoBundleLazy 'jQuery', {
  \ 'autoload': { 'filetypes': 'javascript' } }
NeoBundleLazy 'teramako/jscomplete-vim', {
  \ 'autoload': { 'filetypes': 'javascript' } }
NeoBundleLazy 'jelera/vim-javascript-syntax', {
  \ 'autoload': { 'filetypes': 'javascript' } }
NeoBundleLazy 'jiangmiao/simple-javascript-indenter', {
  \ 'autoload': { 'filetypes': 'javascript' } }
NeoBundleLazy 'JSON.vim', {
  \ 'autoload': { 'filetypes': 'json' } }
NeoBundleLazy 'kchmck/vim-coffee-script', {
  \ 'autoload': { 'filetypes': 'coffee' } }

" Ruby
NeoBundleLazy 'vim-ruby/vim-ruby', {
  \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'slim', 'haml'] } }
NeoBundleLazy 'ruby-matchit', {
  \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'slim', 'haml'] } }
NeoBundleLazy 'skwp/vim-rspec', {
  \ 'autoload': { 'filetypes': ['ruby', 'eruby', 'slim', 'haml'] } }
NeoBundleLazy 'tpope/vim-endwise', {
  \ 'autoload': { 'insert': 1 } }

" Markdown
NeoBundle 'Markdown'
NeoBundle 'kannokanno/previm'

filetype plugin indent on



"========================================
" User Runtime Path Setting
"========================================
if isdirectory($HOME . '/.vim')
  let $MY_VIMRUNTIME = $HOME.'/.vim'
elseif isdirectory($HOME . '\vimfiles')
  let $MY_VIMRUNTIME = $HOME.'\vimfiles'
elseif isdirectory($VIM . '\vimfiles')
  let $MY_VIMRUNTIME = $VIM.'\vimfiles'
endif



"========================================
" Script Encoding
"========================================
set encoding=utf-8
silent! source $MY_VIMRUNTIME/pluginjp/encode.vim
scriptencoding utf-8



"========================================
" System Setting
"========================================
set nowritebackup
set nobackup
set noswapfile
set directory=~/.vim/vimbackup
set clipboard=unnamed,autoselect
set nrformats-=octal
set timeoutlen=3500
set hidden
set history=100
set formatoptions+=mM
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set ambiwidth=double
set wildmenu
if has('mouse')
  set mouse=a
endif



"========================================
" Search
"========================================
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
set iskeyword=a-z,A-Z,48-57,_,-,>



"========================================
" Visual Setting
"========================================
set t_Co=256
syntax on
colorscheme wombat256mod
set shortmess+=I
set noerrorbells
set novisualbell
set visualbell t_vb=
set number
set showmatch matchtime=1
set ts=2 sw=2 sts=2
set expandtab
set autoindent
set cinoptions+=:0
set notitle
set cmdheight=1
set laststatus=2
set showcmd
set display=lastline
set nolist



"========================================
" diff/patch
"========================================
if has('win32') || has('win64')
  set diffexpr=MyDiff()
  function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
      if &sh =~ '\<cmd'
        let cmd = '""' . $VIMRUNTIME . '\diff"'
        let eq = '"'
      else
        let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
      endif
    else
      let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
  endfunction
endif

command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif
set patchexpr=MyPatch()
function! MyPatch()
   :call system($VIM."\\'.'patch -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff)
endfunction


"========================================
" Vim Script
"========================================
" Restore Cursor
augroup vimrcEx
  au!
  au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END


" Zenkaku Space
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
  silent! match ZenkakuSpace /　/
endfunction
if has('syntax')
  augroup zenkakuSpace
    au!
    au VimEnter,BufEnter * call ZenkakuSpace()
  augroup END
endif



"========================================
" Normal Mode
"========================================
" Move
nmap <Down> gj
nmap <Up>   gk
nmap h <Left>
nmap j gj
nmap k gk
nmap l <Right>

" Buffer
nmap <Space>bp :bp<CR>
nmap <Space>bn :bn<CR>
nmap <Space>bw :bw<CR>

" Window
nmap <Space>wh <C-w>h
nmap <Space>wj <C-w>j
nmap <Space>wk <C-w>k
nmap <Space>wl <C-w>l

" Clear Highlight
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" New Line
nmap <CR> :<C-u>call append(expand('.'), '')<CR>j

" Yank
nmap Y y$

" Select Last Changed Area
nmap gz `[v`]

" Mark
nmap gm `


"========================================
" Indert Mode
"========================================


"========================================
" Visual Mode
"========================================
vmap v <ESC><S-V>
vmap { "zdi{<C-R>z}<ESC>
vmap [ "zdi[<C-R>z]<ESC>
vmap ( "zdi(<C-R>z)<ESC>
vmap " "zdi"<C-R>z"<ESC>
vmap ' "zdi'<C-R>z'<ESC>
vmap # "zdi#{<C-R>z}<ESC>
vmap - "zdi<!-- <C-R>z--><ESC>


"========================================
" Command Mode
"========================================
" Encode
command! -nargs=* Eutf8 set fenc=utf-8
command! -nargs=* Esjis set fenc=shift_jis
command! -nargs=* Eeuc set fenc=euc-jp
command! -nargs=* EEutf8 e ++enc=utf-8
command! -nargs=* EEsjis e ++enc=shift_jis
command! -nargs=* EEeuc e ++enc=euc-jp

" Line Feed Code
command! -nargs=* Eunix set ff=unix
command! -nargs=* Edos set ff=dos
command! -nargs=* Emac set ff=mac

" NeoBundle Install
command! -nargs=* Install NeoBundleInstall

" Alias
command! -nargs=0 Wq wq


"========================================
" Plugin Settings
"========================================
""""""""""""""""""""""""""""""
" Neocomplcache
""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1

""""""""""""""""""""""""""""""
" Neocomplcache Rsense
""""""""""""""""""""""""""""""
let g:neocomplcache#sources#rsense#home_directory = '/usr/local/Cellar/rsense/0.3/libexec'

""""""""""""""""""""""""""""""
" Neosnippet
""""""""""""""""""""""""""""""
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
let g:neosnippet#snippets_directory='~/.neosnippets'
command! -nargs=* Esnippets NeoSnippetEdit

""""""""""""""""""""""""""""""
" VimShell
""""""""""""""""""""""""""""""
nmap <silent> ,s :VimShell<CR>

""""""""""""""""""""""""""""""
" VimFiler
""""""""""""""""""""""""""""""
nmap <silent> ,v :VimFilerExplorer<CR>

""""""""""""""""""""""""""""""
" Excite Translate
""""""""""""""""""""""""""""""
nmap <silent> ,t :ExciteTranslate<CR>

""""""""""""""""""""""""""""""
" Unite
""""""""""""""""""""""""""""""
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_filename_format = ''
let g:unite_source_bookmark_directory = $HOME . '/.unite/bookmark'
let g:unite_source_history_yank_enable = 1
" Buffer
nmap <silent> <Space>ub :<C-u>Unite buffer<CR>
" File
nmap <silent> <Space>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" Recent File
nmap <silent> <Space>ur :<C-u>Unite file_mru<CR>
" Yank History
nmap <silent> <Space>uy :<C-u>Unite history/yank<CR>
" Outline
nmap <silent> <Space>uo :Unite outline<CR>
" Tags
nmap <silent> <Space>tt :<C-u>UniteWithCursorWord -immediately tag<CR>
nmap <silent> <Space>ta :<C-u>Unite tag<CR>


""""""""""""""""""""""""""""""
" Fugitive
""""""""""""""""""""""""""""""
nmap <silent> <Space>gc :Gcommit<CR>
nmap <silent> <Space>gw :Gwrite<CR>
nmap <silent> <Space>gr :Gread
nmap <silent> <Space>gb :Gblame<CR>
nmap <silent> <Space>gd :Gdiff<CR>
nmap <silent> <Space>gs :Gstatus<CR>

""""""""""""""""""""""""""""""
" Operator Replace
""""""""""""""""""""""""""""""
nmap _ <Plug>(operator-replace)

""""""""""""""""""""""""""""""
" Alignta
""""""""""""""""""""""""""""""
vmap a :Alignta <<0 \ /1<CR>

""""""""""""""""""""""""""""""
" Text Object
""""""""""""""""""""""""""""""
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)

""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""
let g:syntastic_javascript_chacker = 'jshint'

""""""""""""""""""""""""""""""
" JS Complete
""""""""""""""""""""""""""""""
let g:jscomplete_use = ['dom', 'moz', 'es6th']

""""""""""""""""""""""""""""""
" Zen Coding
""""""""""""""""""""""""""""""
let g:user_zen_expandabbr_key = '<c-e>'

""""""""""""""""""""""""""""""
" TComment
""""""""""""""""""""""""""""""
let g:tcommentMapLeader1 = 'gc'

""""""""""""""""""""""""""""""
" Vim Tags
""""""""""""""""""""""""""""""
nmap <silent> <Space>tg :TagsGenerate<CR>

""""""""""""""""""""""""""""""
" Tagbar
""""""""""""""""""""""""""""""
nmap <silent> <Space>tl :TagbarToggle<CR>
let g:tagbar_width = 25
let g:tagbar_autofocus = 1

" Coffeetags
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

""""""""""""""""""""""""""""""
" Quick Run
""""""""""""""""""""""""""""""
let g:quickrun_config = {}
let g:quickrun_config.coffee = {'command': 'coffee', 'cmdopt': '-pb'}

""""""""""""""""""""""""""""""
" Open Browser
""""""""""""""""""""""""""""""
nmap <Leader>v <Plug>(openbrowser-smart-search)

""""""""""""""""""""""""""""""
" Previm
""""""""""""""""""""""""""""""
augroup previm
  au!
  au BufReadPost *.md,*.markdown PrevimOpen
augroup END

""""""""""""""""""""""""""""""
" Powerline
""""""""""""""""""""""""""""""
let g:Powerline_symbols = 'fancy'

""""""""""""""""""""""""""""""
" Memolist
""""""""""""""""""""""""""""""
let g:memolist_path = "$HOME/Dropbox/work/blog/src/_posts"
let g:memolist_memo_suffix = 'md'
let g:memolist_template_dir_path = "$HOME/.memo_template"
map <Space>jj :MemoNew<CR>
map <Space>jl :MemoList<CR>

""""""""""""""""""""""""""""""
" Jekyll
""""""""""""""""""""""""""""""
let g:jekyll_path = "$HOME/Dropbox/work/blog/src"
