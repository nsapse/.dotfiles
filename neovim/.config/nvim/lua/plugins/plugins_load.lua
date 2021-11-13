vim.cmd[[packadd packer.nvim]]


return require('packer').startup(function (use)

----------------------
---~~[Editing Actions~]~
----------------------

-- Misc
use 'scrooloose/nerdcommenter'

-- Code Formatting
use 'junegunn/vim-easy-align'
use 'machakann/vim-sandwich'
use 'raimondi/delimitmate' -- look into jiangmiao/auto-pairs
use {'sbdchd/neoformat', opt=true, cmd="Neoformat"}

----------------------
---~~Navigation~~---
----------------------

--Misc
use 'tpope/vim-unimpaired'
use 'junegunn/vim-peekaboo'
--use {'gelguy/wilder.nvim', run = ':UpdateRemotePlugins'}
use 'folke/which-key.nvim'
use 'unblevable/quick-scope'
use 'phaazon/hop.nvim'
use 'liuchengxu/vista.vim'
use {'ms-jpq/chadtree', branch = 'chad',
	run = ':CHADdeps',   opt=true, cmd="CHADopen" }
use 'folke/trouble.nvim'
use {'simnalamburt/vim-mundo', opt=true, cmd='MundoToggle'}
use 'simeji/winresizer'

--Telescope
use 'nvim-telescope/telescope.nvim'

--FZF
use { 'junegunn/fzf.vim', requires = { 'junegunn/fzf', run = 'cd ~/.fzf && ./install --all'}}

----------------
---~~[[LSP]]~~--
----------------
use 'glepnir/lspsaga.nvim'
use 'neovim/nvim-lspconfig'
use 'nvim-lua/lsp_extensions.nvim'
use 'nvim-lua/plenary.nvim'
use 'ray-x/lsp_signature.nvim'


----------------------
---~~[[Treesitter]]~~---
----------------------
use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
use {'nvim-treesitter/playground', opt=true, cmd="TSPlaygroundToggle"}
--use {'windwp/nvim-ts-autotag', opt=true, ft={'html','javascripttreact'}}

----------------------
---~~[AutoComplete]~~---
----------------------
--CMP Stuff
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'
use 'saadparwaiz1/cmp_luasnip'
use 'quangnguyen30192/cmp-nvim-ultisnips'
use {'kdheepak/cmp-latex-symbols', opt=true, ft={'latex','tex', 'texmf'}}
use {'pontusk/cmp-vimwiki-tags', opt=true, ft={'wiki','vimwiki'}}

----------------------
---~~[Snippets]~~-------
---------------------
--use 'SirVer/ultisnips'
use 'honza/vim-snippets'
use 'rafamadriz/friendly-snippets'
use 'L3MON4D3/LuaSnip'

-------------------
--~~ Debugging ~~--
-------------------
use {'mfussenegger/nvim-dap-python'}
use 'mfussenegger/nvim-dap'
use 'rcarriga/nvim-dap-ui'
use 'theHamsta/nvim-dap-virtual-text'
use {'sakhnik/nvim-gdb', opt=true, ft={'c', 'cpp'}}
------------
--~~[HTML]~~--
------------
use { 'mattn/emmet-vim', opt=true, ft={'html'} }
use { 'turbio/bracey.vim', opt=true, ft={'html', 'css', 'javascript'}, run = 'npm install --prefix server' }

----------------
--~~[Markdown]~~--
----------------
use { 'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = {'markdown'},
	cmd = 'MarkdownPreview'}

use {'plasticboy/vim-markdown', opt=true, ft={'mardown','md'}}
----------------
--~~Python~~----
----------------

----------------
----~~Rust~~----
----------------
use {'simrat39/rust-tools.nvim'}

---------------------
---~~Javascript~~-----
---------------------
use {'mlaursen/vim-react-snippets', opt=true, ft={'javascript', 'javascripttreact'}}

----------------
---~~Java~~-----
----------------
use {'mfussenegger/nvim-jdtls', opt=true, ft={'java'}}
----------------
--~~LaTeX~~--
----------------
use {'lervag/vimtex', opt=true, ft={'latex', 'tex'}}

----------------
-----Lua--------
----------------
use {'folke/lua-dev.nvim'}

------------
-- ~~UI/UX~~ --
------------

-- Colorschemes
use {'Murtaza-Udaipurwala/gruvqueen', opt=true, cmd=':colorscheme'}
use {'RRethy/nvim-base16'           }
use {'b4skyx/serenade'              , opt=true, cmd=':colorscheme'}
use {'fenetikm/falcon'              , opt=true, cmd=':colorscheme'}
use {'folke/tokyonight.nvim'        , opt=true, cmd=':colorscheme'}
use {'jacoborus/tender.vim'         , opt=true, cmd=':colorscheme'}
use {'maaslalani/nordbuddy'         , opt=true, cmd=':colorscheme'}
use {'mhartington/oceanic-next'     , opt=true, cmd=':colorscheme'}
use {'morhetz/gruvbox'              , opt=true, cmd=':colorscheme'}
use {'npxbr/gruvbox.nvim'           , opt=true, cmd=':colorscheme'}
use {'rktjmp/lush.nvim'             , opt=true, cmd=':colorscheme'}
use {'sainnhe/forest-night'         , opt=true, cmd=':colorscheme'}
use {'sainnhe/gruvbox-material'     , opt=true, cmd=':colorscheme'}
use {'sainnhe/sonokai'              , opt=true, cmd=':colorscheme'}
use {'shaunsingh/nord.nvim'         , opt=true, cmd=':colorscheme'}
use {'ulwlu/elly.vim'               , opt=true, cmd=':colorscheme'}
use {'EdenEast/nightfox.nvim'       , opt=true, cmd=':colorscheme'}
use {'NTBBloodbath/doom-one.nvim'   , opt=true, cmd=':colorscheme'}

-- Focus
use {'Pocco81/TrueZen.nvim'}
use {'folke/twilight.nvim'}

-- Coloration, Highlighting, Icons, Readability
use 'markonm/traces.vim'
use 'p00f/nvim-ts-rainbow'
use 'ryanoasis/vim-devicons'
use 'yggdroot/indentline'
use 'luukvbaal/stabilize.nvim'
use 'onsails/lspkind-nvim'

--UI/UX Elements
use 'voldikss/vim-floaterm'
use 'nvim-lualine/lualine.nvim'
use 'romgrk/barbar.nvim'
use {'nvim-lua/popup.nvim', opt=true}
use 'kyazdani42/nvim-web-devicons'

----------------
-----GIT--------
----------------
use {'sindrets/diffview.nvim', opt = true, cmd = 'DiffviewOpen' }
use 'lewis6991/gitsigns.nvim'

------------------------------
--~~Personal Organization ~~--
------------------------------
-- VimWiki
use {'vimwiki/vimwiki', opt=true, ft={'wiki', 'vimwiki'}}
use {'tbabej/taskwiki', opt=true, ft={'wiki', 'vimwiki'}}
use {'powerman/vim-plugin-AnsiEsc', opt=true, ft={'wiki', 'vimwiki'}}

-- Neorg
use {'vhyrro/neorg'}
-- opt=true, cmd={'Neorg', "NeorgStart"}} -- optional start params for figure out

-- Taskwarrior
use 'blindFS/vim-taskwarrior'

----------------
-- ~~Docs, Etc--
----------------
use 'vim-utils/vim-man'

end)
