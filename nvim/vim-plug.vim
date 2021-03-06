" Auto install vim-plug if not available
if empty(glob('~/.config/nvim/autoload/plug.vim'))                                                                                    
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                                                             
  autocmd VimEnter * PlugInstall                                                                                                      
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()
