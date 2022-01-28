-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/nsapse/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/nsapse/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/nsapse/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/nsapse/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/nsapse/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["TrueZen.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/TrueZen.nvim",
    url = "https://github.com/Pocco81/TrueZen.nvim"
  },
  ["barbar.nvim"] = {
    config = { 'require("plugins/config/barbar")' },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["bracey.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/opt/bracey.vim",
    url = "https://github.com/turbio/bracey.vim"
  },
  chadtree = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/chadtree",
    url = "https://github.com/ms-jpq/chadtree"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-latex-symbols"] = {
    after_files = { "/home/nsapse/.local/share/nvim/site/pack/packer/opt/cmp-latex-symbols/after/plugin/cmp_latex.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/opt/cmp-latex-symbols",
    url = "https://github.com/kdheepak/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  ["cmp-vimwiki-tags"] = {
    after_files = { "/home/nsapse/.local/share/nvim/site/pack/packer/opt/cmp-vimwiki-tags/after/plugin/cmp_vimwiki_tags.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/opt/cmp-vimwiki-tags",
    url = "https://github.com/pontusk/cmp-vimwiki-tags"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  delimitmate = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/delimitmate",
    url = "https://github.com/raimondi/delimitmate"
  },
  ["diffview.nvim"] = {
    commands = { "DiffviewOpen" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/opt/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["doom-one.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/doom-one.nvim",
    url = "https://github.com/NTBBloodbath/doom-one.nvim"
  },
  ["elly.vim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/elly.vim",
    url = "https://github.com/ulwlu/elly.vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  falcon = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/falcon",
    url = "https://github.com/fenetikm/falcon"
  },
  firenvim = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  ["forest-night"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/forest-night",
    url = "https://github.com/sainnhe/forest-night"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["grammar-guard.nvim"] = {
    config = { 'require("plugins/config/grammar-guard")' },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/grammar-guard.nvim",
    url = "https://github.com/brymer-meneses/grammar-guard.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  gruvqueen = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/gruvqueen",
    url = "https://github.com/Murtaza-Udaipurwala/gruvqueen"
  },
  indentline = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/indentline",
    url = "https://github.com/yggdroot/indentline"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim",
    url = "https://github.com/nvim-lua/lsp_extensions.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { 'require("plugins/config/lualine")' },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  neorg = {
    config = { 'require("plugins/config/neorg")' },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  nordbuddy = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nordbuddy",
    url = "https://github.com/maaslalani/nordbuddy"
  },
  ["null-ls.nvim"] = {
    config = { 'require("plugins/config/null-ls")' },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  nvim = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nvim",
    url = "https://github.com/catppuccin/nvim"
  },
  ["nvim-base16"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nvim-base16",
    url = "https://github.com/RRethy/nvim-base16"
  },
  ["nvim-biscuits"] = {
    config = { 'require("plugins/config/biscuits")' },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nvim-biscuits",
    url = "https://github.com/code-biscuits/nvim-biscuits"
  },
  ["nvim-cmp"] = {
    config = { 'require("plugins/config/cmp")' },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { 'require("plugins/config/nvim-dap")' },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-gdb"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/opt/nvim-gdb",
    url = "https://github.com/sakhnik/nvim-gdb"
  },
  ["nvim-gps"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nvim-gps",
    url = "https://github.com/SmiteshP/nvim-gps"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nvim-jdtls",
    url = "https://github.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { 'require("plugins/config/lsp-config")' },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-luaref"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nvim-luaref",
    url = "https://github.com/milisims/nvim-luaref"
  },
  ["nvim-treesitter"] = {
    config = { 'require("plugins/config/treesitter")' },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/oceanic-next",
    url = "https://github.com/mhartington/oceanic-next"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/ful1e5/onedark.nvim"
  },
  ["onenord.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/onenord.nvim",
    url = "https://github.com/rmehri01/onenord.nvim"
  },
  ["org-bullets.nvim"] = {
    config = { "\27LJ\2\n0\0\1\5\0\3\0\0066\1\0\0009\1\1\1\18\3\0\0'\4\2\0B\1\3\1L\0\2\0\b♥\vinsert\ntableQ\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\fsymbols\1\0\0\0\nsetup\16org-bullets\frequire\0" },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/org-bullets.nvim",
    url = "https://github.com/akinsho/org-bullets.nvim"
  },
  orgmode = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\forgmode\frequire\0" },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/orgmode",
    url = "https://github.com/nvim-orgmode/orgmode"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    commands = { "TSPlaygroundToggle" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/opt/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
  },
  ["refactoring.nvim"] = {
    config = { 'require("plugins/config/refactor")' },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { 'require("plugins/config/rust-tools")' },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  serenade = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/serenade",
    url = "https://github.com/b4skyx/serenade"
  },
  sonokai = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/sonokai",
    url = "https://github.com/sainnhe/sonokai"
  },
  ["stabilize.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  taskwiki = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/taskwiki",
    url = "https://github.com/tbabej/taskwiki"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { 'require("plugins/config/telescope")' },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tender.vim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/tender.vim",
    url = "https://github.com/jacoborus/tender.vim"
  },
  ["todo-comments.nvim"] = {
    config = { 'require("plugins/config/todo-comments")' },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["traces.vim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/traces.vim",
    url = "https://github.com/markonm/traces.vim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-man"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/vim-man",
    url = "https://github.com/vim-utils/vim-man"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/opt/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-mundo"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/vim-mundo",
    url = "https://github.com/simnalamburt/vim-mundo"
  },
  ["vim-plugin-AnsiEsc"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/opt/vim-plugin-AnsiEsc",
    url = "https://github.com/powerman/vim-plugin-AnsiEsc"
  },
  ["vim-react-snippets"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/vim-react-snippets",
    url = "https://github.com/mlaursen/vim-react-snippets"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-taskwarrior"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/vim-taskwarrior",
    url = "https://github.com/blindFS/vim-taskwarrior"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ",
    url = "https://github.com/hrsh7th/vim-vsnip-integ"
  },
  vimtex = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  vimwiki = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  },
  ["which-key.nvim"] = {
    config = { 'require("plugins/config/which-key")' },
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["wilder.nvim"] = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  },
  winresizer = {
    loaded = true,
    path = "/home/nsapse/.local/share/nvim/site/pack/packer/start/winresizer",
    url = "https://github.com/simeji/winresizer"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-biscuits
time([[Config for nvim-biscuits]], true)
require("plugins/config/biscuits")
time([[Config for nvim-biscuits]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("plugins/config/cmp")
time([[Config for nvim-cmp]], false)
-- Config for: telescope-fzf-native.nvim
time([[Config for telescope-fzf-native.nvim]], true)
require("plugins/config/telescope")
time([[Config for telescope-fzf-native.nvim]], false)
-- Config for: grammar-guard.nvim
time([[Config for grammar-guard.nvim]], true)
require("plugins/config/grammar-guard")
time([[Config for grammar-guard.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require("plugins/config/lualine")
time([[Config for lualine.nvim]], false)
-- Config for: refactoring.nvim
time([[Config for refactoring.nvim]], true)
require("plugins/config/refactor")
time([[Config for refactoring.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
require("plugins/config/todo-comments")
time([[Config for todo-comments.nvim]], false)
-- Config for: orgmode
time([[Config for orgmode]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\forgmode\frequire\0", "config", "orgmode")
time([[Config for orgmode]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require("plugins/config/which-key")
time([[Config for which-key.nvim]], false)
-- Config for: org-bullets.nvim
time([[Config for org-bullets.nvim]], true)
try_loadstring("\27LJ\2\n0\0\1\5\0\3\0\0066\1\0\0009\1\1\1\18\3\0\0'\4\2\0B\1\3\1L\0\2\0\b♥\vinsert\ntableQ\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\fsymbols\1\0\0\0\nsetup\16org-bullets\frequire\0", "config", "org-bullets.nvim")
time([[Config for org-bullets.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
require("plugins/config/null-ls")
time([[Config for null-ls.nvim]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
require("plugins/config/barbar")
time([[Config for barbar.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("plugins/config/treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
require("plugins/config/nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
require("plugins/config/rust-tools")
time([[Config for rust-tools.nvim]], false)
-- Config for: neorg
time([[Config for neorg]], true)
require("plugins/config/neorg")
time([[Config for neorg]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("plugins/config/lsp-config")
time([[Config for nvim-lspconfig]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewOpen lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'nvim-gdb'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'bracey.vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'bracey.vim'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'bracey.vim'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType wiki ++once lua require("packer.load")({'cmp-vimwiki-tags', 'vim-plugin-AnsiEsc'}, { ft = "wiki" }, _G.packer_plugins)]]
vim.cmd [[au FileType vimwiki ++once lua require("packer.load")({'cmp-vimwiki-tags', 'vim-plugin-AnsiEsc'}, { ft = "vimwiki" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType texmf ++once lua require("packer.load")({'cmp-latex-symbols'}, { ft = "texmf" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'cmp-latex-symbols'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'nvim-gdb'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType md ++once lua require("packer.load")({'vim-markdown'}, { ft = "md" }, _G.packer_plugins)]]
vim.cmd [[au FileType latex ++once lua require("packer.load")({'cmp-latex-symbols'}, { ft = "latex" }, _G.packer_plugins)]]
vim.cmd [[au FileType mardown ++once lua require("packer.load")({'vim-markdown'}, { ft = "mardown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/nsapse/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/nsapse/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/nsapse/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
