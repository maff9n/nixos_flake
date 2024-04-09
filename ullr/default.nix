{ pkgs, lib, ... }:
{
  require = [
    ./machine_specifics.nix
    ./hardware-configuration.nix
  ];
}
