sudo apt install -y i3 libfuse2 git tmux kitty zsh clang gcc hsetroot picom rofi thunar ranger python-is-python3 xclip tlp playerctl brightnessctl nodejs cmake g++ pkg-config libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 curl


#For perma darkmode add to /etc/environment
#export GTK_THEME=Adwaota-dark

sudo echo "export GTK_THEME=Adwaita:dark" >> /etc/environment


# DL alacritty
# DL rust first
sudo apt purge rustc
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

cargo install alacritty
# Alacritty proper install
sudo cp ~/.cargo/bin/alacritty /usr/bin/

sudo git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
chsh -s $(which zsh)

# zsh plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
git clone https://github.com/fdellwing/zsh-bat.git $ZSH_CUSTOM/plugins/zsh-bat


sudo cp ./Alacritty.desktop /usr/share/applications
sudo cp ./settings.desktop /usr/share/applications


sudo cp ./etc/logid.cfg /etc/
sudo cp ./etc/tlp.conf /etc/ 

sudo cp ./fonts/SauceCodeProNerdFontMono-Regular.ttf  /usr/local/share/fonts/


sudo cp -r ./keyd/ /etc/
sudo cp -r ./pomodoro/ ~/.pomodoro/

# For laptops sudo nvim /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf change the setting to 2 for faster wifi
# TLP is also for laptops, espcially thinkpads. Power control inependent of the charger connection. Can force discharge to conserve battey
# FOSS projects:
# https://github.com/zoltanp/xrandr-invert-colors
# Necessary appimages
# NVIM
# Obsidian
# Go
# Shuffler
# pomodoro-cli

#
# Install keyd and xrandr-invert-colors and clone openpomo 
# https://pachoyan.github.io/posts/wsl-configure-alacritty-windows/
# For WSL2 Integration
cd ~/codes/foss/
git clone https://github.com/zoltanp/xrandr-invert-colors.git
git clone https://github.com/open-pomodoro/openpomodoro-cli.git
git clone https://github.com/rvaiya/keyd
cd xrandr-invert-colors
sudo apt install libxcb-randr0-dev
sudo make deps-apt
sudo make install
sudo cp xrandr-invert-colors /usr/bin
cd ..
cd keyd
make && sudo make install
sudo systemctl enable --now keyd
cd ~/codes/swider/dotFiles
