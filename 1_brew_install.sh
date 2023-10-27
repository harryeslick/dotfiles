
# adapter fro https://medium.com/macoclock/automating-your-macos-setup-with-homebrew-and-cask-e2a103b51af1

## pathikrit/mac-setup-script
# function to install or upgrade brews
function brew_install_or_upgrade {
  if brew ls --versions "$1" >/dev/null; then
    if (brew outdated | grep "$1" > /dev/null); then
      echo "Upgrading already installed package $1 ..."
      brew upgrade "$1"
    else
      echo "Latest $1 is already installed"
    fi
  else
    brew install "$1"
  fi
}

function cask_install_or_upgrade {
  if brew ls --versions "$1" >/dev/null; then
    if (brew outdated | grep "$1" > /dev/null); then
      echo "Upgrading already installed package $1 ..."
      brew upgrade --cask "$1"
    else
      echo "Latest $1 is already installed"
    fi
  else
    brew install --cask "$1"
  fi
}

# Update homebrew recipes
# brew tap federico-terzi/espanso

brew update
brew doctor

PACKAGES=(
    node
    zsh-autosuggestions
    zsh-syntax-highlighting
    howdoi
    espanso
    midnight-commander
    nmap
    speedtest-cli
    wget
    htop
    ack
    tmux
    the_silver_searcher
    mysql
    fzf
    ctags
    openssh
    starship
    bat
    ripgrep
    exa
    gh
    tldr
    micro
    pandoc


)

echo "Install packages"
for i in "${PACKAGES[@]}"
do
 brew_install_or_upgrade $i
done


echo "Installing casks..."
brew tap homebrew/cask-fonts
CASKS=(
    zotero
    iterm2
    visual-studio-code
    qgis
    espanso
    maccy
    rectangle
    RStudio
    obsidian
    font-hasklug-nerd-font
    font-caskaydia-cove-nerd-font
    font-jetbrains-mono-nerd-font


)

echo "Installing cask apps..."
brew tap homebrew/cask-versions
for i in "${CASKS[@]}"
do
  cask_install_or_upgrade "$i"
done

echo "Cleaning up..."
brew cleanup



echo "Installing cask - Nerdfonts"
brew install --cask font-Hasklig-nerd-font

echo "Brew install setup completed!"


echo "Configuring installed packages... ----------------------------------"
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
echo 'eval "$(gh completion -s zsh)"' >> ~/.zshrc
echo 'export STARSHIP_CONFIG=~/.config/starship.toml' >> ~/.zshrc
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $HOME/.zshrc
