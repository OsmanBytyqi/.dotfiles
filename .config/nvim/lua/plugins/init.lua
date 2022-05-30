return require('packer').startup(function()
	use 'nvim-treesitter/nvim-treesitter'
        use 'neovim/nvim-lspconfig'

	use 'hrsh7th/nvim-compe'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
end)
