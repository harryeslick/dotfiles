I suggest you create a fork of this, so you can modify it.

The approach used here is from https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/



# Install `xcode-select` to get 'git'
`xcode-select --install`

# Install homebrew #https://brew.sh

	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Setup the base `config` repo to manage dotfiles
To set this up on your machine, use the script `setup_dotfiles.sh` within this repo.   
or run:   
`curl -Lks https://raw.githubusercontent.com/harryeslick/dotfiles/master/setup_dotfiles.sh | /bin/bash`

This will   
* git clone the dotfiles repository. 
* setup the git mechanics to source control selected dotfiles using `config` command
* config files containing private data should not be commited
	* to prevent details leaking from .gitconfig or .zshrc, these repos are not tracked. an explicit .gitconfig.public and .zshrc.public are used and sourced in actual .zshrc...


# Installing MacOS packages. 

Install brew packages and casks: `bash brew_install.sh`  
Update MacOS default settings: `bash mac_defaults.sh`  
Install conda/mamba: `bash mamba_install.sh`  
setup the macOS dock: `bash mac_dock.sh`  



# Updating dotfiles
After you've executed the setup any file within the $HOME folder can be versioned with normal commands, replacing git with your newly created config alias, like:
```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

TODO
* startship config
  * nerdfond install
* Obsidian notes
* 