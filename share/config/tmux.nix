{ ... }: {
  programs.tmux = {

    extraConfig = ''
      set -g default-terminal "screen-256color"
      set-option -sa terminal-overrides ",xterm-kitty:RGB"
    '';
  };
}
