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
    ###
    ### LOOK AT THESE
    ###
    #hyperfine # benchmark for commands
    #procs
    zettlr # markdown
    youtube-dl
    neovim
    fd
    jamesdsp # equalizer
    gnome.eog
    jq # JSON
    alacritty # necesarry for i3status
    clamav # antivirus "sudo freshclam"
    gnome.nautilus
    openvpn
    htop # processes
    duf # storage
    #jdk
    networkmanagerapplet # network
    xclip
    jsoncpp # necessary for polybar
    nixpkgs-fmt
    bat # override?
    tig
    gnome.gnome-font-viewer
    gnome.vinagre
    powertop
    #latencytop needs a certain kernel flag
    ffmpeg
    audacity
    gnome.gnome-clocks
    # rstudio # statistics
    #xorg.xdpyinfo # displaying information about an X server
    #dmidecode # DMI SMBIOS
    fzf
    calibre # ebooks
    #inxi # system information
    anki
    spotify
    navi
    openconnect
    ntfs3g
    discord
    gparted
    inkscape
    scribus
    polybarFull # override?
    imagemagick
    man
    p7zip
    file
    zip
    unzip
    nix-index
    tldr
    magic-wormhole
    obs-studio
    oh-my-zsh
    ripgrep
    firefox
    brave
    redshift
    ranger
    libreoffice
    tree
    git
    #gitFull
    unstable.signal-desktop
    gimp
    feh
    vlc
    thunderbird
    insomnia
    pavucontrol
    i3lock
    i3
    parallel
    rofi
    kitty # override?
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  imports = [
    (import ./../modules/neovim.nix)
    (import ./../modules/i3.nix)
    (import ./../modules/rofi.nix)
    (import ./../modules/zsh.nix)
    (import ./../modules/kitty.nix)
    (import ./../modules/git.nix)
    (import ./../modules/ranger.nix { pkgs = pkgs; })
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
