# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ lib, config, pkgs, ... }:
{
  programs.zsh.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  services.xserver = {
    enable = true;
    layout = "de";
    displayManager.gdm.enable = true;
    desktopManager = {
      xterm.enable = true;
    };
  };

  services.clamav.daemon.enable = true;
  services.clamav.updater.enable = true;

  environment.pathsToLink = [ "/share/zsh" ];

  console.keyMap = "de";

  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # mkpasswd -m sha-512 <SECRET_PASSWORD>
  users.users.maff9n = {
    hashedPassword = "$6$By5yKLSyeWZJOhfZ$fo.Djt6NhvlvsRS5Z1dhReAyWncQ3t.G3Q46wpVcPi.EoS9IB1eMGfinWhduTQBkOG2jviIbvTVmPum9wnHdT0";
    isNormalUser = true;
    extraGroups = [ "docker" "wheel" "networkmanager" "audio" ];
    shell = pkgs.zsh;
  };

  networking.extraHosts = ''
    0.0.0.0 somethingsomething.com
    0.0.0.0 www.somethingsomething.com
    :: 0 www.somethingsomething.com
    :: 0 somethingsomething.com
  '';
  networking.wireless.userControlled.enable = false;
  networking.wireless.enable = false; # Enables wireless support via wpa_supplicant.

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs.ssh.startAgent = lib.mkForce true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
