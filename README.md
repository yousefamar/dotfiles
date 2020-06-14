# Yousef's dotfiles

## Installing on a fresh system

1. Remove any crap lying around
2. Install `zsh git neovim openssh-server curl`
3. `git clone --bare https://github.com/yousefamar/dotfiles.git $HOME/.dot`
4. `git --git-dir=$HOME/.dot/ --work-tree=$HOME checkout`
5. `chsh -s $(which zsh)` and reload
6. `dot submodule update --init --recursive`
7. Install vim-plug `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
8. Copy files below
9. `dot remote set-url origin git@github.com:yousefamar/dotfiles.git`
10. `cd ~/app/zsh-plugins && wget https://raw.githubusercontent.com/rupa/z/master/z.sh`

## Stuff to manually scp over from an old system

1. `.npmrc`
2. `.ssh/`
