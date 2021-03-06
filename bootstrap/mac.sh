#! /bin/bash
echo "---"

DOTFILES_ROOT=$(pwd -P)
set -e

info () {
  printf "\r  [\033[00;34m..\033[0m] $1\n"
}

user () {
  printf "\r  [\033[0;33m??\033[0m] $1\n"
}

success () {
  printf "\r\033[2K [\033[00;32mOK\033[0m] $1\n"
}

fail () {
  printf "\r\033[2K [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

install_homebrew() {
  read -r -p "Do you want to install homebrew? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap caskroom/cask
    success "Installed homebrew"
  fi
}

setup_git() {
  read -r -p "Do you want to setup git? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    git config --global user.email"huynguyennbk@gmail.com"
    git config --global user.name "Louis Nguyen"
    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
    git config --global color.ui true
    git config --global color.diff-highlight.oldNormal "red bold"
    git config --global color.diff-highlight.oldHighlight "red bold 52"
    git config --global color.diff-highlight.newNormal "green bold"
    git config --global color.diff.meta "11"
    git config --global color.diff.frag "magenta bold"
    git config --global color.diff.commit "yellow bold"
    git config --global color.diff.old "red bold"
    git config --global color.diff.new "green bold"
    git config --global color.diff.whitespace "red reverse"

    success "Setup Git Successfully"
  fi
}
install_zsh() {
  read -r -p "Do you want to install zsh? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install zsh
    sudo chsh -s $(which zsh)

    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    mkdir -p ~/.oh-my-zsh

    ln -s ../suckless/zsh/.zshrc ~/.zshrc
    ln -s ../suckless/oh-my-zsh/* ~/.oh-my-zsh

    success "Installed zsh"
  fi
}

install_font() {
  read -r -p "Do you want to install font? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts

    brew tap homebrew/cask-fonts
    brew cask install font-hack-nerd-font

    success "Installed font!"
  fi
}

install_nvim() {
  read -r -p "Do you want to install neovim? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    info "Installing neovim"
    brew install neovim

    # reduce keyrepeat for faster typing in vim
    defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
    defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

    success "Installed neovim"
  fi
}

install_terminal() {
  read -r -p "Do you want to install terminal? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew cask install alacritty

    ln -s ../suckless/mac_os/alacritty/alacritty.yml ~/.alacritty.yml
    success "Installed terminal"
  fi
}

install_window_manager() {
  read -r -p "Do you want to install window manager? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install koekeishiya/formulae/yabai
    sudo yabai --install-sa
    brew services start yabai
    killall Dock
    brew install somdoron/formulae/spacebar
    brew services start spacebar
    brew install koekeishiya/formulae/skhd
    brew services start skhd

    ln -s ../suckless/mac_os/skhdrc/.skhdrc ~/.skhdrc
    ln -s ../suckless/mac_os/yabai/.yabai ~/.yabai
    ln -s ../suckless/mac_os/spacebar/.spacebarrc ~/.spacebarrc

    success "Installed window manager! Remember to disable System Integrity Protection (SIP)"
  fi
}

install_tool() {
  read -r -p "Do you want to install some fancy tools ? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install ripgrep
    brew install neofetch
    brew install pgcli
    brew install mycli
    brew install bat
    brew install httpie
    brew install diff-so-fancy
    brew install terminal-notifier
    brew install bluetoothconnector
    brew install exa
    brew install fzf
    $(brew --prefix)/opt/fzf/install
    success "Installed some fancy tools"
  fi
}

install_homebrew
setup_git
install_zsh
install_terminal
install_nvim
install_window_manager
install_tool

echo "---"

echo "Finish Install!"
