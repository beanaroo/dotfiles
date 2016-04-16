
" NOTE: I need to review this since switching to Neovim

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"------------------------------------------------------------------------------#
"--------------------| Plugin Manager and Plugin Settings |--------------------#
"------------------------------------------------------------------------------#

" =========================== VundlePluginManager ==============================
filetype off                        " Required
set rtp+=~/.vim/bundle/Vundle.vim   " Add Vundle to runtime path
call vundle#begin()                 " Initialize

Plugin 'VundleVim/Vundle.vim'               " Let Vundle manage Vundle

" User Interface
Plugin 'chriskempson/base16-vim'            " base16 colors
Plugin 'bling/vim-airline'                  " Airline status bar
Plugin 'vim-airline/vim-airline-themes'       " Airline themes
Plugin 'scrooloose/nerdtree'                " NERD Tree
Plugin 'Xuyuanp/nerdtree-git-plugin'        " NERD Tree git flags
Plugin 'ryanoasis/vim-devicons'             " Devicon glyphs

" Navigation
Plugin 'easymotion/vim-easymotion'          " Easy Motion
Plugin 'jeetsukumaran/vim-buffergator'      " Buffer navigation
Plugin 'tmux-plugins/vim-tmux-focus-events' " FocusGained/Lost inside tmux

" Filetypes
Plugin 'vim-pandoc/vim-pandoc'              " Pandoc Markdown support
Plugin 'vim-pandoc/vim-pandoc-syntax'       " Pandoc Markdown support

" Editing
Plugin 'PeterRincker/vim-argumentative'     " Argument aid
Plugin 'junegunn/vim-easy-align'            " Alignment aid
Plugin 'dhruvasagar/vim-table-mode'         " Table aid
"Plugin 'scrooloose/syntastic'               " Syntax checking

call vundle#end()                   " Uninitialize
filetype plugin indent on           " Required

" ========================= chriskempson/base16-vim ============================
let base16colorspace=256

" ============================ bling/vim-airline ===============================
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'
let g:airline#extensions#tabline#show_close_button = 0

" =========================== scrooloose/nerdtree ==============================

map <C-n> :NERDTreeToggle<CR>

let NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" Auto close if NERDTree is the last thing open
autocmd bufenter *
    \ if (winnr("$") == 1 && exists("b:NERDTree")
    \ && b:NERDTree.isTabTree()) | q | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'none')
call NERDTreeHighlightFile('md', 'blue', 'none', '#6699CC', 'none')
call NERDTreeHighlightFile('config', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('conf', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('json', 'green', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('html', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('css', 'cyan', 'none', '#5486C0', 'none')
call NERDTreeHighlightFile('scss', 'cyan', 'none', '#5486C0', 'none')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'none')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'none')
call NERDTreeHighlightFile('ts', 'Blue', 'none', '#6699cc', 'none')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none')
call NERDTreeHighlightFile('gitconfig', 'black', 'none', '#686868', 'none')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#7F7F7F', 'none')

" ========================== ryanoasis/vim-devicons ============================
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ' '

let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sh'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['svg'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['xml'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yml'] = ''

" ========================== vim-pandoc/vim-pandoc =============================
let g:pandoc#modules#disabled = ["spell"]

" ====================== vim-pandoc/vim-pandoc-syntax ==========================
let g:pandoc#syntax#conceal#use = 1
let g:pandoc#syntax#conceal#blacklist = ["atx","codeblock_start","codeblock_delim"]

" ========================= junegunn/vim-easy-align ============================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ======================= dhruvasagar/vim-table-mode ===========================
let g:table_mode_corner = "+"
let g:table_mode_corner_corner = "+"
let g:table_mode_header_fillchar = "="

" =========================== scrooloose/syntastic =============================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"------------------------------------------------------------------------------#
"-------------------------------| Vim Settings |-------------------------------#
"------------------------------------------------------------------------------#

" ============================= General Config =================================
set backspace=indent,eol,start      " Allow backspace in insert mode
set history=10000                   " Store lots of :cmdline history
set visualbell                      " No sounds
set autoread                        " Reload files changed outside vim

" =========================== performance tweaks ===============================
set timeout ttimeout
set timeoutlen=1000 ttimeoutlen=0   " reduce mode change delay
set lazyredraw                      " don't redraw screen for non-typed macros
set ttyfast                         " fast terminal connection

" ================================ UI Layout ===================================
set titlestring=vim                 " Simple window title
set relativenumber                  " Relative line numbers
set number                          " Show current line number
set showcmd                         " Show command key presses in bottom right
set noshowmode                      " Don't show current mode down the bottom
set cursorline                      " Highlight current line
set wildmenu                        " Enhanced command completion with bar
set showmatch                       " Higlight matching parenthesis
set laststatus=2                    " Always show statusline
"set textwidth=99                    " Limit lines to 99 columns

" ================================== Colors ====================================
syntax enable                       " Enable syntax processing
set t_Co=256                        " Set 256 colors
set background=dark                 " Optimize colors for dark background
colorscheme base16-colors           " Set colorscheme (see base16 plugin)
"let &colorcolumn=join(range(100,999),",")      " Paint margin (see textwidth)

" Search highlighting
highlight Search ctermbg=16 ctermfg=18
highlight IncSearch ctermbg=17 ctermfg=18

" Pandoc Syntax
highlight pandocAtxHeader ctermfg=16 cterm=bold
highlight pandocAtxStart ctermfg=17
highlight pandocSetexHeader ctermfg=03 cterm=bold
highlight pandocStrong ctermfg=21
highlight pandocStrongEmphasis ctermfg=21 gui=bold,italic cterm=bold,italic
highlight pandocStrongInEmphasis ctermfg=21 gui=bold,italic cterm=bold,italic
highlight pandocEmphasisInStrong ctermfg=05 gui=bold,italic cterm=bold,italic
highlight pandocTableHeaderWord ctermfg=06 cterm=bold
highlight pandocGridTableDelims ctermfg=06
highlight pandocGridTableHeader ctermfg=06
highlight pandocDelimitedCodeBlock ctermfg=02
highlight pandocHRule ctermfg=19 cterm=bold



" ============================== Show invisibles ===============================

" Show/Hide invisible characters with \+l
nmap <leader>l :set list!<CR>

set listchars=tab:→\ ,space:·,eol:↵     " Set custom characters

" ============================== Spaces & Tabs =================================
set tabstop=4           " Width of <tab> characters measured in <spaces>
set expandtab           " Use <spaces> when inserting <tabs>
set softtabstop=4       " Amount of <spaces> to insert when pressing <tab>
set shiftwidth=4        " Amount of <spaces> to shift indentation (>>)
set modelines=1         " Enable Vim modelines
set autoindent          " Enable automatic indentation
"nnoremap p p=`]<C-o>" Auto indent pasted text
"nnoremap P P=`]<C-o>" Auto indent pasted text

" ================================ Searching ===================================
set ignorecase          " Ignore case when searching
set incsearch           " Search as characters are entered
set hlsearch            " Highlight all matches

" ================================= Folding ====================================
" Open & close with spacabar
nnoremap <space> za

set foldenable          " don't fold files by default on open
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldlevelstart=10   " start with fold level of 1

" ================================= Autocmd ====================================
" Only highlight cursosline for focused windows.
autocmd FocusLost *     :set nocursorline
autocmd FocusGained *   :set cursorline

"------------------------------------------------------------------------------#
"-----------------------------| Custom Funtions |------------------------------#
"------------------------------------------------------------------------------#

" Show syntax highlighting groups for word under cursor - Ctrl+Shift+p
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap <C-S-P> :call <SID>SynStack()<CR>


