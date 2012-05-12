" ==========================================================================
" http://www15.ocn.ne.jp/~tusr/vim/options_help.html#visualbell
" ==========================================================================

" ==========================================================================
" Vundle
" ==========================================================================
set nocompatible               " be iMproved
filetype off                   " required!
"filetype plugin indent off

" for Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'quickrun'
"Bundle 'rails.vim'
"Bundle 'autocomp.vim'
Bundle 'petdance/vim-perl'
Bundle 'hotchpotch/perldoc-vim'
Bundle 'thinca/vim-quickrun'
Bundle 'perlomni.vim'
Bundle 'neocomplcache'
Bundle 'unite.vim'
Bundle 'neocomplcache'

" for NeoBundle
"if has('vim_starting')
"    set runtimepath+=~/.vim/neobundle.vim.git
"    call neobundle#rc(expand('~/.vim/.bundle/'))
"endif
"
"NeoBundle 'git://github.com/Shougo/neocomplcache.git'
"NeoBundle 'git://github.com/Shougo/neocomplcache-snippets-complete.git'
"
"filetype plugin indent on

" ==========================================================================
" for perlomni
" ==========================================================================
filetype on
filetype plugin on
filetype indent on
inoremap <C-p> <C-x><C-o>

" ==========================================================================
" basic
" http://d.hatena.ne.jp/superbrothers/20090907/1252334723
" ==========================================================================
set nocompatible    "Use Vim defaults instead of 100% vi compatibility
"set visualbell     "エラー時に、ビープ音に代わり画面フラッシュ
set noerrorbells    "エラー時の、ビープ音抑制
set novisualbell    "エラー時の、画面フラッシュ抑制
set autoread        "外部のエディタで編集中のファイルが変更されたら、自動的に読み直す
set history=100     "コロンコマンドを記録する数 
set hidden          "変更中のファイルでも、保存しないで他のファイルを表示することができるようにする。
"set encoding=utf-8 "デフォルトでUTF-8、セットしたら文字化けした。代わりに文字コード自動認識後述。

" ==========================================================================
" display
" ==========================================================================
set number          "行番号を表示する
set ruler           "ルーラー表示
set cmdheight=2     "コマンドライン2行
set laststatus=2    "常にステータスラインを表示
set showcmd         "コマンドをステータスラインに表示
set linespace=0     "行間
set wildmenu        "補完候補の表示

"起動時にフルスクリーン
if has("gui_running")
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
endif

" ==========================================================================
" color
" --------------------------------------------------------------------------
" color scheme -> C:\home\vimfiles\colors以下に定義ファイル配置
" ==========================================================================
:colorscheme desert
":colorscheme wombat
:syntax on      "強調表示


" ハイライトを有効にする
if &t_Co > 2 || has('gui_running')
  syntax on
endif


" ==========================================================================
" search
" ==========================================================================
set ignorecase      "検索で、大文字小文字を区別しない
set smartcase       "検索で小文字なら大文字を無視、大文字なら無視しない
set wrapscan        "検索時にファイルの最後まで行ったら最初に戻る
set incsearch       "インクリメンタルサーチ
set hlsearch        "検索文字の強調表示


" ==========================================================================
" edit
" ==========================================================================
set autoindent                  "自動的にインデントする
set smartindent                 "新しい行を作ったときに高度な自動インデントを行うの数だけインデントする。
set showmatch matchtime=1       "括弧の対応表示時間
set backspace=indent,eol,start    "バックスペースの挙動
"set cinoptions+=:0             "Cインデントの設定
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap <> <><Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `' `'<Left>
noremap <C-C> <Esc>
noremap! <C-C> <Esc>



" ==========================================================================
" tab
" ==========================================================================
set expandtab           "タブをスペースに置き換える
set tabstop=4           "ファイル内の <Tab> が対応する空白の数
set shiftwidth=4        "自動インデントの各段階に使われる空白の数
set smarttab            "行頭の余白内で Tab を打ち込むと、'shiftwidth' 
set softtabstop=0       "<Tab>を押した時に挿入される空白の量(0:ts'で指定した量
set shiftround          "インデントを'shiftwidth' の値の倍数に丸める
set cindent             "インデント


" ==========================================================================
" ruby/rails用 http://blog.blueblack.net/item_133
" ==========================================================================
" imap <C-Space> <C-x><C-o>	"<C-Space>でomni補完


" ==========================================================================
" まだ
" ==========================================================================


"スプラッシュ(起動時のメッセージ)を表示しない
"set shortmess+=I

"Windowsでディレクトリパスの区切り文字表示に / を使えるようにする
set shellslash

"タブを設定
"set ts=4 sw=4 sts=4

" タイトルをウィンドウ枠に表示
set title


"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]



"画面最後の行をできる限り表示する
set display=lastline
"Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:^\ ,trail:~

" --------------------------------------------------------------------------
" 基本
" --------------------------------------------------------------------------
" クリップボードをWindowsと連携
set clipboard=unnamed
" マウスでの操作を有効にする
"set mouse = a
" screen対応
"set ttymouse = xterm2





" --------------------------------------------------------------------------
" オートコマンド設定
" --------------------------------------------------------------------------
" ウィンドウを最大化して起動
"au GUIEnter * simalt ~x    "このバージョンではこのコマンドは利用できません。

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0
"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4

".txtファイルで自動的に日本語入力ON
au BufNewFile,BufRead *.txt set iminsert=2
".rhtmlと.rbでタブ幅を変更
au BufNewFile,BufRead *.rhtml   set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2

"全角スペースを視覚化(下に同内容設定)
"highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
"au BufNewFile,BufRead * match ZenkakuSpace /　/


" ==========================================================================
" for python
" ==========================================================================
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4


" ==========================================================================
" neocomplcache
" ==========================================================================

" sable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

 " Use smartcase.
 let g:neocomplcache_enable_smart_case = 1
 " Use camel case completion.
 let g:neocomplcache_enable_camel_case_completion = 1
 " Select with <TAB>
 inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

 let g:neocomplcache_ctags_arguments_list = {
       \ 'perl' : '-R -h ".pm"'
             \ }

             let g:neocomplcache_snippets_dir = "~/.vim/snippets"
             " Define dictionary.
             let g:neocomplcache_dictionary_filetype_lists = {
                     \ 'default'    : '',
                         \ 'perl'       : $HOME . '/.vim/dict/perl.dict'
                                 \ }

                                 " Define keyword.
                                 if !exists('g:neocomplcache_keyword_patterns')
                                   let g:neocomplcache_keyword_patterns = {}
                                   endif
                                   let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

                                   " for snippets
                                   imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
                                   smap <C-k> <Plug>(neocomplcache_snippets_expand)
    



" ==========================================================================
" 文字コードの自動認識
" --------------------------------------------------------------------------
" http://www.kawaz.jp/pukiwiki/?vim
" ==========================================================================
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif





" ==========================================================================
" Vimスクリプト
" ==========================================================================

" ==========================================================================
"ファイルを開いたら前回のカーソル位置へ移動
" ==========================================================================
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END

" ==========================================================================
"挿入モード時、ステータスラインの色を変更
" ==========================================================================
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif
let s:slhlcmd = ''

function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction


" ==========================================================================
"全角スペースを表示
" ==========================================================================
"コメント以外で全角スペースを指定しているので、scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"強調表示されない場合、ここでscriptencodingを指定するとうまくいく事があります。
"scriptencoding cp932
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
  "全角スペースを明示的に表示する
  silent! match ZenkakuSpace /　/
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,BufEnter * call ZenkakuSpace()
  augroup END
endif

