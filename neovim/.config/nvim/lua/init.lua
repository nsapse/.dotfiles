-- Primary Init File ---

-- load LAZY for package management
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- map the leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Sources Broken Out Configs --
require("lazy").setup("plugins")
require("mappings")
require("configuration")
require("setup_lsp")
