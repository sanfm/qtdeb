# qtDeb
The debian environment I use for testing, with Qtile as the window manager

## SUDO for your user

1. Install sudo

```bash
su -
apt install sudo
```

2. Add the user to the sudo group

```bash
usermod -aG sudo <username>
```

3. Logout

Now the user has sudo privileges

## Kitty install

Since the kitty debian package from the apt repository is pretty outdated, I prefer installing kitty using the pre-built binaries of kitty

1. Download and install

```
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

2. Add kitty to your path
```
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
```

3. Make kitty icon available for your desktop
```
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
```

This installation guide can be found in the kitty docs:
https://sw.kovidgoyal.net/kitty/binary/#uninstalling


## Nvim install and config

1. Download latest stable nvim release

```
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
```

2. Install the package

```
sudo apt install ./nvim-linux64.deb
```

3. Install packer (nvim plugin manager)

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

4. Download plugins

```
cd ~/.config/nvim/lua/fm
nvim packer.lua
:so
:PackerSync
```


# Zsh

1. Install zsh and powerlevel10k

```
sudo apt install zsh

touch "$HOME/.cache/zshhistory"
#-- Setup Alias in $HOME/zsh/aliasrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
```

2. Change default shell
```
chsh $USER
```
Then type: /bin/zsh
