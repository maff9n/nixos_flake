{ lib, pkgs, ... }:
{
  boot.loader.timeout = 5;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # boot.loader.grub.enable = true;
  # boot.loader.grub.version = 2;
  # boot.loader.grub.useOSProber = true;
  # boot.loader.grub.device = "/dev/nvme0n1";

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = false;

  networking.hostName = "ullr";

  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 93d";
  nix.settings.auto-optimise-store = false;

  # LATENCYTOP
  # LATENCYTOP
  # LATENCYTOP
  # nixpkgs.config.packageOverrides = pkgs: pkgs.lib.recursiveUpdate pkgs {
  #   linuxKernel.kernels.linux_5_15 = pkgs.linuxKernel.kernels.linux_5_15.override {
  #     extraConfig = ''
  #       HAVE_LATENCYTOP_SUPPORT y
  #       SCHEDSTATS y
  #       LATENCYTOP y
  #     '';
  #     ignoreConfigErrors = true;
  #   };
  # };

  environment.systemPackages = [ pkgs.tailscale pkgs.qemu ];

  services.tailscale.enable = true;

  services.openssh.enable = true;

  nixpkgs.config.allowUnfree = true;
  hardware.enableAllFirmware = true;

  boot.loader.systemd-boot.configurationLimit = 5;
}
