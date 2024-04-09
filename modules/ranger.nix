{ pkgs, username, ... }:
{
  programs.zsh.initExtra = ''
    VISUAL=nvim # Make nvim rangers default
    EDITOR=nvim # Make nvim rangers default
  '';
  xdg.configFile."ranger/rc.conf".text = ''
    map DD shell mkdir -p /home/${username}/.local/share/Trash/files && mv %s /home/${username}/.local/share/Trash/files/
    set mouse_enabled false
    unmap q Q n N <up> <down> <left> <right>
    map <C-q> quit
  '';
  xdg.configFile."ranger/rifle.conf".text = ''
    ext pdf = firefox "$@"
    ext epub = calibre "$@"
    ext mp4|mov|avi|mkv|wmv|flv|webm|avchd|mpeg|h264|mp3|wav|wma|aac|flac|ogg|aiff|m4a|alac|opus = vlc "$@"
    ext md = nvim "$@"
    else = nvim "$@"
  '';
}
