{ lib, pkgs, nixpkgs-unstable, ... }:
let
  unstable = import nixpkgs-unstable { system = "x86_64-linux"; };
in
{
  home.keyboard.layout = "de";
  home.username = "maff9n";
  home.homeDirectory = "/home/maff9n";
  home.stateVersion = "22.05";

  xsession.enable = true;
  xsession.windowManager.command = lib.mkForce "exec ${pkgs.i3}/bin/i3";

  home.packages = with pkgs; [
    zettlr # markdown editor
    neovim # editor
    fd # file search
    jamesdsp # equalizer
    gnome.eog # image viewer
    jq # JSON
    alacritty # necesarry for i3status
    clamav # antivirus "sudo freshclam"
    gnome.nautilus # file explorer
    openvpn # vpn
    htop # processes
    duf # storage
    networkmanagerapplet # network
    xclip # clipboard
    jsoncpp # necessary for polybar
    nixpkgs-fmt # nix file formater
    bat # text output
    tig # git interface
    gnome.gnome-font-viewer # font viewer
    gnome.vinagre # remote desktop viewer
    ffmpeg # audio and video editing
    audacity # audio recording & editing
    gnome.gnome-clocks # clocks, alarm etc.
    fzf # fuzzy finder
    calibre # ebooks
    inxi # system information
    anki # flash cards
    spotify # music
    navi # commands knowledge
    openconnect # networking vpn
    ntfs3g # file system
    discord # chat
    gparted # partition
    inkscape # image editor
    tokei # repository language
    scribus # text editor
    polybarFull # status bars
    imagemagick # image editor
    man # commands knowledge
    p7zip # file archive
    file # file info
    zip # file archive
    unzip # file archive
    tldr # commands knowledge
    magic-wormhole # file transfer
    obs-studio # stream
    oh-my-zsh # shell zsh
    ripgrep # file find text string
    firefox # browser
    brave # browser
    redshift # display temperature
    ranger # file explorer
    libreoffice # document editor
    tree # file explorer
    git # content managment
    unstable.signal-desktop # chat messenger
    gimp # image editor
    feh # display image
    vlc # media player
    thunderbird # email
    insomnia # rest api
    pavucontrol # audio managment
    i3lock # lock screen
    i3 # windowManager
    parallel # run commands parallel
    rofi # application launcher and so much more
    kitty # terminal
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; }) # fonts
    # gitFull
    # powertop
    # latencytop # requires kernel flag
    # hyperfine # benchmark for commands
  ];

  imports = [
    (import ./../modules/neovim.nix)
    (import ./../modules/i3.nix)
    (import ./../modules/rofi.nix)
    (import ./../modules/zsh.nix)
    (import ./../modules/kitty.nix)
    (import ./../modules/git.nix)
    (import ./../modules/ranger.nix { pkgs = pkgs; username = "maff9n"; })
    (import ./../modules/tmux.nix { pkgs = pkgs; })
    (import ./../modules/redshift.nix)
    (import ./../modules/polybar.nix)
  ];

  fonts.fontconfig.enable = true;
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
  programs.home-manager.enable = true;
  programs.firefox = import ./../modules/firefox.nix { inherit lib pkgs; };
}
