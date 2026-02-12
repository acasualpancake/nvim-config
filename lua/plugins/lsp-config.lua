return {
    {
        "mason-org/mason.nvim",
        opts = {},
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls", "rust_analyzer", "clangd"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Enable all language servers
            vim.lsp.enable('lua_ls')
            vim.lsp.enable('rust_analyzer')
            vim.lsp.enable('clangd')

            -- Set keymaps
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({'n','v'}, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
