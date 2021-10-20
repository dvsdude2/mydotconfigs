
set nocompatible                                    "required
filetype off                                        "required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Keep Plugins between vundle#begin/end.
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'                      "Plugin manager
Plugin 'ervandew/supertab'                         "Tab select
Plugin 'tpope/vim-fugitive'                        "Git commands
Plugin 'jreybert/vimagit'                          "Git stagging 
Plugin 'tpope/vim-commentary'                      "Comment lines
Plugin 'jlanzarotta/bufexplorer'                   "Buf Explorer
Plugin 'ap/vim-buftabline'                         "Buf tab line 
Plugin 'rbgrouleff/bclose.vim'                     "Close buffer
Plugin 'scrooloose/nerdtree'                       "Nerdtree
Plugin 'axvr/org.vim'                              "Org. mode syntax
Plugin 'easymotion/vim-easymotion'                 "Snipe vim 
Plugin 'iamcco/markdown-preview.nvim'              "Markdown preview
Plugin 'vimwiki/vimwiki', { 'branch': 'dev' }      "Vim note taking
Plugin 'neoclide/coc.nvim', {'branch': 'release'}  "Line completion
Plugin 'vim-lastplace'                             "last edited
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'   "Hilight Ntree
Plugin 'vim-python/python-syntax'                  "Python syntax
Plugin 'ap/vim-css-color'                          "Color previews
Plugin 'itchyny/lightline.vim'                     "Statusbar
Plugin 'ryanoasis/vim-devicons'                    "Ntree icons*last

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
syntax enable
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=UTF-8
set background=dark
set termguicolors
let g:rehash256 = 1
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\
set path+=**                    "Searches subdirectory.
set wildmenu                    "Shows all matches in tab complete.
set wildmode=longest,list,full  "should display commands
set ignorecase                  "Case insensitive
set incsearch                   "Incremental search
set smartcase                   "Use case if anycaps used
set hlsearch                    "Search highlighting
set hidden                      "Needed to keep multi buffers open
set nobackup                    "No auto backups
set noswapfile                  "No swap
set number                      "Display line numbers
set relativenumber              "Display relative line numbers
set clipboard=unnamedplus       "Clipboard access to all programs.
set so=7                        "Keep 7 lines visable when scrolling
set history=999                 "Increase history (default = 20)
set autoread                    "reload files if changed externally
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key-bindings *leave right uncommeted,seen as command 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mapped leader to <'>
let mapleader = "'"
" changes cursor to a bar when in insert mode 
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" open command edit window everytime
nnoremap : q:i
nnoremap / q/i
" => Open terminal inside Vim
nnoremap <Leader>tt :vert term<CR>
" quickly open a buffer for scribble
noremap <leader>q :e ~/buffer<cr>
" close buffer not window
nnoremap Q :Bclose<CR>
" buffer tabbing
noremap <Leader>bb :bnext<CR>
noremap <Leader>bg :bprev<CR>
" Underline the current line, based on its length.
noremap <silent> <leader>ul mmyypVr-<Esc>`m
" Switch to current dir
noremap <Leader>scd :cd %:p:h<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick back to normal mode
inoremap jh <esc>
" yank to end of line
noremap Y y$
" Quick write to file 
noremap <leader><space> :w!<cr>
" quickly add ` around a word
nnoremap \` i`<Esc>ea`<Esc>
" Duplicate lines
nnoremap <C-S-Up> YP
nnoremap <C-S-Down> YP
" Jump to the start or end of line without leaving the home row
noremap H ^
noremap L $
"delete all lines in the current buffer
nnoremap <leader>daa ggdG
" yank all lines in current buffer
nnoremap yY :%yank <c-r>=v:register<cr><cr>
" Quickly add empty lines
nnoremap <silent> <F10> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>
nnoremap <silent> <F9> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
" nnoremap <silent> <F10> :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
" nnoremap <silent> <F9> :<c-u>put =repeat(nr2char(10), v:count1)<cr>
" Quickly move current line
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>
" visualy select & move lines with <shift>
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
" Split line at cursor 
nnoremap <silent> S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => search and replace selected text
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrl-r in v mod will be asked for replacement
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
" after search hit Ctrl-x to remove highlight
nnoremap <silent> <C-x> :nohlsearch<CR><CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright
set expandtab                   " Use spaces instead of tabs.
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h           
nnoremap <C-j> <C-w>j           
nnoremap <C-k> <C-w>k           
nnoremap <C-l> <C-w>l           
" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
" Change 2 split windows from vert to horiz or horiz to vert
nnoremap <Leader>th <C-w>t<C-w>H
nnoremap <Leader>tk <C-w>t<C-w>K
" Removes pipes | that act as seperators on splits
set fillchars+=vert:\
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight LineNr           ctermfg=8    ctermbg=none    cterm=none
" highlight CursorLineNr     ctermfg=8    ctermbg=8       cterm=none
" highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
" highlight Statement        ctermfg=2    ctermbg=none    cterm=none
" highlight Directory        ctermfg=4    ctermbg=none    cterm=none
highlight StatusLine       ctermfg=7    ctermbg=8       cterm=none
highlight StatusLineNC     ctermfg=7    ctermbg=8       cterm=none
highlight BufTabLineHidden   ctermfg=239    ctermbg=236
highlight BufTabLineFill     ctermfg=220    ctermbg=236
highlight BufTabLineActive   ctermfg=220    ctermbg=236
" highlight NERDTreeClosable ctermfg=2
" highlight NERDTreeOpenable ctermfg=8
" highlight Comment          ctermfg=4    ctermbg=none    cterm=italic
" highlight Constant         ctermfg=12   ctermbg=none    cterm=none
" highlight Special          ctermfg=4    ctermbg=none    cterm=none
" highlight Identifier       ctermfg=6    ctermbg=none    cterm=none
" highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
" highlight String           ctermfg=12   ctermbg=none    cterm=none
" highlight Number           ctermfg=1    ctermbg=none    cterm=none
" highlight Function         ctermfg=1    ctermbg=none    cterm=none
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
" => Fast editing and reloading of vimrc configs 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sources .vimrc after every write or save
autocmd BufWritePost ~/.vimrc source $MYVIMRC
" sources .vimrc after every write or save
" autocmd! bufwritepost ~/.vimrc source ~/.vimrc
" open vimrc
nmap <leader>e :e! ~/.vimrc<cr> 
" open vimrc in vertical split
nmap <leader>ev :vsplit ~/.vimrc<cr>
" source vimrc
nmap <leader>sv :source $MYVIMRC<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=0
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
" use tab to make selections ...was taken down for supertab  
" noremap! <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()
let g:SuperTabDefaultCompletionType = "<c-n>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Markdown-Preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mkdp_auto_start = 0                    " Turns off auto preview
" specify browser to open preview page       " default= ''
let g:mkdp_browser = 'surf'                  " Uses surf for preview
" Previews .md files
nnoremap <Leader>mk <Plug>MarkdownPreview        
" Kills the preview
nnoremap <Leader>nm <Plug>MarkdownPreviewStop    
" Preview toggle
nnoremap <Leader>mp <Plug>MarkdownPreviewToggle  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The lightline.vim theme
let g:lightline = {
    \ 'colorscheme': 'deus',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'fugitive', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'component': {
    \   'lineinfo': ' %L  %3l:%-2v',
    \   'modified': '[%M]'
    \ },
    \ 'component_function': {
    \   'readonly': 'LightlineReadonly',
    \   'fugitive': 'LightlineFugitive'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }
function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction
      
" Always show statusline
set laststatus=2
" Keeps insert status from showing up under statusbar.
set noshowmode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buftabline 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shows buf. labels only if two or more are open
let g:buftabline_show = 1
" Switch buffers by their left to right number =2
let g:buftabline_numbers = 2
" switch buffers by their ordinal number
" buftabline_numbers = 2
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)

" always switches to the last buffer
nmap <leader>0 <Plug>BufTabLine.Go(-1)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere with minimal keystrokes, just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spellcheck
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle spell-checking.
noremap <silent> <leader>sc :set spell!<CR>
" Next spelling error
nnoremap <silent> <f5> ]s
" Previous spelling error
nnoremap <silent> <f6> [s
" Try to lazily fix the current spelling mistake.
noremap <silent> <f7> 1z=
" Suggest a spelling
noremap <silent> <f8> z=
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tells wiki to use markdown syntax
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" this allows tab to work with coc menu selection 
au filetype vimwiki silent! iunmap <buffer> <Tab>
" set text to wrap  
set textwidth=68 
" this should highlight when line is overlenth
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%70v.*/
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Stuff.... Some stuff best read last 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" makes folds cleaner
let g:org_clean_folds = 1
" move vertically by visual line (don't skip wrapped lines)
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
" Abbreviate error messages
" set shortmess=a
" Add time stamp 
nnoremap <F4> "=strftime("%a, %H:%M:%S")<CR>P
inoremap <F4> <C-R>=strftime("%a, %H:%M:%S")<CR>
" Use python syntax as a default
let g:python_highlight_all = 1
" Remove some stuff from gui version
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
