# Yousef's dotfiles

## Installing on a fresh system

1. Remove any crap lying around
2. Install `zsh git neovim openssh-server`
3. `git clone --bare https://github.com/yousefamar/dotfiles.git $HOME/.dot`
4. `git --git-dir=$HOME/.dot/ --work-tree=$HOME checkout`
5. `chsh -s $(which zsh)` and reload
6. `dot submodule update --init --recursive`
