{ pkgs, lib, home-manager, nixpkgs-unstable, ... }:
with lib;
{
  require = [
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.maff9n = import ./home.nix { inherit nixpkgs-unstable pkgs lib; };
    }
    (import ./configuration.nix)
  ];
}
