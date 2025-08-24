require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "cpp" },
    highlight = {
        enable = true,
        disable = { "latex" },
    },
    indent = {
        enable = true,
        disable = { "latex" },
    },
})
