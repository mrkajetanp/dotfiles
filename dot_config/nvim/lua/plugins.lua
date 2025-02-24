return require('packer').startup(function(use)
	-- Base plugins
	use 'wbthomason/packer.nvim'
	use 'liuchengxu/vim-better-default'
    use 'echasnovski/mini.nvim'
	use 'svermeulen/vimpeccable'
	use { 'Shougo/vimproc.vim', run = 'make' }
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'tpope/vim-rhubarb'
    use 'prabirshrestha/async.vim'

	-- Movement
	use 'easymotion/vim-easymotion'
    use 'wesQ3/vim-windowswap'
    use 'wellle/visual-split.vim'
    use 'coderifous/textobj-word-column.vim'
    use 'wellle/targets.vim'
    use 'tpope/vim-surround'
    use 'godlygeek/tabular'
    use 'Raimondi/delimitMate'

	-- Search
    use 'scrooloose/nerdtree'
    use 'jistr/vim-nerdtree-tabs'
    use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
    use 'junegunn/fzf.vim'

	-- Visual plugins
	use 'junegunn/seoul256.vim'
	use 'morhetz/gruvbox'
	use 'navarasu/onedark.nvim'
	use 'frazrepo/vim-rainbow'
	use 'liuchengxu/eleline.vim'

	-- Session management
	use 'xolox/vim-misc'
	use 'xolox/vim-session'

    -- Programming
    use { 'neoclide/coc.nvim', branch  = 'release' }
    use 'dense-analysis/ale'
    use 'airblade/vim-gitgutter'
    use 'jeetsukumaran/vim-pythonsense'
    use 'tpope/vim-fugitive'

    -- Others
    use { "m4xshen/hardtime.nvim", requires = { 'MunifTanjim/nui.nvim' }}
end)
