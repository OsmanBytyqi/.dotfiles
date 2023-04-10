return require("packer").startup(function()
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")

    use("sainnhe/gruvbox-material")
    use("nvim-telescope/telescope.nvim")
    ---- All the things
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("simrat39/symbols-outline.nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("tpope/vim-commentary")
    use("windwp/nvim-autopairs")

    -- colorschemes
    -- use("morhetz/gruvbox")
    use("gruvbox-community/gruvbox")
    use { "catppuccin/nvim", as = "catppuccin" }

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("github/copilot.vim")
    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")

end)

