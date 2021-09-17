
set nocompatible                                       " be iMproved, required
filetype off                                           " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Keep Plugins between vundle#begin/end.
call vundle#begin()

   Plugin 'VundleVim/Vundle.vim'                       " Plugin manager
   Plugin 'godlygeek/tabular'                          " Align text
   Plugin 'tpope/vim-fugitive'                         " Allows git commands
   Plugin 'jreybert/vimagit'                           " Emacs magit for vim
   Plugin 'tpope/vim-commentary'                       " Comment out lines
   Plugin 'jlanzarotta/bufexplorer'                    " Buffer Explorer
   Plugin 'rbgrouleff/bclose.vim'                      " Close buffer not window
   Plugin 'scrooloose/nerdtree'                        " Nerdtree
   Plugin 'iamcco/markdown-preview.nvim'               " Markdown preview
   Plugin 'vimwiki/vimwiki', { 'branch': 'dev' }       " Vim wiki note taking
   Plugin 'neoclide/coc.nvim', {'branch': 'release'}   " Line completion
   Plugin 'vim-lastplace'                              " Opens last place edited
"{{ Syntax Highlighting and Colors }}
   Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'    " Highlighting Nerdtree
   Plugin 'vim-python/python-syntax'                   " Highlighting Python
   Plugin 'ap/vim-css-color'                           " Color previews for CSS
   Plugin 'itchyny/lightline.vim'                      " Lightline statusbar
   Plugin 'ryanoasis/vim-devicons'                     " Icons for Nerdtree (*last)

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
""""""""""""""""""""""""""""""""""""""""""""""
" => Brief help
""""""""""""""""""""""""""""""""""""""""""""""
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins
" :PluginUpdate     - to update or refresh
" :PluginClean      - confirms removal of unused plugins
" see :h vundle for more details or wiki for FAQ

         " Put your non-Plugin stuff after this line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=UTF-8
