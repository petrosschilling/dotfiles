# Reload Tmux config with Ctrl-b r
bind r source-file ~/.config/tmux/tmux.conf \; display-message "✅ Reloaded Tmux config"

# Unbind any default backspace or behavior
unbind -n C-h
unbind -n C-j
unbind -n C-k
unbind -n C-l

# Optional: add pane navigation for tmux-native panes
bind -n C-h select-pane -L
bind -n C-j select-pane -D
bind -n C-k select-pane -U
bind -n C-l select-pane -R

