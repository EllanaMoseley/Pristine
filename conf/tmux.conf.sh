# Change the Prefix
unbind C-b
set -g prefix C-a

# clear scrollback
bind -n C-k clear-history

# Pane Switching Using Mouse
#set-option -g mouse-select-pane on

# Splitting windows into panes with h and v
bind-key h split-window -v
bind-key v split-window -h

# Set up resize-pane keys
bind-key + resize-pane -D 1
bind-key / resize-pane -L 1
bind-key - resize-pane -U 1
bind-key * resize-pane -R 1

set -g default-terminal "xterm-256color"
set-option -g history-limit 20000
# use vi style keybindings
setw -g mode-keys vi

# Start windows and panes at 1, not 0
set -g base-index 1
setw -g pane-base-index 1

set -g status-position bottom
set -g status-bg colour237
set -g status-fg colour137
set -g status-attr dim
set -g status-right '#[fg=colour165]#[bg=default] #H  '
set -g status-right-length 100

# Highlight current window
# set-window-option -g window-status-current-bg yellow
setw -g aggressive-resize
setw -g window-status-current-fg colour170
setw -g window-status-current-bg colour239
setw -g window-status-current-attr bold
setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour170]#F '

set-option -g set-titles-string 'do epic shit. | #S | / #W'
setw -g window-status-current-fg colour170
setw -g window-status-current-attr bold
setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour170]#F '

# Task manager
set -g @tasks_manager 'taskwarrior'

# Colors
set -g @tasks_format_begin '#[fg=white,bg=colour236]'
set -g @tasks_format_end '#[fg=white,bg=colour236]'

# Auto install tpm if required (or not)
if "test ! -d ~/.tmux/plugins/tpm" \
   "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm'"
#  List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
# enable saving and restoring tmux pane contents (maybe not required if using tmux-continuum)
set -g @resurrect-capture-pane-contents on
set -g @continuum-save-interval '0'
set -g @continuum-restore 'on'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com/user/plugin'
# set -g @plugin 'git@bitbucket.com/user/plugin'

run '~/.tmux/plugins/tpm/tpm'