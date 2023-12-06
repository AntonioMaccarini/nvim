vim.cmd [[packadd packer.nvim]]
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Base packer
    use "ThePrimeagen/vim-be-good";
    use "rebelot/kanagawa.nvim"

    use {
        "m4xshen/hardtime.nvim",
        requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    };

    -- UI
    use "stevearc/oil.nvim"
    use 'nvim-tree/nvim-web-devicons' -- icons

    use 'nvimtools/none-ls.nvim';

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use {
        "folke/todo-comments.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }

    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Navigation
    use("ThePrimeagen/harpoon"); -- File navigation with marks

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' }
        },
    }                            -- Quick open
    use { 'BurntSushi/ripgrep' } -- used for search

    -- Source controll
    use("mbbill/undotree");           -- Shows all modifications
    use("tpope/vim-fugitive");        -- Git support
    use { 'lewis6991/gitsigns.nvim' } -- Git Annotations

    -- Base features
    use(
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    ); -- Theme support etc - nvim-treesitter

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    } -- Lsp support (Autocompletion)

    -- LSP Extenders
    use 'mfussenegger/nvim-jdtls'           -- Extender for Java
    use "Hoffs/omnisharp-extended-lsp.nvim" -- Extender for C#

    -- Dap
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use "theHamsta/nvim-dap-virtual-text"

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }                                -- Autocompletion for pairs "()"

    use { 'windwp/nvim-ts-autotag' } -- autoclose html tags
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Neorg
    use {
        "nvim-neorg/neorg",
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {},  -- Defaults
                    ["core.concealer"] = {}, -- Icons
                    ["core.dirman"] = {      -- Workspace management
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                        },
                    },
                },
                ["core.journal"] = {}, -- Icons
            }
        end,
        run = ":Neorg sync-parsers",
        requires = "nvim-lua/plenary.nvim",
    }
end);
