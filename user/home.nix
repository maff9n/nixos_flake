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

  ## List of all packages explicitly available to the user
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
    #jamesdsp # equalizer
    gnome.eog
    #bundler
    #rclone
    jq # JSON tool
    alacritty # necesarry for i3status
    #gcc
    #nmap # hack the box
    clamav # antivirus "sudo freshclam" maybe required
    gnome.nautilus
    openvpn
    #htop # for checking on running processes
    duf # examine storage
    ###
    ### LIKELY NOT USEFULL TO KNOW
    ###
    #jdk
    #dart
    #networkmanagerapplet
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
    #powertop
    #latencytop
    ffmpeg
    audacity
    gnome.gnome-clocks
    #elmPackages.elm-format
    #elmPackages.elm-review
    #elmPackages.elm-live
    #elmPackages.elm-language-server
    #elmPackages.elm-spa
    rstudio
    #elmPackages.elm
    #xorg.xdpyinfo
    #lm_sensors
    #dmidecode
    fzf
    calibre # ebooks
    #inxi
    #glxinfo
    anki
    spotify
    navi
    openconnect
    #ntfs3g
    discord
    #fzf
    #selenium-server-standalone
    gparted
    inkscape
    scribus
    polybarFull
    imagemagick
    man
    #ghc
    #jekyll
    #cargo
    p7zip
    file
    zip
    unzip
    rnix-lsp
    nix-index
    #haskellPackages.haskell-language-server
    tldr
    #rust-analyzer
    python310Packages.python-lsp-server
    nodePackages.bash-language-server
    nodejs
    #bundix
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
    kitty
    sumneko-lua-language-server
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  imports = [
    (import ./../modules/android.nix)
    (import ./../modules/neovim.nix)
    (import ./../modules/i3.nix)
    (import ./../modules/rofi.nix)
    (import ./../modules/zsh.nix)
    (import ./../modules/kitty.nix)
    (import ./../modules/git.nix)
    (import ./../modules/ranger.nix { pkgs = pkgs; })
    (import ./../modules/bat.nix)
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
