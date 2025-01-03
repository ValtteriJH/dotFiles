#!/bin/bash
# Add BitBucket key to session
# ssh-add FSSH/FujitsuKey

# Restart mouse drivers
# sudo systemctl restart logid
hsetroot -fill ~/.wallpaper.jpg
## Custom TMUX View
# Start a new detached tmux session named swiderSession
tmux new-session -d -s swiderSession


# Create the first window named GFG_Overview with an 'echo' command
tmux select-pane -t 0

tmux split-window -h -t 0 -l '70%' "btop"

# Split the first window horizontally and send a 'pwd' command to the new pane
#tmux select-window -t 1
#tmux send-keys -t swiderSession "echo 'Welcome to GeeksforGeeks!'" C-m


# Create a new window named GFG_Code with an 'ls' command
# tmux new-window -t swiderSession "ls" C-m

# Split the GFG_Code window vertically and send an 'echo' command to the new pane
tmux select-pane -t 0
tmux split-window -v -t 0 -l '95%'
tmux send-keys -t 0 "neofetch" C-m
tmux send-keys -t 0 "pomodoro start -w -d 112 -t \"112/26 creating | 25/10 studying\";pomodoro finish"
tmux select-pane -t 2

tmux send-keys -t 1 "curl wttr.in/Tampere" C-m
tmux send-keys -t 1 # "i3lock -c 000000"
tmux select-pane -t 0


#tmux send-keys -t 2 "i3lock -c 000000"

# Create a new window named GFG_Terminal with an 'ls' command
# tmux new-window -t swiderSession "ls" C-m

# Attach to the tmux session

tmux attach-session -t swiderSession 
fg


