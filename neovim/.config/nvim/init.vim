" ****************Vim Settings*************************"
"               
"           Settings for Vim Settings                  "
"                                                      "
" ****************Vim Settings*************************"

" source by init.lua
lua require('init')

" for arduino
let g:arduino_dir = "/home/noah/Arduino"
let g:arduino_home_dir = "/home/noah/.arduino15"

" *******************Abbreviations*************************"
"                                                          "
"                                                          "
"                    Abbreviations                         "
" *******************Abbreviations*************************"

cnoreabbrev vc ~/.config/nvim/init.vim

" Plugins
cnoreabbrev PI PackerInstall
cnoreabbrev PCc PackerClean
cnoreabbrev PCo PackerCompile

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

" Moved to packer with lua/plugins/plugins.lua

" ****************Colorscheme and U/I*************************"
"                                                             "
"           Settings for Colorscheme and U/I                  "
"                                                             "
" ****************Colorscheme and U/I*************************"

"colorscheme and UI settings

 
highlight Comment cterm=italic

hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

map <C-_> <Leader>c<Space>
nnoremap<c-t> :Vista!!<cr>

" small augroup to read .kbd files for kmonad
augroup kbd
  au!
  autocmd BufNewFile,BufRead *.kbd   set filetype=kbd 
augroup END

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

" **********************LSP ACTIONS************************* "
"                                                            "
"                  Settings for LSP ACTIONS                  "
"                                                            "
" **********************LSP ACTIONS************************* "

" start completion
" autocmd BufEnter * lua require'completion'.on_attach()

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gD <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent>gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent>K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent><C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent><C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>D <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
"
" somewhat unrelated quickfix navigation
nnoremap <silent>qn :cn<cr>
nnoremap <silent>qp :cp<cr>
"

" "rename
nnoremap <silent>RR <cmd>lua require('lspsaga.rename').rename()<CR>
 "preview definition
nnoremap <silent>pd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
"
" "code action
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

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
nnoremap <leader>jr <Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>

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

" ****************Treesitter*************************"
"                                                    "
"           Settings for Treesitter                  "
"                                                    "
" ****************Treesitter*************************"

" Toggle TSPlayground
nnoremap <silent> <leader>pt :TSPlaygroundToggle<cr>

"Enable Folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()


" ****************NerdTree*************************"
"                                                  "
"           Settings for NerdTree                  "
"                                                  "
" ****************NerdTree*************************"

map <silent><C-n> :CHADopen<CR>


" ****************DiffView*************************"
"                                                  "
"           Settings for DiffView                  "
"                                                  "
" ****************DiffView*************************"
nnoremap <leader>do :DiffviewOpen<cr> 
nnoremap <leader>dc :DiffviewClose<cr> 


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

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect,preview

" Avoid showing message extra message when using completion
set shortmess+=c

" ****************LightSpeed*************************"
"                                                    "
"           Settings for LightSpeed                  "
"                                                    "
" ****************LightSpeed*************************"


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
nnoremap <leader><leader>u :UndotreeToggle<cr>

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

" Using Lua functions
nnoremap <c-f> :Telescope file_browser<cr>
nnoremap <leader>fz <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>sts <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <leader>ds <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>
nnoremap <leader>ws <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>
nnoremap <leader>sd <cmd>lua require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>gg <cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>gw <cmd>lua require('telescope.builtin').grep_string(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>" <cmd>lua require('telescope.builtin').registers()<cr>

" Telescope grep seeps crashing - remapped to ripgrem in Floatterm
nnoremap <leader>sr <cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>sb <cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>sh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>sq <cmd>lua require('telescope.builtin').quickfix(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>sk <cmd>lua require('telescope.builtin').keymaps(require('telescope.themes').get_ivy({}))<cr>

nnoremap <leader>cc <cmd>lua require('telescope.builtin').colorscheme()<cr>
nnoremap <leader>ca <cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>st :TodoTelescope<cr>

"telescope git stuff
nnoremap <leader>gc  <cmd>lua require('telescope.builtin').git_commits(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>gcb <cmd>lua require('telescope.builtin').git_bcommits(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>gf  <cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_ivy({}))<cr>



" ****************Focus*************************
"                
"   Focus Plugins (Zen, Limelight, etc) 
"
" ****************Focus*************************

map <silent><leader>z :TZAtaraxis<CR><bar>:Twilight<CR>
map <silent><leader>Z :TZMinimalist<CR><bar>:Twilight<CR>

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
let g:vimtex_syntax_conceal={'greek':1,'styles':1,'math_delimiters':1,'math_bounds':1,'math_super_sub':1,'math_symbols':1,'math_fracs':1,'fancy':1,'accents':0}
set conceallevel=0
nnoremap <leader><leader>vc :VimtexCompile<cr>


" ****************Quickfix************************* "
"                                                   " 
"                 Quickfix                          "
"                                                   "
" ****************Quickfix************************* "


"Markdown Things
let g:vim_markdown_conceal = 1
let g:vim_markdown_conceal_code_blocks = 0


"refactoring stuff

" ****************Sandwich************************* "
"                                                   " 
"                 Sandwich                          "
"                                                   "
" ****************Sandwich************************* "


let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1

silent! nmap <unique> <leader>sa <Plug>(operator-sandwich-add)
silent! xmap <unique> <leader>sa <Plug>(operator-sandwich-add)
silent! vmap <unique> <leader>sa <Plug>(operator-sandwich-add)
silent! omap <unique> <leader>sa <Plug>(operator-sandwich-g@)

silent! nmap <unique> <leader>sar <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-query-a)

" ****************Arduino************************* "
"                                                   " 
"                 Arduino                          "
"                                                   "
" ****************Arduino************************* "

nnoremap <leader>asb :ArduinoChooseBoard<cr>
nnoremap <leader>acp :ArduinoChooseBoard<cr>
nnoremap <leader>au :ArduinoUpload<cr>
nnoremap <leader>av :ArduinoVerify<cr>
