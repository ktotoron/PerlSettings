filetype plugin on

" vundleを使うためのおまじない
set rtp+=~/.vim/vundle/
call vundle#rc('~/.vim/bundle')

" 使うプラグインを指定
Bundle 'petdance/vim-perl'
Bundle 'hotchpotch/perldoc-vim'
Bundle 'Shougo/neocomplcache'
Bundle 'thinca/vim-quickrun'



" --------------------------------------------------
" Disable AutoComplPop.
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


" --------------------------------------------------

syntax on
set nu

set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する



