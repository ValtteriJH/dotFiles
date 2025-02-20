sudo apt install -y i3 libfuse2 git tmux kitty zsh clang gcc hsetroot picom rofi thunar ranger python-is-python3 xclip tlp playerctl brightnessctl
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
chsh -s $(which zsh)


sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# For laptops sudo nvim /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf change the setting to 2 for faster wifi
# TLP is also for laptops, espcially thinkpads. Power control inependent of the charger connection. Can force discharge to conserve battey
# FOSS projects:
# https://github.com/zoltanp/xrandr-invert-colors
# NVIM
# pomodoro-cli
