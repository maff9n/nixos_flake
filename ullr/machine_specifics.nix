{ lib, pkgs, ... }:
{
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  # networking.useDHCP = false;
  # networking.interfaces.enp5s0.useDHCP = true;
  # networking.interfaces.wlp3s0.useDHCP = true;

  boot.loader.timeout = 10;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # boot.loader.grub.enable = true;
  # boot.loader.grub.version = 2;
  # boot.loader.grub.useOSProber = true;
  # boot.loader.grub.device = "/dev/nvme0n1";

  services.xserver.videoDrivers = [ "nvidia" ];

  networking.hostName = "ullr";

  nixpkgs.config.packageOverrides = pkgs: pkgs.lib.recursiveUpdate pkgs {
    linuxKernel.kernels.linux_5_15 = pkgs.linuxKernel.kernels.linux_5_15.override {
      extraConfig = ''
        HAVE_LATENCYTOP_SUPPORT y
        SCHEDSTATS y
        LATENCYTOP y
      '';
      ignoreConfigErrors = true;
    };
  };

    environment.systemPackages = [ pkgs.tailscale ];

  services.tailscale.enable = true;

  services.openssh.enable = true;

  # boot.kernelPackages = pkgs.linuxPackages_latest;

  nixpkgs.config.allowUnfree = true;
  hardware.enableAllFirmware = true;

  boot.loader.systemd-boot.configurationLimit = 10;
}
