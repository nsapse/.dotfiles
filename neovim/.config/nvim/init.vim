" ****************Vim Settings*************************"
"               
"           Settings for Vim Settings                  "
"                                                      "
" ****************Vim Settings*************************"

syntax on

set nu
set rnu
set termguicolors
set tabstop=4 softtabstop=4
set shiftwidth=4
set nohlsearch
set smartindent
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set showmatch
set encoding=UTF-8
"set hlsearch
set incsearch
set cocu="vnic"
set nocp
filetype plugin indent on
 

"set autochdir
autocmd BufEnter * silent! lcd %:p:h

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
nnoremap  V v$
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

nnoremap<c-h> :wincmd h<cr>
nnoremap<c-j> :wincmd j<cr>
nnoremap<c-k> :wincmd k<cr>
nnoremap<c-l> :wincmd l<cr>
nnoremap<c-t> :wincmd t<cr>

vnoremap<c-h> :wincmd h<cr>
vnoremap<c-j> :wincmd j<cr>
vnoremap<c-k> :wincmd k<cr>
vnoremap<c-l> :wincmd l<cr>
vnoremap<c-t> :wincmd t<cr>

nnoremap<leader>h :wincmd h<cr>
nnoremap<leader>j :wincmd j<cr>
nnoremap<leader>k :wincmd k<cr>
nnoremap<leader>l :wincmd l<cr>
nnoremap<leader>t :wincmd t<cr>

vnoremap<leader>h :wincmd h<cr>
vnoremap<leader>j :wincmd j<cr>
vnoremap<leader>k :wincmd k<cr>
vnoremap<leader>l :wincmd l<cr>
vnoremap<leader>t :wincmd t<cr>
"Quickfix Mappings

noremap <leader>co :copen<cr>
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
nnoremap <leader>T :tabnew<cr>

"mapping to quickly move lines
nnoremap <leader>J :m .+1<CR>
nnoremap <leader>K :m .-2<CR>

"Traditional (Non-Vim) Save and Quit Bindings
nnoremap <c-s> :w<cr>
"nnoremap <c-s> :wa<cr>
map <c-q> :qa<cr>

" *******************Abbreviations*************************"
"                                                          "
"                    Abbreviations                         "
"                                                          "
" *******************Abbreviations*************************"

" Plugins
cnoreabbrev PI PlugInstall
cnoreabbrev PC PlugClean

" Diffview
cnoreabbrev DO DiffviewOpen
cnoreabbrev DC DiffviewClose

" *******************Plugins*************************"
"                                                 "
"                    Plugins                           "
"                                                             "
" *******************Plugins*************************"


call plug#begin()

Plug 'airblade/vim-rooter'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'machakann/vim-sandwich'
Plug 'markonm/traces.vim'
Plug 'nsapse/f_string'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdcommenter'
" Plug 'b3nj5m1n/kommentary'
Plug 'simeji/winresizer'
Plug 'simnalamburt/vim-mundo'
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'vim-utils/vim-man'
Plug 'voldikss/vim-floaterm'

"Latex and Markdown
Plug 'lervag/vimtex'

"Web Development
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'mustache/vim-mustache-handlebars'

"UI/UX
Plug 'gelguy/wilder.nvim'  "run UpdateRemotePlugins after install
Plug 'p00f/nvim-ts-rainbow'
Plug 'Pocco81/TrueZen.nvim'
Plug 'folke/twilight.nvim' 
"Plug 'vim-airline/vim-airline'
Plug 'nvim-lualine/lualine.nvim'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'yggdroot/indentline'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'folke/which-key.nvim'
Plug 'romgrk/barbar.nvim'


" Code and File Navigation
Plug 'unblevable/quick-scope'  
Plug 'phaazon/hop.nvim'
"Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'scrooloose/nerdtree'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

"Plug 'yuezk/vim-js'

"snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'
Plug 'rafamadriz/friendly-snippets'


