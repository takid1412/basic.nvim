return {
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    after = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "bash", "python", "ini", "php", "nginx" },

            sync_install = false,

            auto_install = true,

            highlight = {
                enable = true,

                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        }
    end
}
