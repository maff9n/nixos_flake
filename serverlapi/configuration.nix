# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ lib, config, pkgs, ... }:
{
  ###
  ### MOVE THIS INTO A SEPERATE FILE U CAN ACTUALLY PUBLISH ON GITHUB
  ###
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.logind.lidSwitch = "ignore";

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "de";
    displayManager.gdm.enable = true;
    desktopManager = {
      gnome.enable = true;
    };
  };

  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad = {
    naturalScrolling = false;
    middleEmulation = false;
    tapping = false;
  };
  users.users.alice = {
    isNormalUser = true;
    home = "/home/alice";
    description = "Alice Foobar";
    extraGroups = [ "wheel" "networkmanager" ];
    # openssh.authorizedKeys.keys  = [ "ssh-dss AAAAB3Nza... alice@foobar" ];
  };
  environment.etc."nextcloud-admin-pass".text = "test123";
  services.nextcloud = {
    enable = true;
    https = false;
    package = pkgs.nextcloud26;
    hostName = "localhost";
    config.extraTrustedDomains = [ "100.92.224.132" "192.168.1.113" ];
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    # extraApps = let
    #     some = config.services.nextcloud.extraApps;
    #     in with some; {
    #   inherit news contacts calendar tasks;
    # };
    extraAppsEnable = false;
  };
  # services.nextcloud = {
  #   enable = true;
  #   hostName = "cloud.example.com";
  #   https = true;
  #       package = pkgs.nextcloud26;
  #   config = {
  #     dbtype = "pgsql";
  #     dbuser = "nextcloud";
  #     dbhost = "/run/postgresql";
  #     dbname = "nextcloud";
  #     adminuser = "root";
  #     adminpassFile = "/var/lib/nextcloud/adminpass";
  #   };
  # };

  # services.postgresql = {
  #   enable = true;
  #   ensureDatabases = [ "nextcloud" ];
  #   ensureUsers = [
  #     {
  #       name = "nextcloud";
  #       ensurePermissions."DATABASE nextcloud" = "ALL PRIVILEGES";
  #     }
  #   ];
  # };

  # systemd.services."nextcloud-setup" = {
  #   requires = [ "postgresql.service" ];
  #   after = [ "postgresql.service" ];
  # };

  # services.nginx = {
  #   enable = true;
  #   recommendedGzipSettings = true;
  #   recommendedOptimisation = true;
  #   recommendedProxySettings = true;
  #   recommendedTlsSettings = true;

  #   virtualHosts = {
  #     "cloud.example.com" = {
  #       forceSSL = true;
  #       enableACME = true;
  #     };
  #   };
  # };

  # services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
  #   forceSSL = true;
  #   enableACME = true;
  # };
  console.keyMap = "de";

  # systemd.services.NetworkManager-wait-online.enable = false;
  networking.wireless.userControlled.enable = false;
  networking.wireless.enable = false; # Enables wireless support via wpa_supplicant.

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.acme.defaults.email = "marvin1995mann@gmail.com";
  security.acme.acceptTerms = true;
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

  environment.systemPackages = [ pkgs.tailscale ];

  services.tailscale.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs.ssh.startAgent = lib.mkForce true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  networking.firewall = {
    # enable the firewall
    enable = true;

    # always allow traffic from your Tailscale network
    trustedInterfaces = [ "tailscale0" ];

    # allow the Tailscale UDP port through the firewall
    allowedUDPPorts = [ config.services.tailscale.port ];

    # allow you to SSH in over the public internet
    allowedTCPPorts = [ 22 ]; # Wieder einschränken?
    # allowedTCPPorts = [ 80 443 ];
  };
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

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
  system.stateVersion = "22.11"; # Did you read the comment?
}
