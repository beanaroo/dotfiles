" ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
" ┃                             * Neovim Config *                              ┃
" ┡━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
" │                             gihub.com/beanaroo                             │
" └────────────────────────────────────────────────────────────────────────────┘

" ╭────────────────────────────────────────────────────────────────────────────╮
" │                                  Plugins                                   │
" ╰────────────────────────────────────────────────────────────────────────────╯

" Fix ctrl+h
if has('nvim')
     nmap <BS> <C-W>h
endif

" ═══════════════════════════╡ junegunn/vim-plug ╞══════════════════════════════

call plug#begin('~/.config/nvim/plugged')

" ══════════ User Interface ════════════

" Base16 colorscheme
Plug 'chriskempson/base16-vim'
" Enhanced Status & Tab lines
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" Project panel
"Plug 'scrooloose/nerdtree'
" git flags for project panel
"Plug 'Xuyuanp/nerdtree-git-plugin'
" Filetype icons
Plug 'ryanoasis/vim-devicons'
" Neoterm
Plug 'kassio/neoterm'

" ════════════ Navigation ══════════════

" Quick jump
Plug 'easymotion/vim-easymotion'
" Buffer navigation
Plug 'jeetsukumaran/vim-buffergator'
" Vim-tmux-navigation
Plug 'christoomey/vim-tmux-navigator'

" ═══════ Filetype extensions ══════════

" Advanced Pandoc markdown
Plug 'vim-pandoc/vim-pandoc' | Plug 'vim-pandoc/vim-pandoc-syntax'
" XML Tools
Plug 'othree/xml.vim'
" CSV Tools
Plug 'chrisbra/csv.vim'
" Ansible YAML
Plug 'pearofducks/ansible-vim'
" Terraform HCL and JSON
Plug 'hashivim/vim-terraform'
" Log4
Plug 'vim-scripts/log4j.vim'
" Nginx
Plug 'vim-scripts/nginx.vim'

" ═════════════ Editing ════════════════

" Argument aid
Plug 'PeterRincker/vim-argumentative'
" Alignment aid
Plug 'junegunn/vim-easy-align'
" Table aid
"Plug 'dhruvasagar/vim-table-mode'
" Auto completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'

" ══════════ Version Control ═══════════

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" ══════ Integrated Development ════════

" Tag bar
Plug 'majutsushi/tagbar'
" Code Linting
"Plug 'benekastah/neomake'
" Live Web Preview
Plug 'jaxbot/browserlink.vim'
" Vim-Go
Plug 'fatih/vim-go'
" Deoplete-Go
Plug 'zchee/deoplete-go', { 'do': 'make'}
" Gocode autocompletion
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
" Deoplete-jedi
Plug 'zchee/deoplete-jedi'
" Go Compiler
Plug 'rjohnsondev/vim-compiler-go'

call plug#end()

" ════════════════════════╡ chriskempson/base16-vim ╞═══════════════════════════
let base16colorspace=256

" ════════════════════════╡ vim-airline/vim-airline ╞═══════════════════════════
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#hunks#hunk_symbols = [' ', ' ', ' ']
let airline#extensions#default#section_use_groupitems = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#csv#enabled = 1

" ════════════════════════╡ junegunn/vim-easy-align ╞═══════════════════════════
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ════════════════════════╡ airblade/vim-gitgutter ╞════════════════════════════
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = ''

" ═══════════════════════════╡ benekastah/neomake ╞═════════════════════════════
"let g:neomake_c_enabled_makers = ['gcc']
"autocmd! BufWritePost,BufEnter * Neomake
"let g:neomake_logfile='/tmp/error.log'
"let g:neomake_open_list = 2
"let g:neomake_error_sign = { 'text': '', 'texthl': 'NeoErrorMsg' }
"let g:neomake_warning_sign = { 'text': '', 'texthl': 'NeoWarningMsg' }

" ════════════════════════════╡ Shougo/deoplete ╞═══════════════════════════════
let g:deoplete#enable_at_startup = 1

" ════════════════════════════╡ fatih/vim-go ╞═══════════════════════════════
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" ══════════════════════╡ rjohnsondev/vim-compiler-go ╞════════════════════════
let g:golang_goroot = "/usr/lib/go"

" ╭────────────────────────────────────────────────────────────────────────────╮
" │                              General Config                                │
" ╰────────────────────────────────────────────────────────────────────────────╯

" ═══════════════════════════╡ Performance Tweaks ╞═════════════════════════════

" Reduce mode change delay
set timeout ttimeout
set timeoutlen=1000 ttimeoutlen=0
" Don't redraw screen for non-typed macros
set lazyredraw

" ═══════════════════════════════╡ Proofing ╞═══════════════════════════════════

" Create directory on save
function WriteCreatingDirs()
    execute ':silent !mkdir -p %:h'
    write
