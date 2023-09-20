{ lib, pkgs, ... }:
let
in
{
  home.keyboard.layout = "de";

  home.username = "maff9n";
  home.homeDirectory = "/home/maff9n";
  home.stateVersion = "22.05";

  xsession.enable = true;
  xsession.windowManager.command = lib.mkForce "exec ${pkgs.i3}/bin/i3";

  ## List of all packages explicitly available to the user
  home.packages = with pkgs; [
    ###
    ### LOOK AT THESE
    ###
    hyperfine # benchmark for commands
    procs
    zettlr # markdown
    fd
    gnome.eog
    bundler
    rclone
    jq # JSON tool
    alacritty # necesarry for i3status
    gcc
    nmap # hack the box
    gnome.nautilus
    openvpn
    htop # for checking on running processes
    duf # examine storage
    ###
    ### LIKELY NOT USEFULL TO KNOW
    ###
    jdk
    dart
    networkmanagerapplet
    niv
    xclip
    jsoncpp # necessary for polybar
    nixpkgs-fmt
    ###
    ### THINGS U KNOW
    ###
    bat
    tig
    gnome.gnome-font-viewer
    gnome.vinagre
    powertop
    latencytop
    ffmpeg
    audacity
    gnome.gnome-clocks
    elmPackages.elm-format
    elmPackages.elm-review
    elmPackages.elm-live
    elmPackages.elm-language-server
    elmPackages.elm-spa
    elmPackages.elm
    xorg.xdpyinfo
    lm_sensors
    dmidecode
    calibre # ebooks
    inxi
    glxinfo
    spotify
    navi
    openconnect
    ntfs3g
    discord
    fzf
    selenium-server-standalone
    gparted
    inkscape
    scribus
    polybarFull
    imagemagick
    man
    ghc
    jekyll
    cargo
    p7zip
    file
    zip
    unzip
    rnix-lsp
    nix-index
    haskellPackages.haskell-language-server
    tldr
    rust-analyzer
    python310Packages.python-lsp-server
    nodePackages.bash-language-server
    nodejs
    bundix
    rustc
    cabal-install
    hlint
    cabal2nix
    magic-wormhole
    obs-studio
    oh-my-zsh
    ripgrep
    firefox
    brave
    tmux
    redshift
    ranger
    libreoffice
    tree
    git
    #gitFull
    pkgs.signal-desktop
    gimp
    feh
    vlc
    thunderbird
    insomnia
    pavucontrol
    i3lock
    i3
    rofi
    kitty
    sumneko-lua-language-server
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  imports = [
    (import ./config/android.nix)
    (import ./config/neovim.nix)
    (import ./config/i3.nix)
    (import ./config/rofi.nix)
    (import ./config/zsh.nix)
    (import ./config/kitty.nix)
    (import ./config/git.nix)
    (import ./config/ranger.nix { pkgs = pkgs; })
    (import ./config/bat.nix)
    (import ./config/tmux.nix)
    (import ./config/redshift.nix)
    (import ./config/polybar.nix)
  ];

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
  programs.firefox = import ./config/firefox.nix { inherit lib pkgs; };
}
