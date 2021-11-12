vim.cmd[[packadd packer.nvim]]


return require('packer').startup(function ()

------------
---~~LSP~~--
------------
----------------------
---~~AutoComplete~~---
----------------------
----------------------
---~~AutoComplete~~---
----------------------
------------
--~~HTML~~--
------------
use { 'mattn/emmet-vim', opt=true, ft={'html'} }
use { 'turbio/bracey.vim', opt=true, ft={'html', 'css', 'javascript'}, run = 'npm install --prefix server' }

----------------
--~~Markdown~~--
----------------
----------------
--~~Python~~----
----------------
----------------
---~~Java~~-----
----------------
----------------
--~~LaTeX~~--
----------------
use {'lervag/vimtex', opt=true, ft={'latex', 'tex'}}
use {'kdheepak/cmp-latex-symbols', opt=true, ft={'latex', 'tex'}}

------------
-- ~~UI~~ --
------------

-- Colorschemes
use 'Murtaza-Udaipurwala/gruvqueen'
use 'RRethy/nvim-base16'
use 'b4skyx/serenade'
use 'fenetikm/falcon'
use 'folke/tokyonight.nvim'
use 'jacoborus/tender.vim'
use 'maaslalani/nordbuddy'
use 'mhartington/oceanic-next'
use 'morhetz/gruvbox'
use 'npxbr/gruvbox.nvim'
use 'rktjmp/lush.nvim'
use 'sainnhe/forest-night'
use 'sainnhe/gruvbox-material'
use 'sainnhe/sonokai'
use 'shaunsingh/nord.nvim'
use 'ulwlu/elly.vim'
use 'EdenEast/nightfox.nvim'
use 'NTBBloodbath/doom-one.nvim'

end)
