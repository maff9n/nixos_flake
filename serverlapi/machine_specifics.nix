{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  networking.hostName = "serverlapi";

  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad = {
    naturalScrolling = false;
    middleEmulation = false;
    tapping = false;
  };
}