"colorschemes
Plug 'Murtaza-Udaipurwala/gruvqueen'
Plug 'RRethy/nvim-base16'
Plug 'b4skyx/serenade'
Plug 'fenetikm/falcon'
Plug 'folke/tokyonight.nvim'
Plug 'jacoborus/tender.vim'
Plug 'maaslalani/nordbuddy'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'npxbr/gruvbox.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'sainnhe/forest-night'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'
Plug 'shaunsingh/nord.nvim'
Plug 'ulwlu/elly.vim'
Plug 'EdenEast/nightfox.nvim'
Plug 'NTBBloodbath/doom-one.nvim'


" Git Stuff
Plug 'sindrets/diffview.nvim'
Plug 'lewis6991/gitsigns.nvim'

"UML Stuff
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'aklt/plantuml-syntax'

" Rust Stuff
Plug 'simrat39/rust-tools.nvim'

" Optional dependenciec:
Plug 'nvim-lua/popup.nvim'

"Native LSP

Plug 'folke/trouble.nvim'
Plug 'glepnir/lspsaga.nvim'
"Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'kosayoda/nvim-lightbulb'
Plug 'weilbith/nvim-code-action-menu'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'romgrk/nvim-treesitter-context'
Plug 'nvim-treesitter/playground'
Plug 'ray-x/lsp_signature.nvim'
Plug 'windwp/nvim-ts-autotag'
"Plug 'mhartington/formatter.nvim'
Plug 'sbdchd/neoformat'
Plug 'onsails/lspkind-nvim'

"CMP
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'


" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" For luasnip users.
  "Plug 'L3MON4D3/LuaSnip'
  "Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
 "Plug 'SirVer/ultisnips'
 "Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Telescope et Al

Plug 'nvim-telescope/telescope.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'

" Neorg
Plug 'vhyrro/neorg'

"Java
Plug 'mfussenegger/nvim-jdtls'

"Debugging
Plug 'mfussenegger/nvim-dap-python'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
"Plug 'sakhnik/nvim-gdb'

"Vimwiki Stuff
Plug 'vimwiki/vimwiki'
Plug 'tbabej/taskwiki'
Plug 'plasticboy/vim-markdown'
Plug 'pontusk/cmp-vimwiki-tags'
Plug 'kdheepak/cmp-latex-symbols'

call plug#end()

" ****************Colorscheme and U/I*************************"
"                                                             "
"           Settings for Colorscheme and U/I                  "
"                                                             "
" ****************Colorscheme and U/I*************************"

"colorscheme and UI settings

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" set theme
syntax on
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
"colorscheme gruvbox-material
"colorscheme OceanicNext
colorscheme base16-nord

"hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

"colorscheme hybrid_material
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
nnoremap<c-t> :Vista!!<cr>

"vim-airline settings

"enable smarter tab line
let g:airline#extensions#tabline#enabled = 1

" Setup  lightbulb for code actions
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

"Wilder Menu
call wilder#enable_cmdline_enter()
set wildcharm=<Tab>
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

" only / and ? are enabled by default
call wilder#set_option('modes', ['/', '?', ':'])

" small augroup to read .kbd files for kmonad
augroup kbd
  au!
  autocmd BufNewFile,BufRead *.kbd   set filetype=kbd 
augroup END

" **********************Barbar************************* "
"                                                      "
"                  Settings for Barbar                  "
"                                                      "
" **********************Barbar************************* "

" Move to previous/next
"nnoremap <silent>    <A-,> :BufferPrevious<CR>
"nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
"nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
"nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    b1 :BufferGoto 1<CR>
nnoremap <silent>    b2 :BufferGoto 2<CR>
nnoremap <silent>    b3 :BufferGoto 3<CR>
nnoremap <silent>    b4 :BufferGoto 4<CR>
nnoremap <silent>    b5 :BufferGoto 5<CR>
nnoremap <silent>    b6 :BufferGoto 6<CR>
nnoremap <silent>    b7 :BufferGoto 7<CR>
nnoremap <silent>    b8 :BufferGoto 8<CR>
nnoremap <silent>    b9 :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    bp :BufferPin<CR>
" Close buffer
nnoremap <silent>    bc :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> >    :BufferPick<CR>
" Sort automatically by...
" nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
" nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
" nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
" nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used


