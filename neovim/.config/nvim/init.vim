" ****************Vim Settings*************************"
"                                                      "
"           Settings for Vim Settings                  "
"                                                      "
" ****************Vim Settings*************************"

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
set undofile
set showmatch
"set hlsearch
set incsearch
set cocu="vnic"

"This is apparently necessary for Coc definition
set cmdheight=2
set hidden
set shortmess=aFc

" ****************Vim Mappings*************************"
"                                                      "
"           Settings for Vim Mappings                  "
"                                                      "
" ****************Vim Mappings*************************"

" Leader set to <Space>"

let mapleader = " "
let maplocalleader = "\\"

" Standard Action Remaps
nnoremap  Y y$
nnoremap  J mzJ`z

" commands to edit the vim rc quickly
nnoremap <leader>ec :vsplit $MYVIMRC<cr>
nnoremap <leader>sc :so $MYVIMRC<cr>
map <leader><c-s> :so %<CR>
cnoreabbrev vc ~/.config/nvim/init.vim

"Remapping Default Commands to Leader
nnoremap<silent><leader>s :wincmd v<cr>
nnoremap<silent><leader>S :wincmd s<cr>
nnoremap<silent><leader>c :wincmd c<cr>
nnoremap<silent><C-c>     :wincmd c<cr>
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
nnoremap <leader>C :Colors<cr>
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

" ****************Colorscheme and U/I*************************"
"                                                             "
"           Settings for Colorscheme and U/I                  "
"                                                             "
" ****************Colorscheme and U/I*************************"

"colorscheme and UI settings

" Example config in Vim-Script
let g:nord_contrast = v:true
let g:nord_borders = v:false
let g:nord_disable_background = v:false

colorscheme hybrid_material
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

map <C-_> <Leader>c<Space>
nnoremap<c-t> :TagbarToggle<cr>

"vim-airline settings

"enable smarter tab line
let g:airline#extensions#tabline#enabled = 1

"Plugged Additions"

" mappings
cnoreabbrev PI PlugInstall
cnoreabbrev PC PlugClean

call plug#begin()

Plug 'airblade/vim-rooter'
Plug 'phaazon/hop.nvim'
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
Plug 'mustache/vim-mustache-handlebars'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nsapse/f_string'
Plug 'othree/html5.vim'
"Plug 'pangloss/vim-javascript'
Plug 'puremourning/vimspector'
Plug 'raimondi/delimitmate'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'simeji/winresizer'
Plug 'simnalamburt/vim-mundo'
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-utils/vim-man'
Plug 'voldikss/vim-floaterm'
Plug 'yggdroot/indentline'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
"Plug 'yuezk/vim-js'

"snippets
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
Plug 'shaunsingh/nord.nvim'

"UML Stuff
"Plug 'scrooloose/vim-slumlord'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'aklt/plantuml-syntax'

"Native LSP

Plug 'nvim-lua/completion-nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
"Plug 'windwp/nvim-ts-autotag'

call plug#end()


" **********************LSP ACTIONS************************* "
"                                                            "
"                  Settings for LSP ACTIONS                  "
"                                                            "
" **********************LSP ACTIONS************************* "

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>D <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

"Trouble Mappings
nnoremap <leader>tt <cmd>TroubleToggle<cr>
nnoremap <leader>tw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>td <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>tq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>tl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

"SAGA Code Actions
nnoremap <silent><C-a> :Lspsaga code_action<CR>
vnoremap <silent><C-a> :<C-U>Lspsaga range_code_action<CR>

" or use command
nnoremap <silent>K :Lspsaga hover_doc<CR>

" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

"or command
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

"rename
nnoremap <silent>RR <cmd>lua require('lspsaga.rename').rename()<CR>

"preview definition
nnoremap <silent> pd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

"" Macro - Paste From Current System Buffer
nnoremap <leader><leader>V "+p 

" or use command
"nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
"nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>



" ****************NerdTree*************************"
"                                                  "
"           Settings for NerdTree                  "
"                                                  "
" ****************NerdTree*************************"

map <silent><C-n> :NERDTreeToggle<CR>


" ****************FloatTerm*************************"
"                                                   "
"           Settings for FloatTerm                  "
"                                                   "
" ****************FloatTerm*************************"

"FloatTerm Bindings and Settings
nnoremap <silent><leader>FL :FloatermToggle<CR>
tnoremap <silent><leader>FL <C-\><C-n>:FloatermToggle<CR>
"nnoremap <silent> <c-p>      :FloatermNew fzf<cr>
nnoremap <silent><c-b>      :FloatermNew ranger<cr>
nnoremap <silent><c-g>      :FloatermNew lazygit<cr>
let      g:floaterm_autoclose=1
let      g:floaterm_gitcommit='vsplit'

            
" ****************LSP*************************"
"                                             "
"           Settings for LSP                  "
"                                             "
" ****************LSP*************************"

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
let g:completion_enable_snippet = 'UltiSnips'

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Autoformatting
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 1000)

"ultisnips
let g:UltiSnipsExpandTrigger='~'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

if exists('*complete_info')
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif



" ****************Hop*************************"
"                                             "
"           Settings for Hop                  "
"                                             "
" ****************Hop*************************"
                                              
nnoremap f :HopWord<CR>
vnoremap f :HopWord<CR>
nnoremap F :HopChar1<CR>
vnoremap F :HopChar1<CR>
nnoremap L :HopLine<CR>

"EasyAlign Bindings

nmap <leader>ga <Plug>(EasyAlign)
xmap <leader>ga <Plug>(EasyAlign)
vmap <leader>ga <Plug>(EasyAlign)
"noremap <leader><leader>A :EasyAlign

" Add MASM highlighting
let g:asmsytax = 'masm'

" ****************Vimspector*************************"
"                                                    "
"           Settings for Vimspector                  "
"                                                    "
" ****************Vimspector*************************"
" VSCode Mappings for Vimspector  etc

let      g:vimspector_enable_mappings =     'VISUAL_STUDIO'
nnoremap <silent><leader>dr           :VimspectorReset<CR>
nmap     <leader>b                    <Plug>VimspectorToggleBreakpoint
vmap     <leader>b                    <plug>VmspectorToggleBreakpoint
nmap     <leader>bb                   <Plug>VimspectorToggleConditionalBreakpoint
nmap     <leader>B                    :call vimspector#ClearBreakpoints()<CR>
nmap     <leader>drc                  <Plug>VimspectorRunToCursor
nmap     <leader>DD                   <Plug>VimspectorContinue
nnoremap <leader>DD                   <Plug>VimspectorContinue

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


" ****************FZF*************************
"
"           Settings for FZF
"
" ****************FZF*************************


let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
"let      g:fzf_history_dir = '~/.local/share/fzf-history'
"nmap     <leader><leader>f :Files<CR>
"nmap     <leader><leader>b :Buffers<CR>
"noremap  <leader><leader>b :Buffers<CR>
"nnoremap <leader><leader>t :Tags<CR>
"nnoremap <leader><leader>l :Lines<CR>

let g:fzf_tags_command = 'ctags -R'
" Border jj
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

set rtp+=~/.vim/bundle/fzf


" ****************Telescope*************************
"                
"           Settings for Telescope 
"
" ****************Telescope*************************

" Find files using Telescope command-line sugar.
"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
"nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
"
" Telescope grep keeps crashing - remapped to ripgrem in Floatterm
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>



" ****************Focus*************************
"                
"   Focus Plugins (Zen, Limelight, etc) 
"
" ****************Focus*************************

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


" ****************Vimtex************************* "
"                                                 "
"                 Vimtex                          "
"                                                 "
" ****************Vimtex************************* "


"Vimtex Options
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:tex_conceal='adbmg'
let g:vimtex_quickfix_mode=1
"let g:vimtex_syntax_conceal={'greek':1,'styles':1,'math_delimiters':1,'math_bounds':1,'math_super_sub':1,'math_symbols':1,'math_fracs':1,'fancy':1,'accents':0}
set conceallevel=1
nnoremap <leader><leader>vc :VimtexCompile<cr>


" ****************Quickfix************************* "
"                                                   " 
"                 Quickfix                          "
"                                                   "
" ****************Quickfix************************* "


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



""" ___________  LANGUAGE SERVERS ____________

lua <<EOF

require'lspconfig'.bashls.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.sqls.setup{}

local saga = require 'lspsaga'
saga.init_lsp_saga()

-- Trouble

require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }

-- Hop
require'hop'.setup()

EOF
