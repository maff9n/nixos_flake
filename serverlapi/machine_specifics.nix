{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "serverlapi";

  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad = {
    naturalScrolling = false;
    middleEmulation = false;
    tapping = false;
  };
}
