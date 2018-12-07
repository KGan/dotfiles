set shell=/bin/sh
set clipboard=unnamed
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'google/vim-maktaba'
" code formatting
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" " `:help :Glaive` for usage.
Plug 'google/vim-glaive'

" Coloring, themes, syntax highlights
" " general
Plug 'flazz/vim-colorschemes'
Plug 'nanotech/jellybeans.vim'
Plug 'crusoexia/vim-monokai'
Plug 'altercation/vim-colors-solarized'
Plug 'nathanaelkane/vim-indent-guides'
" " Web
Plug 'ap/vim-css-color'
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'
Plug 'jelera/vim-javascript-syntax'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'scrooloose/syntastic'
" " cpp
Plug 'octol/vim-cpp-enhanced-highlight'
" " swift
Plug 'keith/swift.vim'
Plug 'toyamarinyon/vim-swift'
" " scala
Plug 'derekwyatt/vim-scala'
" " ruby
Plug 'tpope/vim-rails'

" Information/status
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'henrik/vim-indexed-search'

" Navigation/Search
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'mileszs/ack.vim'
" " in-file
Plug 'justinmk/vim-sneak'

" TMUX
Plug 'tmux-plugins/vim-tmux-focus-events'

" sessions
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Code completion + snippets
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
"Plug 'Shougo/deoplete.nvim'
"Plug 'zchee/deoplete-clang'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

syntax on
let g:solarized_termcolors=256
let g:solarized_visibility="high"
let g:ycm_global_ycm_extra_conf="/Users/kevingan/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_extra_conf_vim_data=['&filetype']
let g:indent_guides_enable_on_vim_startup = 1
let g:session_autosave = 'no'

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
inoremap <C-i> <C-x><C-i>
inoremap <C-j> <Esc>a<C-R>=snipMate#TriggerSnippet()<CR>
" nnoremap <C-j> a<C-R>=snipMate#TriggerSnippet()<CR>

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

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnips                        = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
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

""""""""""""""""""""""" INDENTATION HELPER
" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>
""""""""""""""""" END INDENTATION HELPER

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
