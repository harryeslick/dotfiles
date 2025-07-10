
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
    ack
    bat
    ctags
    docker
    dockutil
    exa
    fzf
    gdal
    gh
    graphviz
    hatch
    htop
    jags
    lsd
    midnight-commander
    mtr
    mysql
    neofetch
    nmap
    node
    openssh
    p7zip
    pandoc
    postgresql@14
    rclone
    ripgrep
    spatialindex
    speedtest-cli
    starship
    sundials
    the_silver_searcher
    tldr
    tmux
    tree
    unar
    wget
    zenith
    zsh-autosuggestions
    zsh-syntax-highlighting
    uv
)

echo "Install packages"
for i in "${PACKAGES[@]}"
do
 brew_install_or_upgrade $i
done


echo "Installing casks..."
brew tap homebrew/cask-fonts
CASKS=(
    espanso
    font-hasklug-nerd-font
    font-caskaydia-cove-nerd-font
    font-jetbrains-mono-nerd-font
    iterm2
    maccy
    rectangle
    RStudio
    visual-studio-code
    qgis
    quarto
    zotero
    ghostty
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
echo "creating sym link for qgis to open using `qgis` command"
ln -s /Applications/QGIS.app/Contents/MacOS/QGIS /usr/local/bin/qgis
