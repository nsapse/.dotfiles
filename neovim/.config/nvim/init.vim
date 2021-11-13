" ****************Vim Settings*************************"
"               
"           Settings for Vim Settings                  "
"                                                      "
" ****************Vim Settings*************************"

" source by init.lua
lua require('init')

"automatically recompile when plugins changed
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile profile=true
augroup end

set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undodir
syntax on
filetype plugin on

" ****************Vim Mappings*************************"
"                                                      "
"           Settings for Vim Mappings                  "
"                                                      "
" ****************Vim Mappings*************************"

" Leader set to <Space>"
let mapleader = " "
let maplocalleader = "\\"
set nohlsearch

" Standard Action Remaps
nnoremap  Y y$
nnoremap  V v$
nnoremap  J mzJ`z

" commands to edit the vim rc quickly
nnoremap <leader>vc :vsplit $MYVIMRC<cr>
nnoremap <leader>lc :vsplit ~/.config/nvim/lua/init.lua<cr>
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
"

map <silent><leader><leader>n :nohlsearch<cr>

" quick maps into a bunch of vim areas
nnoremap <leader>C :Colors<cr>
nnoremap <leader>R :reg<cr>
nnoremap <leader>M :messages<cr>

"buffer, tab, and other quick  navigation
"
nnoremap <leader>T :tabnew<cr>

"mapping to quickly move lines
nnoremap <leader>J :m .+1<CR>
nnoremap <leader>K :m .-2<CR>

"Traditional (Non-Vim) Save and Quit Bindings
nnoremap <c-s> :w<cr>
map <c-q> :qa<cr>

" *******************Abbreviations*************************"
"                                                          "
"                    Abbreviations                         "
"                                                          "
" *******************Abbreviations*************************"

" Plugins
cnoreabbrev PI PackerInstall
cnoreabbrev PC PackerClean

" Diffview
cnoreabbrev DO DiffviewOpen
cnoreabbrev DC DiffviewClose

" Packer
cnoreabbrev PS PackerSync
" *******************Plugins*************************"
"                                                 "
"                    Plugins                           "
"                                                             "
" *******************Plugins*************************"

" Moves to packer with lua/plugins/plugins.lua
"call plug#begin()
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"call plug#end()

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
"colorscheme base16-oceanicnext
colorscheme base16-nord

"hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

"colorscheme hybrid_material
let g:airline_theme='hybrid'

set background=dark
hi normal guibg=none ctermbg=none

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


"Wilder Menu
"call wilder#enable_cmdline_enter()
"set wildcharm=<Tab>
"cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
"cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

"" only / and ? are enabled by default
"call wilder#set_option('modes', ['/', '?', ':'])

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
"nnoremap ga <Cmd>lua require('jdtls').code_action()<CR>
"vnoremap ga <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
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
"let g:completion_enable_snippet = 'vim-vsnip'
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
nnoremap <leader>fh<cmd>Telescope help_tags<cr>

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

