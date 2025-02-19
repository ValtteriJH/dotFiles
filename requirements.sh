sudo apt install -y i3 libfuse2 git tmux kitty zsh clang gcc hsetroot picom rofi thunar ranger python-is-python3 xclip
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
chsh -s $(which zsh)


sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# For laptops sudo nvim /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf change the setting to 2 for faster wifi
