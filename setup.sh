username=$(id -u -n 1000)
builddir=$(pwd)


# Update packages list
apt update


# Install base packages
# https://wiki.archlinux.org/title/desktop_environment
apt install xterm unzip lightdm rofi thunar lxpolkit lxappearance xorg lightdm-gtk-greeter network-manager light-locker alsa-utils pulseaudio pavucontrol firefox-esr flameshot feh -y

# Install qtile
apt install python3 -y
apt install xserver-xorg xinit libpangocairo-1.0-0 python3-pip python3-xcffib python3-cairocffi -y
pip install qtile
pip install psutil


# Enable lightdm on start up
sudo systemctl enable lightdm.service
# Custom config for lightdm & lightdm-gtk-greeter
cp -R lightDM/* /etc/lightdm/


# Copy configuration files
cp dotfiles/qtile.desktop /usr/share/xsessions/
cp .Xresources /home/$username/
chown $username /home/$username/.Xresources
chgrp $username /home/$username/.Xresources
mkdir -p /home/$username/.config
cp -R dotfiles/* /home/$username/.config/
cp dotfiles/gtk-2.0/.gtkrc-2.0 /home/$username/
chown $username /home/$username/.gtkrc-2.0 
chgrp $username /home/$username/.gtkrc-2.0 
cd /home/$username/.config/kitty
ln -s themes/Dracula-mod.conf theme.conf
cd /home/$username
chown -R $username .config
chgrp -R $username .config
# mv .config/vimrc /etc/vim/vimrc
chmod +x /home/$username/.config/qtile/autostart.sh

cd $builddir
# Add theme and icons
cp themes-icons/Orchis.tar.xz /usr/share/themes
tar -xf /usr/share/themes/Orchis.tar.xz -C /usr/share/themes/
rm /usr/share/themes/Orchis.tar.xz
cp themes-icons/01-Tela.tar.xz /usr/share/icons
tar -xf /usr/share/icons/01-Tela.tar.xz -C /usr/share/icons/
rm /usr/share/icons/01-Tela.tar.xz

# Add images
mkdir -p /usr/share/backgrounds
mkdir -p /usr/share/backgrounds/wallpapers
cp images/login-background.jpg /usr/share/backgrounds/
cp images/background-1.jpeg /usr/share/backgrounds/wallpapers/
cp images/electric-guitar.png /usr/share/pixmaps/

# Add fonts
#https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts
mkdir -p /usr/share/fonts/NerdFonts
cp -R fonts/* /usr/share/fonts/NerdFonts/
tar -xf /usr/share/fonts/NerdFonts/NerdFiraCode.tar.gz -C /usr/share/fonts/NerdFonts
tar -xf /usr/share/fonts/NerdFonts/NerdCodeNewRoman.tar.gz -C /usr/share/fonts/NerdFonts
rm /usr/share/fonts/NerdFonts/NerdCodeNewRoman.tar.gz
rm /usr/share/fonts/NerdFonts/NerdFiraCode.tar.gz
fc-cache -fv

# create user directories
cd /home/$username
mkdir -p Documents Downloads Music Pictures Videos
chown $username *
chgrp $username *
