#! /bin/bash
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
