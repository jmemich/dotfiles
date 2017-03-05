#! /bin/bash
# dotfiles jazz -- TODO clean this up

# TODO fix zsh shell

# sudo apt-get install -y zsh
export ZSH="$HOME/.dotfiles/oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# need to log back in for this to take effect!
sudo chsh -s $(which zsh) vagrant

sudo gem install homesick
homesick clone https://github.com/jmemich/dotfiles

# ls -s ~/shared/.work ~/.work
homesick symlink dotfiles
pushd ~/.homesick/repos/dotfiles
git submodule init && git submodule update # Needed?
popd

# TODO colors!
# http://ethanschoonover.com/solarized/vim-colors-solarized

echo "export PATH=/home/vagrant/miniconda3/bin:$PATH" >> ~/.zshrc
echo "source ~/.work" >> ~/.zshrc
