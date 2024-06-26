{
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.wlp3s0.useDHCP = true;
  networking.hostName = "loki";

  nixpkgs.config.allowUnfree = true;

  services.tailscale.enable = true;
  networking.firewall.checkReversePath = "loose";

  virtualisation.docker.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad = {
    naturalScrolling = false;
    middleEmulation = false;
    tapping = false;
  };
}
