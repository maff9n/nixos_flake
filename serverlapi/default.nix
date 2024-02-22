{ pkgs, lib, ... }:
with lib;
{
  require = [
    ./machine_specifics.nix
    ./hardware-configuration.nix
    ./configuration.nix
  ];
}
