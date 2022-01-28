# Dotfiles

Configuration files for my setup.

## Nvim

0. Install Neovim >= 0.6.0

#### Ubuntu

Get the latest release from: https://github.com/neovim/neovim/releases
```
chmod u+x nvim.appimage
cp nvim.appimage /usr/local/bin
ln -s /usr/local/bin/nvim.appimage /usr/bin/nvim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
```

Neovim should now be installed, try running `vi --version`

Now, install dependencies:

```
sudo apt-get install ripgrep
sudo apt install fd-find
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

(Optional) For ccls:
```
sudo apt install zlib1g-dev libncurses-dev rapidjson-dev
```

1. Clone the repository:
```
git clone "https://github.com/dishankgoel/dotfiles.git"
```

2. Use the config
```
cd dotfiles
stow nvim
```

3. Install plugins
Inside neovim, run:
```
:PlugInstall
```
