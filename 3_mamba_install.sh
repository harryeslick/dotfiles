export MAMBAFORGE_DIST=Mambaforge-$(uname)-$(uname -m).sh 
wget "https://github.com/conda-forge/miniforge/releases/latest/download/$MAMBAFORGE_DIST" 
bash $MAMBAFORGE_DIST -b -p ~/mambaforge && rm $MAMBAFORGE_DIST 
~/mambaforge/bin/conda init zsh 
mamba init zsh


pip3 install -U radian

# add '/Users/harryeslick/Library/Python/3.11/bin' to PATH
