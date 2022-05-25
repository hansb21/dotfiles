"symple
" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu


filetype plugin indent on
syntax on

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2


let NERDTreeShowHidden=1
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Plugins
call plug#begin('~/.local/share/nvim/site/autoload/')  
	Plug 'tpope/vim-sensible'
	Plug 'preservim/nerdtree'
  Plug 'sheerun/vim-polyglot'
  Plug 'jiangmiao/auto-pairs'
  Plug 'lukas-reineke/indent-blankline.nvim'
  " Completion / linters / formatters
  Plug 'neoclide/coc.nvim',  {'branch': 'release'}
  Plug 'plasticboy/vim-markdown'

  " Git
    Plug 'airblade/vim-gitgutter'	
call plug#end()

"TrueColor
if has('nvim')
  set t_8f=␛[38;2;%lu;%lu;%lum
  set t_8b=␛[48;2;%lu;%lu;%lum
  set termguicolors
endif
colorscheme cwcolors
syntax enable

" Recommended, but optionally add:

" Set tag file if REPOBASE is set. This assumes you set the environment
" variable REPOBASE to reflect the base directory of your current project
" and generated your ctags file as $REPOBASE-objdir/tags.
if $REPOBASE != ""
  set tags=$REPOBASE-objdir/tags
endif

" Bind <F10> to a function that shows the syntax highlighting group under the cursor.
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") .
\       '> trans<' . synIDattr(synID(line("."),col("."),0),"name") .
\       "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Highlight trailing spaces.
let c_space_errors=1
" Don't highlight the Next match while typing a regular expression search.
set noincsearch
