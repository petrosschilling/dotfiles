### Basic Settings
set -g status on
set -g status-interval 5
set -g status-justify left
set -g status-left-length 40
set -g status-right-length 100

### Remove Unwanted Notifications
set -g window-status-activity-style none
set -g window-status-bell-style none

### Background + Text
set -g status-bg "#1c1c1c"
set -g status-fg "#d0d0d0"

### Right Side:
set -g status-right ""

### Left Side: Session Name + Index
set -g status-left "#[fg=#1c1c1c,bg=#b1e7dd] #S #[default]"

### Inactive Window Tabs
setw -g window-status-format "#[fg=#afbea2,bg=#1c1c1c] #I #[fg=#d0d0d0,bg=#1c1c1c]#W #[default]"

### Active Window Tab
setw -g window-status-current-format "#[fg=#1c1c1c,bg=#e4c9af] #I #[bold]#W #[default]"
