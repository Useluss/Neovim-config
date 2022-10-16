require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "lua", "rust" },

    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },

    rainbow = {
        enable = true,
    } 
}

require'nvim-autopairs'.setup{
    disable_filetype = { "TelescopePrompt" }
}
