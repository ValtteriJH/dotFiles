sudo apt install -y i3 libfuse2 git tmux kitty zsh clang gcc hsetroot picom rofi thunar ranger python-is-python3 xclip tlp playerctl brightnessctl nodejs cmake g++ pkg-config libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

# DL alacritty
cargo install alacritty
# Alacritty proper install
sudo cp ~/.cargo/bin/alacritty /usr/bin/

sudo apt git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
chsh -s $(which zsh)

# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
git clone https://github.com/fdellwing/zsh-bat.git $ZSH_CUSTOM/plugins/zsh-bat


sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


sudo cp ./Alacritty.desktop /usr/share/applications
sudo cp ./settings.desktop /usr/share/applications

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
