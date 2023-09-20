{ pkgs, ... }:
{

  programs.zsh.initExtra = ''
    VISUAL=nvim # Make nvim rangers default
    EDITOR=nvim # Make nvim rangers default
  '';

  xdg.configFile."ranger/rc.conf".text = ''
    set mouse_enabled false



    unmap q Q n N <up> <down> <left> <right>
    map <C-q> quit
  '';
}
