set shell=/bin/sh
set clipboard=unnamed
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" " `:help :Glaive` for usage.
Plug 'google/vim-glaive'

Plug 'altercation/vim-colors-solarized'
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color'
Plug 'groenewege/vim-less'
Plug 'jelera/vim-javascript-syntax'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'nanotech/jellybeans.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'scrooloose/syntastic'
Plug 'rking/ag.vim'
Plug 'mileszs/ack.vim'

Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'keith/swift.vim'
Plug 'toyamarinyon/vim-swift'

Plug 'derekwyatt/vim-scala'

Plug 'tpope/vim-rails'

Plug 'justinmk/vim-sneak'

Plug 'crusoexia/vim-monokai'

Plug 'henrik/vim-indexed-search'

Plug 'tpope/vim-obsession'

Plug 'nathanaelkane/vim-indent-guides'

 Plug 'Valloric/YouCompleteMe'
"Plug 'Shougo/deoplete.nvim'
"Plug 'zchee/deoplete-clang'

call plug#end()

syntax on
let g:solarized_termcolors=256
let g:solarized_visibility="high"
let g:ycm_global_ycm_extra_conf="/Users/kevingan/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_extra_conf_vim_data=['&filetype']
let g:indent_guides_enable_on_vim_startup = 1

set background=dark
colorscheme solarized
let mapleader=','
set tabstop=2 shiftwidth=2 expandtab
set incsearch
set autoread
set directory-=.
set laststatus=2
set ruler
set number

" Before this remapping, make sure we dont have such long timeouts
set timeoutlen=900 ttimeoutlen=10
inoremap <C-f> <C-x><C-f>
inoremap <C-e> <C-o>$
inoremap <C-b> <C-o>b
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
inoremap <C-i> <C-x><C-i>

map! kj <ESC>
nmap <C-n> :NERDTreeToggle<CR>
cnoremap %% <C-R>=expand('%:h').'/'<cr>
nmap <leader>k ?^\S<CR>
nmap <leader>j /^\S<CR>
nmap <leader>e :edit %%
nmap <leader>v :view %%
nmap <leader><leader> <c-^>
nmap <leader>n :NERDTreeFind<CR>
"Toggle ignore case
nmap <leader>i :set ic!<CR>
nnoremap <buffer> <leader>c :edit %:h/BUILD<CR>
"nnoremap <leader>f <C-P><C-\>w
nnoremap <leader>p :set invpaste paste?<CR>
"splitting
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

set colorcolumn=101
"/splitting

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=green
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
set cursorline
set relativenumber
set number

set autoindent
filetype plugin indent on
"javascript concealments
set conceallevel=1
set concealcursor=""
set cole=1
let g:javascript_conceal = 1
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
set backspace=indent,eol,start
set cinoptions+=:0

let g:syntastic_javascript_checkers = ['eslint', 'swiftpm', 'swiftlint']

let g:ycm_key_invoke_completion = '<C-n>'
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_detailed_diagnostics = '<leader>d'

"" set omnifunc=syntaxcomplete#Complete
"" let g:EclimCompletionMethod = 'omnifunc'
"" let g:SuperTabDefaultCompletionType = 'context'

let g:sneak#streak = 1

let g:jsx_ext_required = 0

let g:clang_library_path='/usr/local/opt/llvm/lib'

set pastetoggle=<F2>
set showmode

" mouse usage
set mouse=a
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

"" OneDark color support
""Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
""If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
""(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
"  if (has("nvim"))
"    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"  endif
"  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"  if (has("termguicolors"))
"    set termguicolors
"  endif
"endif

set showcmd
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_working_path_mode = 0
if executable('ag')

	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
	let g:ctrlp_use_caching = 0
  let g:ackprg = 'ag --vimgrep'

endif
" overwite ag with git ls
let g:ctrlp_user_command = {
      \ 'types': {
   \ 1: ['.git', 'cd %s && git ls-files --recurse-submodules --cached --exclude-standard ']
   \ },
   \  'fallback': g:ctrlp_user_command
   \}
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" buildifier path for codefmt
call glaive#Install()
Glaive codefmt buildifier_executable='/Users/kevingan/go/bin/buildifier'

" autoformat group
augroup autoformat_settings
  autocmd!
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
augroup END

augroup buffer_local_formatting_init
  " set the buffer local variable. It will always init to 1 since we have the
  " augroup autoformat_settings above
  au BufEnter * if !exists('b:auto_format_buffer') | let b:auto_format_buffer = 1 | endif
augroup END

function! ToggleAutoFormatBuffer()
  if b:auto_format_buffer
    NoAutoFormatBuffer
    let b:auto_format_buffer = 0
    echom "AutoFormatBuffer DISABLED"
  else
    if &filetype == "bzl"
      AutoFormatBuffer buildifier
    elseif &filetype == "c" || &filetype == "cpp" || &filetype == "proto" || &filetype == "javascript"
      AutoFormatBuffer clang-format
    elseif &filetype == "html" || &filetype == "css" || &filetype == "json"
      AutoFormatBuffer js-beautify
    elseif &filetype == "java"
      AutoFormatBuffer google-java-format
    elseif &filetype == "python"
      AutoFormatBuffer yapf
    endif
    let b:auto_format_buffer = 1
    echom "AutoFormatBuffer ENABLED"
  endif
endfunction
nnoremap <leader>f :call ToggleAutoFormatBuffer()<CR>



augroup filetype_autodetect
  au BufRead,BufNewFile BUILD set filetype=bzl
  au BufRead,BufNewFile *.pb.txt set filetype=yaml
  au BufRead,BufNewFile *.rc set filetype=yaml
  au BufRead,BufNewFile CROSSTOOL set filetype=yaml
  au BufRead,BufNewFile *.glsl set filetype=c
  au BufRead,BufNewFile *.geojson set filetype=json
augroup END

au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * checktime
