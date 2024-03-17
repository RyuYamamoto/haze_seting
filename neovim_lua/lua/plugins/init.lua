local fn = vim.fn

require("packer").startup(function(use)
	-- colorscheme
	--use({"tomasr/molokai"})
	--use({"w0ng/vim-hybrid"})
	use({"Mofiqul/vscode.nvim"})
  use({"vscode-neovim/vscode-neovim"})
  use({"akinsho/bufferline.nvim"})
  use({"nvim-lualine/lualine.nvim"})
  use({"navarasu/onedark.nvim"})
  use({"shaunsingh/nord.nvim"})
  use({"talha-akram/noctis.nvim"})
  use({"sainnhe/gruvbox-material"})
  use({"bfrg/vim-cpp-modern"})

	use({"octol/vim-cpp-enhanced-highlight"})

	use({"vim-airline/vim-airline"})
	use({"vim-airline/vim-airline-themes"})

  use({"scrooloose/nerdtree"})
  use({"ryanoasis/vim-devicons"})

  use({"neoclide/coc.nvim", branch = "release"})

  -- telescope
  use({"nvim-lua/plenary.nvim"})
  use({"nvim-telescope/telescope.nvim"})
  use({"nvim-telescope/telescope-frecency.nvim"})

	use({"akinsho/toggleterm.nvim"})
end)

require("plugins.config.coc")
require("plugins.config.toggleterm")
