Confs for my machines, surface pro with kernel patch, nvidia machines with i3

packages: sudo apt install
sway brightnessctl pulseaudio pavucontrol kitty btop
or requirements.sh

For perma darkmode add to /etc/environment
export GTK_THEME=Adwaota-dark

drop settings.desktop in ubuntu systems to /usr/share/applications

git ones below

1. Install deb os of your liking
2. Install sway
3. Patch kernel with https://github.com/linux-surface/linux-surface/wiki/Installation-and-Setup
4. install  https://github.com/JeromeSiljanUTA/media-control-sway
5. install logid mx master thing
7. Add the confs to .conf
8. put the keyd to /etc/keyd/default.conf

TODOS
make shuffler binary easily accessible, update git
xhost + local:
for sway auth
1. See conf files to find specific TODO:s
2. Update readme to include all dependencies
3. Create dependency add script
4. Include auto open things to startupscript. See SS in env
5. Add home folder management thing so everything is updated from single source of truth
6. Add browserExtensions: Ublock, Vimium, Dark Reader, (Onetab?)
7. Add logid confs
8. Add kernel patch files and instructions
