local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- user experience
	"nvim-lua/plenary.nvim", 
  "nvim-lua/popup.nvim",
	"numToStr/Comment.nvim",
	"akinsho/bufferline.nvim",
	"moll/vim-bbye",
	"akinsho/toggleterm.nvim",
	"folke/which-key.nvim",
	-- explorer
	"nvim-tree/nvim-tree.lua",
	-- status bar
	"nvim-lualine/lualine.nvim",
	"nvim-tree/nvim-web-devicons",

	-- formatting
	"lukas-reineke/indent-blankline.nvim",
	-- autocomplete
	-- "hrsh7th/nvim-cmp",
	-- "hrsh7th/cmp-buffer",
	-- "hrsh7th/cmp-path",
	-- "hrsh7th/cmp-nvim-lsp",
	-- "hrsh7th/cmp-nvim-lua",
	"windwp/nvim-autopairs",
	"neoclide/coc.nvim",
  "fpob/nette.vim",

	-- snippets
	"L3MON4D3/LuaSnip",
	-- "saadparwaiz1/cmp_luasnip",
	-- "rafamadriz/friendly-snippets",
	
  -- comment jsx
  "JoosepAlviste/nvim-ts-context-commentstring",

	--highlighting
	"nvim-treesitter/nvim-treesitter",
	-- "RRethy/vim-illuminate",
	
	-- LSP
	"neovim/nvim-lspconfig",
	"VonHeikemen/lsp-zero.nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jwalton512/vim-blade",

	-- Project management
	"ahmedkhalf/project.nvim",
	"nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-media-files.nvim",

  -- View images
  "edluffy/hologram.nvim",
  -- "dharmx/telescope-media.nvim",

	
	-- Theme
	"marko-cerovac/material.nvim"
})
