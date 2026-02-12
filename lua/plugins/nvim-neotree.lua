return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
        local neotree = require("neo-tree")
        neotree.setup({
            position = "left",
            width = 30,
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_by_name = {},
                    never_show = {},
                }
            },
            mapping_options = {
                noremap = true,
                nowait = true,
            }
        })

        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                if vim.fn.argc() == 0 then
                    vim.cmd("Neotree reveal filesystem")
                end
            end
        })

        vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>')
    end
}
