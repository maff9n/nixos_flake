{ ... }:
let
in
{

  #xdg.configFile."bat/themes/gruvbox.tmTheme".source = themeFile;

  #programs.bat = {

  #    config.theme = builtins.mkDefault "gruvbox";
  #    themes.gruvbox = builtins.readFile themeFile;

  #};
}
