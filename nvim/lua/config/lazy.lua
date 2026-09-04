-- Bootstrap lazy.nvim
--
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

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        {
            'nvim-treesitter/nvim-treesitter',
            lazy = false,
            build = ':TSUpdate'
        },
        {
            'stevearc/aerial.nvim',
            opts = {},
            -- Optional dependencies
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-tree/nvim-web-devicons"
            },
        },
        {
            'saghen/blink.cmp',
            -- optional: provides snippets for the snippet source
            dependencies = { 'rafamadriz/friendly-snippets' },

            -- use a release tag to download pre-built binaries
            version = '1.*',
            -- AND/OR build from source
            -- build = 'cargo build --release',
            -- If you use nix, you can build from source with:
            -- build = 'nix run .#build-plugin',

            ---@module 'blink.cmp'
            ---@type blink.cmp.Config
            opts = {
                -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
                -- 'super-tab' for mappings similar to vscode (tab to accept)
                -- 'enter' for enter to accept
                -- 'none' for no mappings
                --
                -- All presets have the following mappings:
                -- C-space: Open menu or open docs if already open
                -- C-n/C-p or Up/Down: Select next/previous item
                -- C-e: Hide menu
                -- C-k: Toggle signature help (if signature.enabled = true)
                --
                -- See :h blink-cmp-config-keymap for defining your own keymap
                keymap = { preset = 'super-tab' },

                appearance = {
                    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                    -- Adjusts spacing to ensure icons are aligned
                    nerd_font_variant = 'mono'
                },

                -- (Default) Only show the documentation popup when manually triggered
                completion = {
                    documentation = { auto_show = false },
                    accept = { auto_brackets = { enabled = true }, },
                },

                -- Default list of enabled providers defined so that you can extend it
                -- elsewhere in your config, without redefining it, due to `opts_extend`
                sources = {
                    default = { 'lsp', 'path', 'snippets', 'buffer' },
                },

                -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
                -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
                -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
                --
                -- See the fuzzy documentation for more information
                fuzzy = { implementation = "prefer_rust_with_warning" }
            },
            opts_extend = { "sources.default" }
        },
        {
            'neovim/nvim-lspconfig',
            dependencies = { 'saghen/blink.cmp' },

        },
        { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    -- automatically check for plugin updates
    checker = { enabled = true },
})

require("aerial").setup({
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
    disable_max_lines = 100000,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

require('nvim-treesitter').setup {
    -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
    install_dir = vim.fn.stdpath('data') .. '/site',
    highlight = {
        enable = true
    }
}

require('nvim-treesitter').install { 'c', 'cpp', 'python' }

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python"},
    callback = function()
        vim.treesitter.start() -- enable tree sitter
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr' -- enable auto fold

        -- lsp servers
        vim.lsp.enable('pylsp')
    end,
})

local clangd_compile_commands_dir = vim.fn.expand("~/")

vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--compile-commands-dir=" .. clangd_compile_commands_dir,
        "--limit-results=0",
        "--header-insertion=never",
        "--all-scopes-completion",
        "--enable-config"
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        vim.treesitter.start() -- enable tree sitter
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr' -- enable auto fold

        -- lsp servers
        vim.lsp.enable('clangd')
    end,
})

vim.diagnostic.config({
    signs = false,
    virtual_text = true;
})

-- require("catppuccin").setup({
--     transparent_background = true,
--     color_overrides = {
--         all = {
--             surface1 = "#a5adcb",
--         },
--     }
-- })

vim.cmd.colorscheme "catppuccin-nvim"
