{ ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      # copy_on_select = "clipboard";
      confirm_os_window_close = "0";
      enable_audio_bell = false;
    };
    theme = ''Gruvbox Dark Hard'';
  };
}
