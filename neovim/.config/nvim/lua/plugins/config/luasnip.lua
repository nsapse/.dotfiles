-- Load Snippets into Luasnip
require("luasnip/loaders/from_vscode").lazy_load()

local function prequire(...)
local status, lib = pcall(require, ...)
if (status) then return lib end
    return nil
end
--
local luasnip = prequire('luasnip')
local cmp = prequire("cmp")
--
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.ctrl_complete = function()
    if luasnip and luasnip.expand_or_jumpable() then
        return t("<Plug>luasnip-expand-or-jump")
    end
    return ""
end
_G.s_ctrl_complete = function()
    if luasnip and luasnip.jumpable(-1) then
        return t("<Plug>luasnip-jump-prev")
    end
    return ""
end
--

vim.api.nvim_set_keymap("i", "<C-j>", "v:lua.ctrl_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-j>", "v:lua.ctrl_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-k>", "v:lua.s_ctrl_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-k>", "v:lua.s_ctrl_complete()", {expr = true})
--

