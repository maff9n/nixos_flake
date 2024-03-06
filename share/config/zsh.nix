{ pkgs, osConfig, ... }:
{
  programs.zsh = {
    enable = true;

    enableCompletion = true;

    shellAliases = {
      c = "git clean -ndx";
      cf = "git clean -fdx";
      r = "ranger";
      nconf = "cd $HOME/projects/nixos_flake";
      nreb = "nixos-rebuild switch --use-remote-sudo --flake /home/maff9n/projects/nixos_flake#${osConfig.networking.hostName}";


    };

    sessionVariables = {
      BAT_THEME = "gruvbox";
    };


    initExtra = ''
      stty -ixon > /dev/null # Disable flow control to enable ctrl q & s for ranger
    '';

    loginExtra = ''
      # bat cache --build # Load theme changes ### CAUSES INITs to not be executed!!!
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "history"
      ];
      theme = "gnzh";
    };
  };
} 
