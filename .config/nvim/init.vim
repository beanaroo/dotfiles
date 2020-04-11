" ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
" ┃                             * Neovim Config *                              ┃
" ┡━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
" │                             gihub.com/beanaroo                             │
" └────────────────────────────────────────────────────────────────────────────┘

" ╭────────────────────────────────────────────────────────────────────────────╮
" │                                  Plugins                                   │
" ╰────────────────────────────────────────────────────────────────────────────╯

" ═══════════════════════════╡ junegunn/vim-plug ╞══════════════════════════════

call plug#begin('~/.config/nvim/plugged')

" ══════════ User Interface ════════════

" Base16 colorscheme
Plug 'chriskempson/base16-vim'
" Enhanced Status & Tab lines
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" Project panel
Plug 'preservim/nerdtree'
" git flags for project panel
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" git flags for project panel
Plug 'Xuyuanp/nerdtree-git-plugin'
" Filetype icons
Plug 'ryanoasis/vim-devicons'
" Neoterm
Plug 'kassio/neoterm'

" ════════════ Navigation ══════════════

" Quick jump
Plug 'easymotion/vim-easymotion'
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
Plug 'chr4/nginx.vim'
" Powershell
Plug 'PProvost/vim-ps1'
" Multiple Languages
Plug 'sheerun/vim-polyglot'

" ═════════════ Editing ════════════════

" Argument aid
Plug 'PeterRincker/vim-argumentative'
" Alignment aid
Plug 'junegunn/vim-easy-align'
" Commenting
Plug 'preservim/nerdcommenter'
" Surround
Plug 'machakann/vim-sandwich'

" ══════════ Version Control ═══════════

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" ══════ Integrated Development ════════

" Language Server Integration
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" ════════════════════════╡ chriskempson/base16-vim ╞═══════════════════════════
let base16colorspace=256

" ═══════════════════════════╡ preservim/nerdtree ╞═════════════════════════════

" Close when nothing else open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open when no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif

" Custom arrows
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" Show hidden files
let NERDTreeShowHidden=1

" Show status line
let NERDTreeStatusLine=1

" Minimal UI
let NERDTreeMinimalUI=1

" ══════════════════════╡ Xuyuanp/nerdtree-git-plugin ╞═════════════════════════
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "",
    \ "Staged"    : "",
    \ "Untracked" : "",
    \ "Renamed"   : "",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '',
    \ "Unknown"   : "?"
    \ }
"
" ════════════════════════╡ vim-airline/vim-airline ╞═══════════════════════════
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#default#section_use_groupitems = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#hunks#hunk_symbols = ['', '', '']
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#csv#enabled = 1
let g:airline#extensions#whitespace#enabled = 1

" Coc integration
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = ' '
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#warning_symbol = ' '
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" ════════════════════════╡ junegunn/vim-easy-align ╞═══════════════════════════
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ════════════════════════╡ airblade/vim-gitgutter ╞════════════════════════════
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = ''

" ══════════════════════╡ pearofducks/ansible-vim ╞════════════════════════
"let g:ansible_extra_syntaxes = "terraform.vim nginx.vim"
let g:ansible_template_syntaxes = { '*nginx.conf.j2': 'nginx', '*.groovy.j2': 'groovy', '*.tf.j2': 'terraform' }

" ══════════════════════╡ pearofducks/ansible-vim ╞════════════════════════
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" ═══════════════════════════╡ neoclide/coc.nvim ╞══════════════════════════════
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
    " Use `complete_info` if your (Neo)Vim version supports it.
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ╭────────────────────────────────────────────────────────────────────────────╮
" │                              General Config                                │
" ╰────────────────────────────────────────────────────────────────────────────╯

" ═══════════════════════════╡ Performance Tweaks ╞═════════════════════════════

" Reduce mode change delay
set timeout ttimeout
set timeoutlen=1000 ttimeoutlen=0
set updatetime=100

