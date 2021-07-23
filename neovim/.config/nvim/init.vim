syntax on

"
set nu
set rnu
set termguicolors
set tabstop=4 softtabstop=4 expandtab
set shiftwidth=4
set nohlsearch
set smartindent
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
"set undofile
set showmatch
"set hlsearch
set incsearch
set cocu="vnic"

"This is apparently necessary for Coc definition
set cmdheight=2
set hidden
set shortmess=aFc

" Leader set to <Space>"

let mapleader = " "
let maplocalleader = "\\"

" commands to edit the vim rc quickly
nnoremap <leader>ec :vsplit $MYVIMRC<cr>
nnoremap <leader>sc :so $MYVIMRC<cr>
map <leader><c-s> :so %<CR>
cnoreabbrev vc ~/.config/nvim/init.vim

"Remapping Default Commands to Leader
nnoremap<silent><leader>s :wincmd v<cr>
nnoremap<silent><leader>S :wincmd s<cr>
nnoremap<silent><leader>c :wincmd c<cr>
nnoremap<silent><leader>h :wincmd h<cr>
nnoremap<silent><leader>j :wincmd j<cr>
nnoremap<silent><leader>k :wincmd k<cr>
nnoremap<silent><leader>l :wincmd l<cr>
nnoremap<silent><leader>t :wincmd t<cr>

"Quickfix Mappings

nnoremap <leader>co :copen<cr>
nnoremap <leader>cp :cprev<cr>
nnoremap <leader>cn :cnext<cr>

nnoremap<silent><leader>ig :IndentGuidesToggle<cr>
map <silent><leader><leader>n :nohlsearch<cr>

" quick maps into a bunch of vim areas
nnoremap<leader>C :Colors<cr>
nnoremap <leader>R :reg<cr>
nnoremap <leader>M :messages<cr>

