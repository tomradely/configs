local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	}
})
-- mappings 
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.g.UltiSnipsExpandTrigger='<tab>'
vim.g.UltiSnipsJumpForwardTrigger='<c-j>'
vim.g.UltiSnipsJumpBackwardTrigger='<c-k>'


-- set colour scheme
vim.cmd 'colorscheme tokyonight-storm'

-- vimtex
vim.opt.encoding="utf-8"
