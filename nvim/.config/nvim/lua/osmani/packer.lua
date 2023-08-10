return require("packer").startup(function()

  use("wbthomason/packer.nvim")

  -- all the color schemes
  use("luisiacc/gruvbox-baby")
  use("folke/tokyonight.nvim")
  use("gruvbox-community/gruvbox")


  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-telescope/telescope.nvim")
  use("tpope/vim-commentary")
  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"
  })
  use("github/copilot.vim")
  use("nvim-treesitter/playground")
  use("romgrk/nvim-treesitter-context")

  use {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
       'williamboman/mason.nvim', config = true ,
      'williamboman/mason-lspconfig.nvim',

      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

    },
  }

end)
