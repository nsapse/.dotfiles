-- arduino
vim.g.arduino_dir = "/home/noah/Arduino"
vim.g.arduino_home_dir = "/home/noah/.arduino15"

-- ASM
vim.g.asmsytax = 'masm' -- sets ASM default to MASM

-- markdown
vim.g.vim_markdown_conceal = 1
vim.g.vim_markdown_conceal_code_blocks = 0

-- vimtex
vim.g.tex_flavor='latex'
vim.g.vimtex_view_method='zathura'
vim.g.tex_conceal='adbmg'
vim.g.vimtex_quickfix_mode=1
vim.g.vimtex_syntax_conceal="'greek':1,'styles':1,'math_delimiters':1,'math_bounds':1,'math_super_sub':1,'math_symbols':1,'math_fracs':1,'fancy':1,'accents':0"
vim.o.conceallevel=0

local rainbow_delimiters = require 'rainbow-delimiters'

    vim.g.rainbow_delimiters = {
        strategy = {
            [''] = rainbow_delimiters.strategy['global'],
            commonlisp = rainbow_delimiters.strategy['local'],
        },
        query = {
            [''] = 'rainbow-delimiters',
            lua = 'rainbow-blocks',
        },
        highlight = {
            'RainbowDelimiterRed',
            'RainbowDelimiterYellow',
            'RainbowDelimiterBlue',
            'RainbowDelimiterOrange',
            'RainbowDelimiterGreen',
            'RainbowDelimiterViolet',
            'RainbowDelimiterCyan',
        },
        blacklist = {'c', 'cpp'},
    }

-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter", "BufCreate"}, {
--     pattern = { "*.*tf"}
--
-- })
