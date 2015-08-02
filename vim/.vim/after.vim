" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------

set history=1000                      " lots of command line history
set undofile                          " save undos, after quit vim
set noswapfile                        " do not create swapfiles
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set undodir=~/.vim/tmp/undo//
set cf                                " error files / jumping
set ffs=unix,dos,mac                  " support these files
set isk+=_,$,@,%,#,-                  " none word dividers
set viminfo='1000,f1,:100,@100,/20
set modeline                          " make sure modeline support is enabled
set autoread                          " reload files (no local changes only)
set tabpagemax=50                     " open 50 tabs max
set hidden                            " no need to save when switching buffers

" ---------------------------------------------------------------------------
" Colors / Theme
" ---------------------------------------------------------------------------

set t_Co=256
syntax on
colorscheme kolor
set colorcolumn=80                    " draw vertical line

" ----------------------------------------------------------------------------
" UI
"  ----------------------------------------------------------------------------

set ruler                             " show the cursor position all the time
set relativenumber
set number
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)
set cursorline                        " show vertical line at cursor position
set cursorcolumn                      " show horizontal line at cursor position

" ----------------------------------------------------------------------------
" Visual Cues
" ----------------------------------------------------------------------------

set showmatch              " brackets/braces that is
set mat=5                  " duration to show matching brace (1/10 sec)
set incsearch              " do incremental searching
set hlsearch               " highlight searches
set laststatus=2           " always show the status line
set ignorecase             " ignore case when searching
set hlsearch               " highlight searching word
set visualbell             " shut the fuck up

" ----------------------------------------------------------------------------
" Text Formatting
" ----------------------------------------------------------------------------

set autoindent             " automatic indent new lines
set smartindent            " be smart about it
set nowrap                 " do not wrap lines
set softtabstop=2          " yep, two
set shiftwidth=2           " ..
set tabstop=4              " number of spaces in a tab
set expandtab              " expand tabs to spaces
set nosmarttab             " fuck tabs
set formatoptions+=n       " support for numbered/bullet lists
set textwidth=80           " wrap at 80 chars by default
set virtualedit=block      " allow virtual edit in visual block ..

" Removes trailing spaces on save
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

au FileWritePre   * :call TrimWhiteSpace()
au FileAppendPre  * :call TrimWhiteSpace()
au FilterWritePre * :call TrimWhiteSpace()
au BufWritePre    * :call TrimWhiteSpace()

" ----------------------------------------------------------------------------
"  Motions
" ----------------------------------------------------------------------------

runtime macros/matchit.vim  " % will match also ruby blocks

" ----------------------------------------------------------------------------
"  Mappings
" ----------------------------------------------------------------------------

" remap <LEADER> to ',' (instead of '\')
let mapleader = ","

" quit Hlsearch using q
noremap q :noh<cr>

" Escape from insert mode by typing jj
inoremap jj <ESC>

" Cycle through buffers
nnoremap <S-k> :bn<cr>
nnoremap <S-j> :bp<cr>

" Resize by arrows in normal mode
nnoremap <left> :vertical resize +5<cr>
nnoremap <right> :vertical resize -5<cr>

" Extra map vertical split
nnoremap <leader>v <C-w>v<C-w>l

" CtrlP extra settings
nnoremap <leader>, :CtrlP<cr>
nnoremap <leader>. :CtrlP<cr>

let g:ctrlp_max_height = 40
" jump to buffer in the same tab if already open
let g:ctrlp_switch_buffer = 1
" if in git repo - use git file listing command, should be faster
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --exclude-standard -cod']
" search only within path where you opened vim
let g:ctrlp_working_path_mode = 0

" map NERDTree
nnoremap <C-p> :NERDTreeToggle<cr>

" NERDCommenter
nmap <leader>/ :call NERDComment(0, "invert")<cr>

" Fugitive
"nnoremap <leader>ga :Git add %:p<cr><cr>
"nnoremap <leader>gs :Gstatus<cr>
"nnoremap <leader>gc :Gcommit -v -q<cr>
"nnoremap <leader>gd :Gvdiff<cr>
"nnoremap <leader>go :Git checkout<Space>
"nnoremap <leader>gp :Dispatch! git push<cr>
"nnoremap <leader>gl :Dispatch! git pull<cr>
"nnoremap <leader>gb :Gblame<cr>
command Ga execute ":Git add %:p"
command Gs execute ":Gstatus"
command Gc execute ":Gcommit -v -q"
command Gd execute ":Gvdiff"
command Gco execute ":Git checkout"
command Gb execute ":Gblame"

" Rubocop
command W execute ":w | :RuboCop"

" ---------------------------------------------------------------------------
" Plugins config
" ---------------------------------------------------------------------------

" Rubocop config
let g:vimrubocop_config = '~/rubocop.yml'

" ACK config
let g:ackprg = 'ag --nogroup --nocolor --column'
