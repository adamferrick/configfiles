" Use vimrc configurations in neovim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc


" neovim-specific configurations

set guicursor=a:blinkwait400-blinkoff400-blinkon400,n:block,i-ci-ve:ver25,r-cr:hor20



" Neovim-specific plugins

" Treesitter plugin
" https://github.com/nvim-treesitter/nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    }
}
EOF