set background=dark
set termguicolors
let g:rehash256 = 1
syntax enable
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
set path+=**                    " Searches current directory recursively.
set wildmenu                    " Display all matches when tab complete.
set wildmode=longest,list,full  "should display commands
set ignorecase                  " Case insensitive
set incsearch                   " Incremental search
set smartcase                   " Use case if anycaps used
set hlsearch                    " Search highlighting
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set number                      " Display line numbers
set relativenumber              " Display line numbers
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
set so=7                        " Keep 7 lines visable when scrolling
set history=999                 " Increase history (default = 20)
set autoread                    " reload files if changed externally
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key-bindings *note- leave right uncommeted,seen as command
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mapped leader to <'>
let mapleader="'"
" move vertically by visual line (don't skip wrapped lines)
nnoremap k gk
nnoremap j gj
noremap <Up> gk
noremap <Down> gj
" changes cursor to a bar when in insert mode 
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" open command edit window everytime
nnoremap : q:i
nnoremap / q/i
" => Open terminal inside Vim
map <Leader>tt :vert term<CR>
" quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>
" close buffer not window
nnoremap Q :Bclose<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick write to file 
nmap <leader>w :w!<cr>
" visualy select & move lines with <shift>
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
" quickly add ` around a word
map \` i`<Esc>ea`<Esc>
" Duplicate lines
noremap <C-S-Up> YP
noremap <C-S-Down> YP
" Jump to the start or end of line without leaving the home row
noremap H ^
noremap L $
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sources .vimrc after every write or save
autocmd! bufwritepost ~/.vimrc source ~/.vimrc
" open vimrc
map <leader>e :e! ~/.vimrc<cr>
" source vimrc
map <leader>s :source ~/.vimrc<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => search and replace selected text
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrl-r in v mod will be asked for replacment
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
" after search hit enter again to remove highlight
nnoremap <silent> <CR> :nohlsearch<CR><CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright
set expandtab                   " Use spaces instead of tabs.
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h           " focus moves left
nnoremap <C-j> <C-w>j           " focus moves down
nnoremap <C-k> <C-w>k           " focus moves up
nnoremap <C-l> <C-w>l           " focus moves right
" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
"" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight LineNr           ctermfg=8    ctermbg=none    cterm=none
highlight CursorLineNr     ctermfg=7    ctermbg=8       cterm=none
highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
highlight Statement        ctermfg=2    ctermbg=none    cterm=none
highlight Directory        ctermfg=4    ctermbg=none    cterm=none
highlight StatusLine       ctermfg=7    ctermbg=8       cterm=none
highlight StatusLineNC     ctermfg=7    ctermbg=8       cterm=none
highlight NERDTreeClosable ctermfg=2
highlight NERDTreeOpenable ctermfg=8
highlight Comment          ctermfg=4    ctermbg=none    cterm=italic
highlight Constant         ctermfg=12   ctermbg=none    cterm=none
highlight Special          ctermfg=4    ctermbg=none    cterm=none
highlight Identifier       ctermfg=6    ctermbg=none    cterm=none
highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
highlight String           ctermfg=12   ctermbg=none    cterm=none
highlight Number           ctermfg=1    ctermbg=none    cterm=none
highlight Function         ctermfg=1    ctermbg=none    cterm=none
" highlight WildMenu         ctermfg=0       ctermbg=80      cterm=none
" highlight Folded           ctermfg=103     ctermbg=234     cterm=none
" highlight FoldColumn       ctermfg=103     ctermbg=234     cterm=none
" highlight DiffAdd          ctermfg=none    ctermbg=23      cterm=none
" highlight DiffChange       ctermfg=none    ctermbg=56      cterm=none
" highlight DiffDelete       ctermfg=168     ctermbg=96      cterm=none
" highlight DiffText         ctermfg=0       ctermbg=80      cterm=none
" highlight SignColumn       ctermfg=244     ctermbg=235     cterm=none
" highlight Conceal          ctermfg=251     ctermbg=none    cterm=none
" highlight SpellBad         ctermfg=168     ctermbg=none    cterm=underline
" highlight SpellCap         ctermfg=80      ctermbg=none    cterm=underline
" highlight SpellRare        ctermfg=121     ctermbg=none    cterm=underline
" highlight SpellLocal       ctermfg=186     ctermbg=none    cterm=underline
" highlight Pmenu            ctermfg=251     ctermbg=234     cterm=none
" highlight PmenuSel         ctermfg=0       ctermbg=111     cterm=none
" highlight PmenuSbar        ctermfg=206     ctermbg=235     cterm=none
" highlight PmenuThumb       ctermfg=235     ctermbg=206     cterm=none
" highlight TabLine          ctermfg=244     ctermbg=234     cterm=none
" highlight TablineSel       ctermfg=0       ctermbg=247     cterm=none
" highlight TablineFill      ctermfg=244     ctermbg=234     cterm=none
" highlight CursorColumn     ctermfg=none    ctermbg=236     cterm=none
" highlight CursorLine       ctermfg=none    ctermbg=236     cterm=none
" highlight ColorColumn      ctermfg=none    ctermbg=236     cterm=none
" highlight Cursor           ctermfg=0       ctermbg=5       cterm=none
" highlight htmlEndTag       ctermfg=114     ctermbg=none    cterm=none
" highlight xmlEndTag        ctermfg=114     ctermbg=none    cterm=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COC plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't pass messages to |ins-completion-menu|. 
set shortmess+=c 
" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" To make <cr> select the first completion item
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" use tab to make selections ...was taken down for debugging
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Markdown-Preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mkdp_auto_start = 0                    " Turns off auto preview
" specify browser to open preview page       " default= ''
let g:mkdp_browser = 'surf'                  " Uses surf for preview
nmap <Leader>mk <Plug>MarkdownPreview        " Previews .md files
nmap <Leader>nm <Plug>MarkdownPreviewStop    " Kills the preview
nmap <Leader>mp <Plug>MarkdownPreviewToggle  " Preview toggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The lightline.vim theme
let g:lightline = {
      \ 'colorscheme': 'deus',
      \ }

" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_highlight_all = 1

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar.
