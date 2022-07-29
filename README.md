# Yousef's dotfiles

## Installing on a fresh system

1. Remove any crap lying around
2. Install `zsh git neovim openssh-server curl dmenu dbus htop scrot feh ffmpeg mpv xbacklight`
3. `git clone --bare https://github.com/yousefamar/dotfiles.git $HOME/.dot`
4. `git --git-dir=$HOME/.dot/ --work-tree=$HOME checkout`
5. `chsh -s $(which zsh)` and reload
6. `dot submodule update --init --recursive`
7. Install vim-plug `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
8. Copy files below
9. `dot remote set-url origin git@github.com:yousefamar/dotfiles.git`
10. `cd ~/app/zsh-plugins && wget https://raw.githubusercontent.com/rupa/z/master/z.sh`
11. `md ~/.local/share/z`
12. Install kitty `curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin`
13. Install own scripts `md ~/proj/code && cd ~/proj/code && g clone https://github.com/yousefamar/misc-scripts.git misc && cd`
14. Install browser, Slack, Discord, Keybase, Spotify, Zoom, duc
15. Install python-dbus (for polybar)
16. Install OpenRazer, mons, Steam et al, node
17. Install git-fuzzy, mupdf

## Stuff to manually scp over from an old system

1. `.npmrc`
2. `.ssh/`

## Fonts

1. siji
2. Inconsolata
3. amarbar

## Ubuntuisms

1. Disable display manager in /etc/default/grub
2. Install egpu-switcher
3. Install light https://github.com/haikarainen/light

## HiDPI

Env vars in zshrc should be enough, otherwise google Xft.dpi
