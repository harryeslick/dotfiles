# source: https://github.com/fastai/fastsetup/blob/master/dotfiles.sh
# run once to clone dotfiles and install. 
cd
shopt -s expand_aliases
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
echo ".cfg" >> .gitignore
read -e -p "Please paste a HTTPS link to your dotfiles repository (or press enter to use defaults): " DOTFILES_URL
[[ -z $DOTFILES_URL ]] && DOTFILES_URL=https://github.com/harryeslick/dotfiles-ai.git
git clone --bare $DOTFILES_URL .cfg/
config checkout
# only continue if checkout had no errors
if [[ $? = 0 ]]; then
  config config --local status.showUntrackedFiles no
  if [[ -s ~/.vimrc ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
  fi
  if [[ -f ~/.zshrc.local ]]; then
    echo "source ~/.zshrc.local" >> ~/.zshrc
  fi
  if [[ -f ~/.zsh_profile ]]; then
    grep -q 'source ~/.zshrc' ~/.zsh_profile 2>&1 || echo "source ~/.zshrc" >> ~/.zsh_profile;
  else
    echo "Creating '.zsh_profile'..."
    echo "source ~/.zshrc" >> ~/.zsh_profile
  fi
  . ~/.bashrc

  [[ -z $NAME  ]] && read -e -p "Enter your name (for git configuration): " NAME
  [[ -z $EMAIL ]] && read -e -p "Enter your email (for git configuration): " EMAIL
  [[ $NAME  ]] && git config --global user.name "$NAME"
  [[ $EMAIL ]] && git config --global user.email "$EMAIL"
  git config --global credential.helper cache
  git config --global credential.helper 'cache --timeout=3600'

  cd -
else
  echo "Error with dotfiles checkout, see above and retry."
  rm -rf .cfg/
fi