vim.pack.add({
    {
        src = 'https://github.com/catppuccin/nvim',
        name = 'catppuccin',
        version = '30fa4d122d9b22ad8b2e0ab1b533c8c26c4dde86'
    },
    {
        src = 'https://github.com/chentoast/marks.nvim',
        name = 'marks.nvim',
        version = 'f353e8c08c50f39e99a9ed474172df7eddd89b72'
    },
    {
        src = 'https://github.com/mason-org/mason-lspconfig.nvim',
        name = 'mason-lspconfig.nvim',
        version = '7f0bf635082bb9b7d2b37766054526a6ccafdb85'
    },
    {
        src = 'https://github.com/mason-org/mason.nvim',
        name = 'mason.nvim',
        version = '7dc4facca9702f95353d5a1f87daf23d78e31c2a'
    },
    {
        src = 'https://github.com/nvim-mini/mini.nvim',
        name = 'mini.nvim',
        version = '9a92084b3e9595568c0b07b62ad3c43249fa91fb'
    },
    {
        src = 'https://github.com/neovim/nvim-lspconfig',
        name = 'nvim-lspconfig',
        version = '3d97ec4174bcc750d70718ddedabf150536a5891'
    },
    {
        src = 'https://github.com/stevearc/oil.nvim',
        name = 'oil.nvim',
        version = 'bbad9a76b2617ce1221d49619e4e4b659b3c61fc'
    },
    {
        src = 'https://github.com/mrjones2014/smart-splits.nvim',
        name = 'smart-splits.nvim',
        version = '67cbc412b83014ea5f92d617471d459714b5e6c7'
    },
    {
        src = 'https://github.com/tpope/vim-dispatch',
        name = 'vim-dispatch',
        version = 'a2ff28abdb2d89725192db5b8562977d392a4d3f'
    },
    {
        src = 'https://github.com/lervag/vimtex',
        name = 'vimtex',
        version = '6fabe8b7b5e83f753eb930036b1d941b2f7d3d4d'
    },
})

vim.cmd("colorscheme catppuccin-mocha")

require("plugins.marks")
require("plugins.mason")
require("plugins.mini")
require("plugins.oil")
require("plugins.smart-splits")
require("plugins.vimtex")