" **********************Vista************************* "
"                                                      "
"                  Settings for Vista                  "
"                                                      "
" **********************Vista************************* "

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" **********************Quickscope************************* "
"                                                           "
"                  Settings for Quickscope                  "
"                                                           "
" **********************Quickscope************************* "

" Trigger a highlight in the appropriate direction when pressing these keys:
"nnoremap n <Plug>(Quickscopef)<cr>
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']


" **********************DAP ACTIONS************************* "
"                                                            "
"                  Settings for DAP ACTIONS                  "
"                                                            "
" **********************DAP ACTIONS************************* "
" general settings for debugger

nnoremap <silent> <leader>dd :lua require'dap'.continue()<CR>
nnoremap <silent> <leader>jj :lua require'dap'.step_over()<CR>
nnoremap <silent> <leader>ll :lua require'dap'.step_into()<CR>
nnoremap <silent> <leader>kk :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
nnoremap <silent> <leader>do :lua require'dapui'.toggle()<CR>
nnoremap <silent> <leader>dc :lua require'dapui'.close()<CR>

"nnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>

 "python specific debugging
lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
nnoremap <silent> <leader>tm :lua require('dap-python').test_method()<CR>
nnoremap <silent> <leader>tc :lua require('dap-python').test_class()<CR>
vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>


"Plugged Additions"

" **********************LSP ACTIONS************************* "
"                                                            "
"                  Settings for LSP ACTIONS                  "
"                                                            "
" **********************LSP ACTIONS************************* "

" start completion
"autocmd BufEnter * lua require'completion'.on_attach()

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
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
nnoremap <silent>ga :Lspsaga code_action<CR>
vnoremap <silent>ga :<C-U>Lspsaga range_code_action<CR>

"-- lsp provider to find the cursor word definition and reference
nnoremap <silent>gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
"-- or use command LspSagaFinder
nnoremap <silent>gh :Lspsaga lsp_finder<CR>


" or use command
"nnoremap <silent>K :Lspsaga hover_doc<CR>

" scroll down hover doc or scroll in definition preview
nnoremap <silent><C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent><C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

"or command
nnoremap <silent>gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

"rename
nnoremap <silent>RR <cmd>lua require('lspsaga.rename').rename()<CR>

"preview definition
nnoremap <silent>pd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

"" Macro - Paste From Current System Buffer
nnoremap <leader><leader>V "+p 

" or use command
nnoremap <silent><leader>cd <cmd>lua
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
"-- only show diagnostic if cursor is over the area
nnoremap <silent><leader>cc <cmd>lua
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>


"Setting up java LSP JDTLS

let g:lsc_server_commands = {'java': 'usr/bin/java-language-server/dist/lang_server_linux.sh'}
if has('nvim-0.5')
  augroup lsp
    au!
    au FileType java lua require('jdtls').start_or_attach({cmd = {'jdtls'}})
    command! -buffer JdtCompile lua require('jdtls').compile()
    command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
    command! -buffer JdtJol lua require('jdtls').jol()
    command! -buffer JdtBytecode lua require('jdtls').javap()
    command! -buffer JdtJshell lua require('jdtls').jshell()
  augroup end
endif

nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>

"-- `code_action` is a superset of vim.lsp.buf.code_action and you'll be able to
"-- use this mapping also with other language servers
nnoremap ga <Cmd>lua require('jdtls').code_action()<CR>
vnoremap ga <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
nnoremap <leader>r <Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>

nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap <leader><leader>ev <Cmd>lua require('jdtls').extract_variable()<CR>
vnoremap <leader><leader>ev <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
nnoremap <leader><leader>ec <Cmd>lua require('jdtls').extract_constant()<CR>
vnoremap <leader><leader>ec <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
vnoremap <leader><leader>em <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>