endfunction
command W call WriteCreatingDirs()

" ═══════════════════════════════╡ Appearance ╞═════════════════════════════════
"
" No sounds
set visualbell
" Simple window title
"set titlestring=nvim
" Relative line numbers
set relativenumber
" Show current line number
set number
" Show command key presses in bottom right
set showcmd
" Don't show current mode down the bottom
set noshowmode
" Highlight current line
set cursorline
" Higlight matching parenthesis
set showmatch
" Only highlight cursorline for focused buffer on focused window.
autocmd FocusLost *     :set nocursorline
autocmd FocusGained *   :set cursorline
autocmd WinLeave *      :set nocursorline
autocmd WinEnter *      :set cursorline
" Split windows to the right and to the bottom
set splitright
set splitbelow

" ═══════════════════════════════╡ Navigation ╞═════════════════════════════════

" Synchronise registers between windows
autocmd CursorHold,FocusGained,FocusLost * rshada|wshada

" Use Alt+hjkl as arrow keys
noremap <M-h> <Left>
noremap! <M-h> <Left>
noremap <M-j> <Down>
noremap! <M-j> <Down>
noremap <M-k> <Up>
noremap! <M-k> <Up>
noremap <M-l> <Right>
noremap! <M-l> <Right>

" Split pane navigation (now handled by tmux-navigation)
"nnoremap <c-j> <c-w>j
"nnoremap <c-k> <c-w>k
"nnoremap <c-l> <c-w>l
"nnoremap <c-h> <c-w>h

" ═══════════════════════════════╡ Whitespace ╞═════════════════════════════════

" Width of <tab> characters measured in <spaces>
set tabstop=4
" Use <spaces> when inserting <tabs>
set expandtab
" Amount of <spaces> to insert when pressing <tab>
set softtabstop=4
" Amount of <spaces> to shift indentation (>>)
set shiftwidth=4
" Show/Hide invisible characters with \+l
nmap <leader>l :set list!<CR>
" Set custom characters for showing invisibles
set listchars=tab:→\ ,space:·,eol:↵
" Auto indent pasted text
"nnoremap p p=`]<C-o>
" Auto indent pasted text
"nnoremap P P=`]<C-o>
" Delete trailing whitespace upon saving
autocmd BufWritePre * %s/\s\+$//e

" ═══════════════════════════════╡ Searching ╞══════════════════════════════════

" Ignore case when searching
set ignorecase

" ════════════════════════════════╡ Folding ╞═══════════════════════════════════

" Open & close with spacabar
nnoremap <space> za
" fold based on indent level
set foldmethod=indent
" max 10 depth
set foldnestmax=10
" start with fold level of 1
set foldlevelstart=10

" ═════════════════════════════════╡ Colors ╞═══════════════════════════════════

" Enable syntax processing
syntax enable
" Set 256 terminal colors
set t_Co=256
" Optimize colors for dark background
set background=dark
" Set colorscheme
colorscheme base16-ocean
" Paint margin (see textwidth)
"let &colorcolumn=join(range(100,999),",")

" Custom Search Highlights
highlight Search ctermbg=16 ctermfg=18
highlight IncSearch ctermbg=17 ctermfg=18

" [Plugin] Custom Pandoc syntax colors
"highlight pandocAtxHeader ctermfg=16 cterm=bold
"highlight pandocAtxStart ctermfg=17
"highlight pandocSetexHeader ctermfg=03 cterm=bold
"highlight pandocStrong ctermfg=21
"highlight pandocStrongEmphasis ctermfg=21 gui=bold,italic cterm=bold,italic
"highlight pandocStrongInEmphasis ctermfg=21 gui=bold,italic cterm=bold,italic
"highlight pandocEmphasisInStrong ctermfg=05 gui=bold,italic cterm=bold,italic
"highlight pandocTableHeaderWord ctermfg=06 cterm=bold
"highlight pandocGridTableDelims ctermfg=06
"highlight pandocGridTableHeader ctermfg=06
"highlight pandocDelimitedCodeBlock ctermfg=02
"highlight pandocHRule ctermfg=19 cterm=bold

" [Plugin] Custom Neomake icon colors
highlight NeoWarningMsg ctermfg=3 ctermbg=18
highlight NeoErrorMsg ctermfg=1 ctermbg=18

" Show syntax highlighting groups for word under cursor - Ctrl+Shift+p
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap <C-S-P> :call <SID>SynStack()<CR>

" ╭────────────────────────────────────────────────────────────────────────────╮
" │                             Filetype Config                                │
" ╰────────────────────────────────────────────────────────────────────────────╯

" ═══════════════════════════╡ Yaml ╞═════════════════════════════
au FileType yaml setl sw=2 sts=2 ts=2