" Don't redraw screen for non-typed macros
set lazyredraw

" ═══════════════════════════════╡ Proofing ╞═══════════════════════════════════

" Live preview substitutions
set inccommand=nosplit

"" Create directory on save
function WriteCreatingDirs()
    execute ':silent !mkdir -p %:h'
    write
endfunction
command W call WriteCreatingDirs()

" ═══════════════════════════════╡ Appearance ╞═════════════════════════════════

" No sounds
set visualbell

" Simple window title
"set title titlestring=nvim

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

" Always show sign column to avoid shifting
set signcolumn=yes

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

" Guicursor
set guicursor=n-v-c:hor100,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175

" Reset cursor before exiting
au VimLeave * set guicursor=a:hor20-blinkon0

" ═══════════════════════════════╡ Navigation ╞═════════════════════════════════

" Fix ctrl+h
if has('nvim')
     nmap <BS> <C-W>h
endif

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

" Coc.nvim sign colors
highlight CocErrorSign ctermfg=1 ctermbg=18
highlight CocWarningSign ctermfg=16 ctermbg=18
highlight CocInfoSign ctermfg=3 ctermbg=18
highlight CocHintSign ctermfg=5 ctermbg=18

" ╭────────────────────────────────────────────────────────────────────────────╮
" │                             Filetype Config                                │
" ╰────────────────────────────────────────────────────────────────────────────╯

au FileType json setl sw=2 sts=2 ts=2
au FileType yaml setl sw=2 sts=2 ts=2
au FileType terraform setl sw=2 sts=2 ts=2
au FileType ansible_template setl sw=2 sts=2 ts=2

" ╭────────────────────────────────────────────────────────────────────────────╮
" │                           GUI Client Config                                │
" ╰────────────────────────────────────────────────────────────────────────────╯

" ═══════════════════════════╡ Veonim ╞═════════════════════════════

if exists('veonim')

" built-in plugin manager
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'

" extensions for web dev
let g:vscode_extensions = [
  \'vscode.typescript-language-features',
  \'vscode.css-language-features',
  \'vscode.html-language-features',
\]

" multiple nvim instances
nno <silent> <c-t>c :Veonim vim-create<cr>
nno <silent> <c-g> :Veonim vim-switch<cr>
nno <silent> <c-t>, :Veonim vim-rename<cr>

" workspace functions
nno <silent> ,f :Veonim files<cr>
nno <silent> ,e :Veonim explorer<cr>
nno <silent> ,b :Veonim buffers<cr>
nno <silent> ,d :Veonim change-dir<cr>
"or with a starting dir: nno <silent> ,d :Veonim change-dir ~/proj<cr>

" searching text
nno <silent> <space>fw :Veonim grep-word<cr>
vno <silent> <space>fw :Veonim grep-selection<cr>
nno <silent> <space>fa :Veonim grep<cr>
nno <silent> <space>ff :Veonim grep-resume<cr>
nno <silent> <space>fb :Veonim buffer-search<cr>

" language features
nno <silent> sr :Veonim rename<cr>
nno <silent> sd :Veonim definition<cr>
nno <silent> si :Veonim implementation<cr>
nno <silent> st :Veonim type-definition<cr>
nno <silent> sf :Veonim references<cr>
nno <silent> sh :Veonim hover<cr>
nno <silent> sl :Veonim symbols<cr>
nno <silent> so :Veonim workspace-symbols<cr>
nno <silent> sq :Veonim code-action<cr>
nno <silent> sk :Veonim highlight<cr>
nno <silent> sK :Veonim highlight-clear<cr>
nno <silent> ,n :Veonim next-usage<cr>
nno <silent> ,p :Veonim prev-usage<cr>
nno <silent> sp :Veonim show-problem<cr>
nno <silent> <c-n> :Veonim next-problem<cr>
nno <silent> <c-p> :Veonim prev-problem<cr>

endif