"buffer, tab, and other quick  navigation
"
nnoremap <silent> b] :bnext<cr>
nnoremap <silent> b[ :bprevious<cr>
nnoremap <silent> B[ :bfirst<cr>
nnoremap <silent> B] :blast<cr>

nnoremap <silent> t] :tabnext<cr>
nnoremap <silent> t[ :tabprevious<cr>
nnoremap <silent> T[ :tabfirst<cr>
nnoremap <silent> T] :tablast<cr>
nnoremap <leader>tn :tabnew<cr>

"Traditional (Non-Vim) Save and Quit Bindings
nnoremap <c-s> :w<cr>
nnoremap <c-s[j>s :wa<cr>
map <c-q> :qa<cr>

"Plugged Additions"

" mappings
cnoreabbrev PI PlugInstall
cnoreabbrev PC PlugClean

" actual plugins

call plug#begin()

Plug 'airblade/vim-rooter'
Plug 'chiel92/vim-autoformat'
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json'
Plug 'heavenshell/vim-pydocstring'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'lervag/vimtex'
Plug 'machakann/vim-sandwich'
Plug 'majutsushi/tagbar'
Plug 'markonm/traces.vim'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'metakirby5/codi.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nsapse/f_string'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'puremourning/vimspector'
Plug 'raimondi/delimitmate'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'simeji/winresizer'
Plug 'simnalamburt/vim-mundo'
Plug 'szw/vim-maximizer'
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-utils/vim-man'
Plug 'voldikss/vim-floaterm'
Plug 'yggdroot/indentline'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

"snippets
"Plug 'justinj/vim-react-snippets'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'

"colorschemes
Plug 'sainnhe/forest-night'
Plug 'b4skyx/serenade'
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'ulwlu/elly.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'folke/tokyonight.nvim'

"UML Stuff
"Plug 'scrooloose/vim-slumlord'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'aklt/plantuml-syntax'

call plug#end()

"colorscheme mappings
colorscheme gruvbox-material
let g:airline_theme='hybrid'

"set background=dark
"hi normal guibg=none ctermbg=none

if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
    set termguicolors
endif

"Remappings for CoC
" <TAB> - trigger completion, pum navigate, snippet expand and jump
" like VSCode inoremap <silent><expr> <TAB>"
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:UltiSnipsExpandTrigger='~'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

" Allow formatting using coc-prettier
vmap <leader><c-f>  <Plug>(coc-format-selected)
nmap <leader><c-f>  <Plug>(coc-format-selected)


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm. " <cr>
" could be remapped by other vim plugin, try `:verbose imap <CR>`."

if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

"additional Coc remappings for plugsin
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>rr <Plug>(coc-rename)
nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <leader>ld :CocDiagnostics<cr>
cnoreabbrev CM CocList marketplace


imap <C-l> <Plug>(coc-snippets-expand)
inoremap <C-l> <Plug>(coc-snippets-expand)<cr>

"mappings for Coc-actions
"
" emap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
nnoremap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

"remapping for NERDTree
map <silent><C-n> :NERDTreeToggle<CR>


" Remappings for vim-easymotion
"<Leader>f{char} to move to {char}
"
map  S <plug>(easymotion-bd-f)
nmap s <plug>(easymotion-overwin-f)
"map  <leader>w <Plug>(easymotion-bd-w)
"nmap <leader>W <Plug>(easymotion-overwin-w)
"nnoremap <leader>w <Plug>(easymotion-overwin-w)

"Remapping for Undotree" - Switched to Mundo
"nmap <leader>U :UndotreeToggle<cr>

nmap <C-_> <Leader>c<Space>
vnoremap <C-_> <Leader>c<Space>
map <C-_> <Leader>c<Space>

"ctrl-p launches FZF
"nnoremap <c-p> :FZF<cr>

"Tagbar Settings
nnoremap<c-t> :TagbarToggle<cr>

"vim-airline settings

"enable smarter tab line
let g:airline#extensions#tabline#enabled = 1

"Automated Docstrings for Python
nnoremap<silent><leader>? <Plug>(pydocstring)

"FloatTerm Bindings and Settings
nnoremap <silent> <leader>FL :FloatermToggle<CR>
tnoremap <silent> <leader>FL <C-\><C-n>:FloatermToggle<CR>
"nnoremap <silent> <c-p>      :FloatermNew fzf<cr>
nnoremap <silent> <c-b>      :FloatermNew ranger<cr>
nnoremap <silent> <c-g>      :FloatermNew lazygit<cr>
let      g:floaterm_autoclose=1
let      g:floaterm_gitcommit='vsplit'

"Vim autoformat binding

map <leader>FF :Autoformat<cr>
au BufWrite *.js :Autoformat

"EasyAlign Bindings

nmap ga <Plug>(EasyAlign)
noremap <leader><leader>A :EasyAlign


" Add MASM highlighting
let g:asmsytax = 'masm'

" VSCode Mappings for Vimspector  etc
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
nnoremap <silent><leader>dr :VimspectorReset<CR>
nmap <leader>b <Plug>VimspectorToggleBreakpoint
vmap <leader>b <plug>VmspectorToggleBreakpoint
nmap <leader>bb <Plug>VimspectorToggleConditionalBreakpoint
nmap <leader>B :call vimspector#ClearBreakpoints()<CR>
nmap <leader>drc  <Plug>VimspectorRunToCursor
nmap <leader>DD <Plug>VimspectorContinue
nnoremap <leader>DD <Plug>VimspectorContinue

" remap watch command to be shorter
cnoreabbrev vsw VimspectorWatch
cnoreabbrev SS str(self)

nmap <leader>W :VimspectorWatch <C-R>0
vmap <leader>W :VimspectorWatch <C-R>0
nnoremap <leader>W :VimspectorWatch <C-R>0


" Emmet Mappings
autocmd FileType .html,.css EmmetInstall


" Mustache Abbrevs
let g:mustache_abbreviations = 1

" vim rainbow
let g:rainbow_active = 1

"Vim-Mundo Mappings
nnoremap <leader><leader>u :MundoToggle<cr>

"fzf bindings
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" This is the default extra key bindings
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" CTRL-A CTRL-Q to select all and build quickfix list


let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
nmap <leader><leader>f :Files<CR>
nmap <leader><leader>b :Buffers<CR>
noremap <leader><leader>b :Buffers<CR>
nnoremap <leader><leader>g :Rg<CR>
nnoremap <leader><leader>t :Tags<CR>
nnoremap <leader><leader>l :Lines<CR>


let g:fzf_tags_command = 'ctags -R'
" Border jj
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

set rtp+=~/.vim/bundle/fzf

"Goyo and Limelight Mapings
map <silent><leader>z :Goyo<cr>
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.5

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 2

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" command to double a variable: {variable} for printing in a python formatted string


"" autocommands


"Vimtex Options
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:tex_conceal='adbmg'
let g:vimtex_quickfix_mode=1
"let g:vimtex_syntax_conceal={'greek':1,'styles':1,'math_delimiters':1,'math_bounds':1,'math_super_sub':1,'math_symbols':1,'math_fracs':1,'fancy':1,'accents':0}
set conceallevel=1
nnoremap <leader><leader>vc :VimtexCompile<cr>


"Vim Maximizer Mappings
noremap <silent><leader>m :MaximizerToggle<cr>

""Toggle Practice
nnoremap <leader>q :call <SID>QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! s:QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

"React Stuff

let g:jsx_ext_required = 0


"Markdown Things
let g:vim_markdown_conceal = 1
let g:vim_markdown_conceal_code_blocks = 0
" Treesitter setup

"lua <<EOF
"require'nvim-treesitter.configs'.setup {
"highlight = {
    "enable = true,
    "},
    "}

