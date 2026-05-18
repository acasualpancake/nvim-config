return {
    {
        "mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "blink.cmp",
            "mason.nvim",
        },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            vim.lsp.config("rust_analyzer", {
                capabilities = capabilities,
            })

            vim.lsp.config("clangd", {
                capabilities = capabilities,
            })

            vim.lsp.enable({ "lua_ls", "rust_analyzer", "clangd" })
        end,
    },
}