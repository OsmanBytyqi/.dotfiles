return require("packer").startup(function()
    use("wbthomason/packer.nvim")
    -- use("sbdchd/neoformat")


    ---- TJ created lodash of neovim
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")

    ---- All the things
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    -- use("tzachar/cmp-tabnine", { run = "./install.sh" })
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use("simrat39/symbols-outline.nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("tpope/vim-surround")
    use("tpope/vim-commentary")
    use("junegunn/goyo.vim")

    use("mbbill/undotree")

    ---autoclose tag
    -- use("windwp/nvim-ts-autotag")
    use("windwp/nvim-autopairs")
    ---- Colorscheme section
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")


    -- use({
    --     "nvim-treesitter/nvim-treesitter",
    -- commit = "4cccb6f494eb255b32a290d37c35ca12584c74d0"
    -- })

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    use("folke/zen-mode.nvim")
    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")

    -- use("mfussenegger/nvim-dap")
    -- use("rcarriga/nvim-dap-ui")
    -- use("theHamsta/nvim-dap-virtual-text")
end)

