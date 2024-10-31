local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerCompile
  augroup end
]]

local packer_status, packer = pcall(require, "packer")
if not packer_status then
    print("packer not found")
    return
end

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'

    use 'bluz71/vim-nightfly-colors'
    use 'nvim-tree/nvim-web-devicons'

    use 'numToStr/comment.nvim'
    use 'akinsho/bufferline.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use 'mg979/vim-visual-multi'
    use 'justinmk/vim-sneak'
    use 'kylechui/nvim-surround'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'

    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use { 'jonarrien/telescope-cmdline.nvim' }

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
