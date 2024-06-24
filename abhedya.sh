#! /bin/bash
#install xfce
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install xfce4
sudo apt install xfce4-session

#configure a remote desktop service
sudo apt-get -y install xrdp
sudo systemctl enable xrdp

# Ubuntu 20, you need to give certificate access to an xrdp user
sudo adduser xrdp ssl-cert

#Configure xrdp to use xfce
echo xfce4-session >~/.xsession

#Restart the xrdp service
sudo service xrdp restart


#Install Tailscale
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --authkey tskey-auth-kJZwZRysi611CNTRL-5Cg5ad1BC1bVTRKusvTh1b6tcsutU54VD

#Install UI Folders
mkdir ~/.icons ~/.themes ~/.background ~/.fonts

#Theme Icon
cd /tmp
wget https://raw.githubusercontent.com/gyaansastra/abhedyaui/main/Beyond-icons.tar.gz
tar -xvf Beyond-icons.tar.gz -C ~/.icons
xfconf-query -c xsettings -p /Net/IconThemeName -s "Beyond"

#Theme
cd /tmp
wget https://raw.githubusercontent.com/gyaansastra/abhedyaui/main/Beyond-gtk.zip
unzip Beyond-gtk.zip -d ~/.themes
xfconf-query -c xsettings -p /Net/ThemeName -s "Beyond"

#Theme Wallpaper
wget https://raw.githubusercontent.com/gyaansastra/abhedyaui/main/GettyImages-1186776186-1600x900.jpg -P ~/.background
mv ~/.background/GettyImages-1186776186-1600x900.jpg ~/.background/wallpaper.jpg 
xfconf-query -c xfce4-desktop -p $(xfconf-query -c xfce4-desktop -l | grep "workspace0/last-image") -s ~/.background/wallpaper.jpg

#Theme Font Module
sudo apt-get install unzip -y
cd /tmp
wget https://raw.githubusercontent.com/gyaansastra/abhedyaui/main/3270.zip
unzip 3270.zip -d ~/.fonts
xfconf-query -c xsettings -p /Gtk/FontName -s "3270 Nerd Font 13"
xfconf-query -c xsettings -p /Gtk/MonospaceFontName -s "3270 Nerd Font 13"

# Disalble Desktop Icons
rm -fr ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml
wget https://raw.githubusercontent.com/gyaansastra/abhedyaui/main/xfce4-desktop.xml -P ~/.config/xfce4/xfconf/xfce-perchannel-xml/

#Rest XFCE to Default
rm -rf ~/.config/xfce4
