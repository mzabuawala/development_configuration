" Set the backslash as the leader key.
let mapleader = "\\" 

" Press \\ to jump back to the last cursor position.
nnoremap <leader>\ ``

" Disale ArrowKeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" Command to move among tabs in Konsole-style (ALT + Arrowkeys)
map <S-Right> gt
map <S-Left> gT

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Color schema
" colorscheme gruvbox

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on
set re=0

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" ============================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" Color scheme inspired by Intellij
Plugin 'morhetz/gruvbox'

" TypeScript syntax hightlight
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'neoclide/coc.nvim'

" NerdTree plugin
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Git Gutter
Plugin 'airblade/vim-gitgutter'

" Fuzzy search
Plugin 'ctrlpvim/ctrlp.vim'

" Colorize paranthesis
Plugin 'frazrepo/vim-rainbow'

" Multiple cursors
" https://github.com/terryma/vim-multiple-cursors
" Plugin 'terryma/vim-multiple-cursors'

" Vim Preetier for JS & CSS
Plugin 'prettier/vim-prettier'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" =============================================================
"
" Enable Color brackets
let g:rainbow_active = 1

" AirLine config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='angr'
let g:airline_powerline_fonts = 1


" Nerdtree plugin
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" autocmd BufWinEnter * NERDTreeMirror
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Open file in new tab
let NERDTreeMapOpenInTab='<Tab>'

" Git gutter
" https://github.com/airblade/vim-gitgutter

set signcolumn=yes

nmap ]h <Plug>(GitGutterNextHunk) "same as default
nmap [h <Plug>(GitGutterPrevHunk) "same as default

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" Preetier settings
let g:prettier#quickfix_enabled = 0
"autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1

"#############################
" CoC language server settings
"#############################
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" CntP - fuzzy search settings 
" #############################
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"
" ===================VIM SCRIPTS================= 
"
"
" This will enable code folding.
" Use the marker method of folding.
" zo to open a single fold under the cursor.
" zc to close the fold under the cursor.
" zR to open all folds.
" zM to close all folds.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

function DelayedSetThemes(timer)
    colorscheme gruvbox
endfunction
let timer=timer_start(100,'DelayedSetThemes')
