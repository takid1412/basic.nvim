-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        {
            "xiantang/darcula-dark.nvim",
            lazy = false,  -- Load immediately
            priority = 1000,  -- Load before other plugins
            config = function()
                require("darcula").setup({
                })
                vim.cmd("colorscheme darcula-dark")
            end,
        },
        --{ "LazyVim/LazyVim", import = "lazyvim.plugins" }
        { import = "plugins" },
    },
    checker = { enabled = true },
})