"-- If using nvim-dap
"-- This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
nnoremap <leader>df <Cmd>lua require'jdtls'.test_class()<CR>
nnoremap <leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>


" LSP UPDATE

" ****************Treesitter*************************"
"                                                    "
"           Settings for Treesitter                  "
"                                                    "
" ****************Treesitter*************************"

" Toggle TSPlayground

nnoremap <silent> <leader>tp :TSPlaygroundToggle<cr>

" ****************NerdTree*************************"
"                                                  "
"           Settings for NerdTree                  "
"                                                  "
" ****************NerdTree*************************"

map <silent><C-n> :CHADopen<CR>


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
"autocmd BufEnter * lua require'completion'.on_attach()
 "Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
let g:completion_enable_snippet = 'vim-vsnip'
"let g:vsnip_snippet_dirs = ['~/.config/nvim/plugged/friendly-snippets']

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect,preview

" Avoid showing message extra message when using completion
set shortmess+=c

" Autoformatting
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
"autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 1000)

" vsnip settings
"ultisnips
"let g:UltiSnipsExpandTrigger='~'
"let g:UltiSnipsJumpForwardTrigger = '<c-j>'
"let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

"inoremap <silent><expr> <C-Space> compe#complete()
"inoremap <silent><expr> <CR>      compe#confirm('<CR>')
"inoremap <silent><expr> <C-e>     compe#close('<C-e>')
"inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
"inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })



" ****************Hop*************************"
"                                             "
"           Settings for Hop                  "
"                                             "
" ****************Hop*************************"
                                              
nnoremap S :HopWord<CR>
vnoremap S :HopWord<CR>
nnoremap s :HopChar1<CR>
vnoremap s :HopChar1<CR>
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

"let      g:vimspector_enable_mappings =     'VISUAL_STUDIO'
"nnoremap <silent><leader>dr           :VimspectorReset<CR>
"nmap     <leader>b                    <Plug>VimspectorToggleBreakpoint
"vmap     <leader>b                    <plug>VmspectorToggleBreakpoint
"nmap     <leader>bb                   <Plug>VimspectorToggleConditionalBreakpoint
"nmap     <leader>B                    :call vimspector#ClearBreakpoints()<CR>
"nmap     <leader>drc                  <Plug>VimspectorRunToCursor
"nmap     <leader>DD                   <Plug>VimspectorContinue
"nnoremap <leader>DD                   <Plug>VimspectorContinue

"" remap watch command to be shorter
"cnoreabbrev vsw VimspectorWatch
"cnoreabbrev SS str(self)

"nmap <leader>W :VimspectorWatch <C-R>0
"vmap <leader>W :VimspectorWatch <C-R>0
"nnoremap <leader>W :VimspectorWatch <C-R>0


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
let      g:fzf_history_dir = '~/.local/share/fzf-history'
nmap     <leader><leader>f :Files<CR>
nmap     <leader><leader>b :Buffers<CR>
nnoremap <leader><leader>t :Tags<CR>
nnoremap <leader><leader>l :Lines<CR>
nnoremap <leader><leader>g :Rg<CR>

let g:fzf_tags_command = 'ctags -R'
" Border kj
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
nnoremap fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
"
" Telescope grep keeps crashing - remapped to ripgrem in Floatterm
nnoremap <leader>bb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>th <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>tm <cmd>lua require('telescope.builtin').keymaps()<cr>



" ****************Focus*************************
"                
"   Focus Plugins (Zen, Limelight, etc) 
"
" ****************Focus*************************

map <silent><leader>z :TZAtaraxis<CR><bar>:Twilight<CR>
map <silent><leader>Z :TZMinimalist<CR><bar>:Twilight<CR>


"autocmd! User TZAtaraxis Twilight
"autocmd! User GoyoLeave Limelight!


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



