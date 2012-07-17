"----------------------------------------
" NeoBundle
"----------------------------------------
set nocompatible
filetype plugin indent off
if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim
  call neobundle#rc(expand('~/.vim/.bundle/'))
endif

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'othree/eregex.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/mkdpreview-vim'
NeoBundle 'mrtazz/simplenote.vim'
NeoBundle 'jcf/vim-latex'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'L9'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'bbommarito/vim-slim'
NeoBundle 'vim-scripts/JSON.vim'
NeoBundle 'vim-scripts/jQuery'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'

filetype plugin indent on



"----------------------------------------
" User Runtime Path Setting
"----------------------------------------
if isdirectory($HOME . '/.vim')
  let $MY_VIMRUNTIME = $HOME.'/.vim'
elseif isdirectory($HOME . '\vimfiles')
  let $MY_VIMRUNTIME = $HOME.'\vimfiles'
elseif isdirectory($VIM . '\vimfiles')
  let $MY_VIMRUNTIME = $VIM.'\vimfiles'
endif



"----------------------------------------
" Script Encoding
"----------------------------------------
set encoding=utf-8
silent! source $MY_VIMRUNTIME/pluginjp/encode.vim
scriptencoding utf-8



"----------------------------------------
" System Setting
"----------------------------------------
set nowritebackup
set nobackup
set directory=~/.vim/vimbackup
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
if has('mouse')
  set mouse=a
endif



"----------------------------------------
" Search
"----------------------------------------
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
set iskeyword=a-z,A-Z,48-57,_,-,>



"----------------------------------------
" Visual Setting
"----------------------------------------
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





"----------------------------------------
" diff/patch
"----------------------------------------
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



"----------------------------------------
" Normal Mode
"----------------------------------------
" Move
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>

" No Highlight
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

" New Line
nnoremap <CR> :<C-u>call append(expand('.'), '')<CR>j

" Open New Tab
nnoremap gn :tabnew<CR>

" Move Tab
nnoremap <C-Tab> :tabnext<CR>
nnoremap <C-S-Tab> :tabprevious<CR>

" Mark
nnoremap gm `

if has('folding')
  nnoremap <expr> l foldlevel(line('.')) ? "\<Right>zo" : "\<Right>"
endif

"----------------------------------------
" Indert Mode
"----------------------------------------


"----------------------------------------
" Visual Mode
"----------------------------------------
vnoremap v <ESC><S-V>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
vnoremap # "zdi#{<C-R>z}<ESC>
vnoremap - "zdi<!-- <C-R>z--><ESC>


"----------------------------------------
" Command Mode
"----------------------------------------
command! -nargs=* Eutf8 set fenc=utf-8
command! -nargs=* Esjis set fenc=shift_jis
command! -nargs=* Eeuc set fenc=euc-jp
command! -nargs=* EEutf8 e ++enc=utf-8
command! -nargs=* EEsjis e ++enc=shift_jis
command! -nargs=* EEeuc e ++enc=euc-jp
command! -nargs=* Eunix set ff=unix
command! -nargs=* Edos set ff=dos
command! -nargs=* Emac set ff=mac



"----------------------------------------
" Vim Script
"----------------------------------------
""""""""""""""""""""""""""""""
" Restore cursor
""""""""""""""""""""""""""""""
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END


""""""""""""""""""""""""""""""
" Zenkaku Space
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
  silent! match ZenkakuSpace /　/
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,BufEnter * call ZenkakuSpace()
  augroup END
endif


""""""""""""""""""""""""""""""
" Automatically replace "。" with "．" in Tex
""""""""""""""""""""""""""""""
function! s:subsitute_interpunction()
  let pos = getpos(".")
  silent execute "try | %s/。/．/g | catch | endtry"
  silent execute "try | %s/、/，/g | catch | endtry"
  call setpos(".", pos)
endfunction

autocmd! BufWrite *.tex call s:subsitute_interpunction()


"----------------------------------------
" Plugin Settings
"----------------------------------------
""""""""""""""""""""""""""""""
" neocomplcache
""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
command! -nargs=* Esnippets NeoComplCacheEditSnippets

""""""""""""""""""""""""""""""
" VimShell
""""""""""""""""""""""""""""""
nnoremap <silent> ,s :VimShell<CR>

""""""""""""""""""""""""""""""
" unite.vim
""""""""""""""""""""""""""""""
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_filename_format = ""
" Exit Unite
nmap <buffer> <ESC> <Plug>(unite_exit)
" Bookmark
let g:unite_source_bookmark_directory = $HOME . '/.unite/bookmark'
" Buffer
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" File
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" Recent File
nnoremap <silent> ,ur :<C-u>Unite file_mru<CR>
" Marks
nnoremap <silent> ,um :<C-u>Unite mark<CR>

""""""""""""""""""""""""""""""
" VimFiler
""""""""""""""""""""""""""""""
" Default Filer
let g:vimfiler_as_default_explorer = 1
" Disable Safety Mode
let g:vimfiler_safe_mode_by_default = 0
" Open Directory in Current Buffer
nnoremap <silent> <Leader>e :<C-u>VimFilerBufferDir<CR>

""""""""""""""""""""""""""""""
" vim-fugitive
""""""""""""""""""""""""""""""
nmap <silent> <Space>gc :Gcommit<CR>
nmap <silent> <Space>gw :Gwrite<CR>
nmap <silent> <Space>gr :Gread
nmap <silent> <Space>gb :Gblame<CR>
nmap <silent> <Space>gd :Gdiff<CR>
nmap <silent> <Space>gs :Gstatus<CR>

""""""""""""""""""""""""""""""
" operator-replace
""""""""""""""""""""""""""""""
nmap _ <Plug>(operator-replace)

""""""""""""""""""""""""""""""
" simplenote
""""""""""""""""""""""""""""""
let g:SimplenoteUsername = "hoge@gmail.com"
let g:SimplenotePassword = "***"
nmap ,sn :Simplenote -n<CR>
nmap ,sl :Simplenote -l<CR>
nmap ,su :Simplenote -u<CR>
nmap ,sd :Simplenote -d<CR>
nmap ,st :Simplenote -t<CR>

""""""""""""""""""""""""""""""
" open-browser
""""""""""""""""""""""""""""""
nmap <Leader>v <Plug>(openbrowser-smart-search)

""""""""""""""""""""""""""""""
" syntastic
""""""""""""""""""""""""""""""
let g:syntastic_javascript_chacker = 'jshint'

""""""""""""""""""""""""""""""
" zen-coding
""""""""""""""""""""""""""""""
let g:user_zen_expandabbr_key = '<c-e>'

""""""""""""""""""""""""""""""
" vim-coffee-script
""""""""""""""""""""""""""""""
"autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

""""""""""""""""""""""""""""""
" vim-powerline
""""""""""""""""""""""""""""""
let g:Powerline_symbols = 'fancy'
set t_Co=256

""""""""""""""""""""""""""""""
" latex-vim
""""""""""""""""""""""""""""""
let g:tex_flavor = 'latex'
au BufNewFile,BufRead *.tex,*.latex,*.sty,*.dtk,*.ltx,*.bbl setf tex
filetype plugin on
set grepprg=grep\ -nH\ $*
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_BibtexFlavor = 'jbibtex'
let g:Tex_ViewRule_dvi = 'xdvi'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_ViewRule_pdf = 'zathura'
