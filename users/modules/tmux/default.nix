{  ... } :
{
  
  programs = {
    tmux = {
        enable = true;
        extraConfig = ''
            set-option -g default-terminal "xterm-16color"
            set-option -ga terminal-overrides ",*:colors=16"
            set -s escape-time 0

            unbind C-b
            set-option -g prefix C-a
            bind-key C-a send-prefix
            set -g status-style 'bg=#333333 fg=#5eacd3'

            set -g base-index 1

            bind -r ^ last-window
            bind -r k select-pane -U
            bind -r j select-pane -D
            bind -r h select-pane -L
            bind -r l select-pane -R

            bind-key -r f run-shell "tmux neww tmux-sessionizer"
            bind-key -r g run-shell "tmux neww dev-commit"
        '';
    };
  };
}