-- nvim_lsp object
local nvim_lsp = require'lspconfig'


---- function to attach completion when setting up lsp
--local on_attach = function(client)
--    require'completion'.on_attach(client)
--end
--
---- Enable rust_analyzer
--nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
--
---- Enable diagnostics
--vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--  vim.lsp.diagnostic.on_publish_diagnostics, {
--    virtual_text = true,
--    signs = true,
--    update_in_insert = true,
--  }
--)

-- attempt to get rust working
require('rust-tools').setup({})
-- set inlay hints
require('rust-tools.inlay_hints').set_inlay_hints()
-- Command:
-- RustHoverActions 
require'rust-tools.hover_actions'.hover_actions()


require "lsp_signature".setup()

-- Setting Up Language Servers
require'lspconfig'.bashls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.hls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.jsonls.setup{}
--require'lspconfig'.pylsp.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.sqls.setup{}
require'lspconfig'.sumneko_lua.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.vimls.setup{}


-- setup pyright

--require'lspconfig'.nvim-code-action-menu.setup{cmd = 'CodeActionMenue'}

--require'lspconfig'.jdtls.setup {cmd = {'jdtls'}}
--require'lspconfig'.java_language_server.setup{}

local saga = require 'lspsaga'
saga.init_lsp_saga()
--require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
--require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

-- Trouble

require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }

-- Hop
require'hop'.setup()

-- Compe
--require'compe'.setup {
--  enabled = true;
--  autocomplete = true;
--  debug = false;
--  min_length = 1;
--  preselect = 'enable';
--  throttle_time = 80;
--  source_timeout = 200;
--  resolve_timeout = 800;
--  incomplete_delay = 400;
--  max_abbr_width = 100;
--  max_kind_width = 100;
--  max_menu_width = 100;
--  documentation = {
--    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
--    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
--    max_width = 120,
--    min_width = 60,
--    max_height = math.floor(vim.o.lines * 0.3),
--    min_height = 1,
--  };
--
--  source = {
--    path = true;
--    buffer = true;
--    calc = true;
--    nvim_lsp = true;
--    nvim_lua = true;
--    vsnip = true;
--    ultisnips = true;
--    luasnip = true;
--    neorg= true;
--  };
--}
---
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true
--capabilities.textDocument.completion.completionItem.resolveSupport = {
--  properties = {
--    'documentation',
--    'detail',
--    'additionalTextEdits',
--  }
--}
--
--local t = function(str)
--  return vim.api.nvim_replace_termcodes(str, true, true, true)
--end
--
--local check_back_space = function()
--    local col = vim.fn.col('.') - 1
--    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
--end
---
----- Use (s-)tab to:
------ move to prev/next item in completion menuone
------ jump to prev/next snippet's placeholder
---
---  if vim.fn.pumvisible() == 1 then
---    return t "<C-n>"
---  elseif vim.fn['vsnip#available'](1) == 1 then
---    return t "<Plug>(vsnip-expand-or-jump)"
---  elseif check_back_space() then
---    return t "<Tab>"
---  else
---    return vim.fn['compe#complete']()
---  end
---end
---_G.s_tab_complete = function()
---  if vim.fn.pumvisible() == 1 then
---    return t "<C-p>"
---  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
---    return t "<Plug>(vsnip-jump-prev)"
---  else
---    -- If <S-Tab> is not working in your terminal, change it to <C-h>
---    return t "<S-Tab>"
---  end
---end
---
---vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
---vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
---vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
---vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
   rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  },
  autotag = {
    enable = true,
  }
}



-- 

local true_zen = require("true-zen")

