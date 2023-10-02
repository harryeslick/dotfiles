I suggest you create a fork of this, so you can modify it.

The approach used here is from https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

To set this up on your machine, use this script `setup_dotfiles.sh`

In that script, change `https://github.com/harryeslick/dotfiles-ai.git` to your fork, before you run it.


#-------------- Installing MacOS packages. 
Install homebrew

	`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`


The Xcode Command Line Tools includes `git` and `make` (not available on stock macOS).
Then, install this repo with `curl` available:

    `bash -c "`curl -fsSL https://raw.githubusercontent.com/webpro/dotfiles/master/remote-install.sh`"`

This will clone (using `git`), or download (using `curl` or `wget`), this repo to `~/.dotfiles`. Alternatively, clone manually into the desired location:


