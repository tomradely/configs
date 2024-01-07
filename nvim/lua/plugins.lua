vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end
vim.api.nvim_command('packadd packer.nvim')
-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_setup(name)
	return string.format('require("setup/%s")', name)
end

return require('packer').startup({
	function(use)
	-- packer
	use('wbthomason/packer.nvim') -- Packer can manage itself
	-- mason 
	use({ 'williamboman/mason.nvim', config = get_setup('mason') })
	use 'williamboman/mason-lspconfig.nvim'
	-- colour schemes
	use 'EdenEast/nightfox.nvim'
	use 'ellisonleao/gruvbox.nvim'
	use {'catppuccin/nvim', as = 'catppuccin'}
	use 'rmehri01/onenord.nvim' -- may require additional work for lualine
	use 'folke/tokyonight.nvim' -- comes in night, storm, day, and moon variations (i.e., colorscheme tokyonight-night)
	use 'rebelot/kanagawa.nvim' -- comes in wave, dragon, and lotus variants (see tokyonight)
	use 'craftzdog/solarized-osaka.nvim'
	-- nvim-web-devicons
	use({ 'nvim-tree/nvim-web-devicons', config = get_setup('nvim-web-devicons') })
	-- nvim-cmp
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-cmdline'},
			{'L3MON4D3/LuaSnip'},
		},
		config = get_setup('cmp'),
	})
	-- nvim-treesitter
	use({ 'nvim-treesitter/nvim-treesitter', config = get_setup('nvim-treesitter') })
	-- telescope
	use({
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = {'nvim-lua/plenary.nvim'},
	config = get_setup('telescope'),
	})
	use {
		'nvim-telescope/telescope-fzf-native.nvim', run = 'make'
	}
	-- neo-tree
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = get_setup('neo-tree'),
	})
	-- nvim-visual-multi
	use 'mg979/vim-visual-multi'
	-- git-gutter
	use 'airblade/vim-gitgutter'
	-- lualine
	use({
		'nvim-lualine/lualine.nvim',
		config = get_setup('lualine'),
		event = 'VimEnter'
	})
	-- alpha-nvim
	use({ 'goolord/alpha-nvim', config = get_setup('alpha-nvim') })
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})