true_zen.setup({
	ui = {
		bottom = {
			laststatus = 0,
			ruler = false,
			showmode = false,

			cmdheight = 1,
		},
		top = {
			showtabline = 0,
		},
		left = {
			number = false,
			relativenumber = false,
			signcolumn = "no",
		},
	},
	modes = {
		ataraxis = {
			left_padding = 32,
			right_padding = 32,
			top_padding = 1,
			bottom_padding = 1,
			ideal_writing_area_width = {0},
			just_do_it_for_me = true,
			keep_default_fold_fillchars = true,
			custom_bg = {"none", ""},
			bg_configuration = true,
			quit = "untoggle",
			affected_higroups = {NonText = {}, FoldColumn = {}, ColorColumn = {}, VertSplit = {}, StatusLine = {}, StatusLineNC = {}, SignColumn = {}}
		},
		focus = {
			margin_of_error = 5,
			focus_method = "experimental"
		},
	},
	integrations = {
		vim_gitgutter = false,
		galaxyline = false,
		tmux = true,
		gitsigns = false,
		nvim_bufferline = false,
		limelight = false,
		twilight = true,
		vim_airline = false,
		vim_powerline = false,
		vim_signify = false,
		express_line = false,
		lualine = false,
	},
	misc = {
		on_off_commands = false,
		ui_elements_commands = false,
		cursor_by_mode = false,
	}
})


require("twilight").setup {}
require('gitsigns').setup()
-- whichKey

require('which-key').setup{
    timeoutlen = 40
}

-- NeOrg General Setup
require('neorg').setup {
        -- Tell Neorg what modules to load
        load = {
            ["core.defaults"] = {}, -- Load all the default modules
            ["core.norg.concealer"] = {}, -- Allows for use of icons
            ["core.norg.dirman"] = { -- Manage your directories with Neorg
                config = {
                    workspaces = {
                        my_workspace = "~/neorg"
                    }
                }
            }
        },
    }

-- TS Setup for NeORG

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c" },
        branch = "main"
    },
}


--- NVIM DAP ----

local dap = require('dap')


vim.fn.sign_define('DapBreakpoint', {text='>>', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='<>', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='->', texthl='', linehl='', numhl=''})

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed
  name = "lldb"
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = false,
  },
}


-- If you want to use this for rust and c, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require("dapui").setup()

dap.adapters.python = {
  type = 'executable';
  command = '/usr/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

-- setup formatter

-- for TS Context
require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            -- 'for', -- These won't appear in the context
            -- 'while',
            -- 'if',
            -- 'switch',
            -- 'case',
        },
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
    },
}

-- CMP SETUP
local cmp = require'cmp'
cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
       vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        --require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        --vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
--    mapping = {
--      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
--      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
--      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
--      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
--      ['<C-e>'] = cmp.mapping({
--        i = cmp.mapping.abvimwiki-tagsort(),
--        c = cmp.mapping.close(),
--      }),
--      ['<CR>'] = cmp.mapping.confirm({ select = true }),
--    },
	mapping = {
	  ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	  ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
	  ['<S-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	  ['<S-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
	  ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
	  ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
	  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.close(),
	  ['<CR>'] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	  })
	},

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
	  { name = 'vsnip' }, -- For vsnip users.
	  { name = 'vimwiki-tags' }, -- For vimwiki
      { name = 'latex_symbols' }, -- For vimwiki
      { name = 'buffer' },
      { name = 'path' },
    }, {
    })
  })
  --{ name = 'luasnip' }, -- For luasnip users.
      --{ name = 'ultisnips' }, -- For ultisnips users.

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).

  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig')['pylsp'].setup {
  --  capabilities = capabilities
  --}
 require('lspconfig')['pyright'].setup {
   capabilities = capabilities
  }

  require('lspconfig')['vimls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }


--LSP KIND for nice pretty lsp
local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({with_text = false, maxwidth = 50})
  }
}

-- BarBar Options
-- Set barbar's options
vim.g.bufferline = {
  -- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Excludes buffers from the tabline
  exclude_ft = {'javascript'},
  exclude_name = {'package.json'},

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = true,

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
}
--"require('kommentary.config').use_extended_mappings()

-- lualine setup
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_lsp', 'coc'}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {'tabs'},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'chadtree', 'quickfix'}
}


EOF
