# Reload Tmux config with Ctrl-b r
bind r source-file ~/.config/tmux/tmux.conf \; display-message "✅ Reloaded Tmux config"

# Native fallback pane navigation (when not in Neovim)

# Ctrl + h → move left
bind -n C-h select-pane -L

# Ctrl + j → move down
bind -n C-j select-pane -D

# Ctrl + k → move up
bind -n C-k select-pane -U

# Ctrl + l → move right
bind -n C-l select-pane -R

