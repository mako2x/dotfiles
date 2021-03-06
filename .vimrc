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

NeoBundleLazy 'Shougo/neocomplete.vim', {
    \ "autoload": {"insert": 1}}
let s:hooks = neobundle#get_hooks("neocomplete.vim")
function! s:hooks.on_source(bundle)
  let g:acp_enableAtStartup = 0
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let $DOTVIM = $HOME . '/.vim'
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'ruby' : $DOTVIM.'/dict/rubymotion.dict'
      \ }
endfunction

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

" Unite
NeoBundleLazy 'Shougo/unite.vim', {
  \ 'autoload': { 'commands': ['Unite', 'UniteWithBufferDir', 'UniteWithCursorWord'] } }

NeoBundleLazy 'ujihisa/unite-rake', {
  \ 'depends': 'Shougo/unite.vim' }

NeoBundleLazy 'Shougo/unite-outline', {
  \ 'autoload': { 'unite_sources': 'outline' } }

NeoBundleLazy 'tsukkee/unite-tag', {
  \ 'autoload': { 'unite_sources': 'tag' } }

NeoBundleLazy 'rhysd/unite-codic.vim', {
  \ 'autoload': { 'unite_sources': 'codic' } }
NeoBundleLazy 'yuku-t/unite-git', {
  \ 'autoload': { 'unite_sources': 'git_cached' } }

NeoBundle 'koron/codic-vim'

NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'mattn/webapi-vim'
NeoBundleLazy 'mattn/gist-vim', {
  \ 'depends': 'mattn/webapi-vim',
  \ 'autoload': { 'commands': 'Gist' } }
NeoBundle 'L9'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ujihisa/repl.vim'

NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundleLazy 'kana/vim-smartinput', {
  \ 'autoload': { 'insert': 1 } }
NeoBundleLazy 'kana/vim-operator-user'
NeoBundleLazy 'kana/vim-operator-replace', {
  \ 'depends':  'vim-operator-user', 
  \ 'autoload': {
  \   'mappings': [['nx', '<Plug>(operator-replace)']]
  \ }}
NeoBundle 'thinca/vim-template'

" Move
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'kien/ctrlp.vim'

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
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'scrooloose/syntastic'

" HTML & CSS
NeoBundleLazy 'mattn/emmet-vim', {
  \ 'autoload': { 'filetypes': ['html', 'erb', 'php'] } }
NeoBundleLazy 'othree/html5.vim', {
  \ 'autoload': { 'filetypes': 'html' } }
NeoBundleLazy 'slim-template/vim-slim', {
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
NeoBundleLazy 'joker1007/vim-markdown-quote-syntax', {
  \ 'autoload': { 'filetypes': 'markdown' } }

" Other
NeoBundle 'airblade/vim-rooter'

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
set undodir=~/.vim/undo
set clipboard=unnamed
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
set ambiwidth=double
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

" Checking typo
autocmd BufWriteCmd :*,*[,*] call s:write_check_typo(expand('<afile>'))
function! s:write_check_typo(file)
  let prompt = "possible typo: really want to write to '" . a:file . "'?(y/n):"
  let input = input(prompt)
  if input =~? '^y\(es\)\=$'
    execute 'write'.(v:cmdbang ? '!' : '') a:file
  endif
endfunction


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
nmap <Space>bh :bp<CR>
nmap <Space>bl :bn<CR>
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

" Toggle spell check
nmap <Space>s :<C-u>setl spell!<CR>


"========================================
" Insert Mode
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

" Alias
command! -nargs=* Reload so $MYVIMRC
command! -nargs=* Install so $MYVIMRC | NeoBundleInstall
command! -nargs=0 Wq wq
command! -nargs=0 Ws !sudo tee % > /dev/null
command! -nargs=0 Finder !open .


"========================================
" Plugin Settings
"========================================
""""""""""""""""""""""""""""""
" Neosnippet
""""""""""""""""""""""""""""""
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
let g:neosnippet#snippets_directory='~/.neosnippets'
command! -nargs=* Esnippets NeoSnippetEdit

""""""""""""""""""""""""""""""
" VimFiler
""""""""""""""""""""""""""""""
nmap <silent> <Space>f :VimFilerExplorer<CR>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

""""""""""""""""""""""""""""""
" Unite
""""""""""""""""""""""""""""""
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_filename_format = ''
let g:unite_source_bookmark_directory = $HOME . '/.unite/bookmark'
let g:unite_source_history_yank_enable = 1

" Use ag (The Silver Searcher)
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_max_candidates = 200
endif

" Buffer
nmap <silent> <Space>ub :<C-u>Unite buffer<CR>
" File
nmap <silent> <Space>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" Recent File
nmap <silent> <Space>ur :<C-u>Unite file_mru:short<CR>
nmap <silent> <Space>uR :<C-u>Unite file_mru:long<CR>
" Yank History
nmap <silent> <Space>uy :<C-u>Unite history/yank<CR>
" Outline
nmap <silent> <Space>uo :Unite outline<CR>
" Tags
nmap <silent> <Space>tt :<C-u>UniteWithCursorWord -immediately tag<CR>
nmap <silent> <Space>ta :<C-u>Unite tag<CR>
" Codic
nmap <silent> <Space>uc :<C-u>Unite codic<CR>
" Git
nmap <silent> <Space>ug :<C-u>Unite git_cached<CR>
" Grep
nmap <silent> <Space>up :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nmap <silent> <Space>uP :<C-u>UniteResume search-buffer<CR>


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
nmap R <Plug>(operator-replace)

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
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['php'] }
let g:syntastic_go_checkers = ['go', 'golint']

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
" Vim Easymotion
""""""""""""""""""""""""""""""
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvb'
let g:EasyMotion_leader_key="m"
let g:EasyMotion_grouping=1
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

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
nmap <Leader>p :PrevimOpen<CR>

""""""""""""""""""""""""""""""
" Lightline
""""""""""""""""""""""""""""""
let g:lightline = {
\   'component': {
\     'readonly': '%{&readonly?"x":""}',
\   },
\   'separator': { 'left': '', 'right': '' },
\   'subseparator': { 'left': '|', 'right': '|' },
\   'active': {
\     'left': [
\       ['mode', 'paste'],
\       ['readonly', 'filename', 'modified', 'anzu']
\     ]
\   },
\   'component_function': {
\     'anzu': 'anzu#search_status'
\   }
\ }

""""""""""""""""""""""""""""""
" Vim Anzu
""""""""""""""""""""""""""""""
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
augroup vim-anzu
  autocmd!
  autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
augroup END

""""""""""""""""""""""""""""""
" Vim Over
""""""""""""""""""""""""""""""
nmap <Leader>s :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
vmap <Leader>s y:OverCommandLine<CR>%s/<C-v>//g<Left><Left>

""""""""""""""""""""""""""""""
" Yankround
""""""""""""""""""""""""""""""
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 50
nnoremap <Leader><C-p> :<C-u>CtrlPYankRound<CR>

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

""""""""""""""""""""""""""""""
" Slim
""""""""""""""""""""""""""""""
augroup slim
  au!
  au BufReadPost *.slim set ft=slim
augroup END

nmap ! :Switch<CR>

""""""""""""""""""""""""""""""
" golang
""""""""""""""""""""""""""""""
inoremap <Nul> <C-x><C-o>
set completeopt-=preview
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif
auto BufWritePre *.go Fmt
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.go = '[^.[:digit:] *\t]\.\w*'
