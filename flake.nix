{
  description = "Collection of nixOS configurations";

  inputs = rec {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
    nur.url = "github:nix-community/NUR";
    nvim.url = "github:maff9n/neovim_flake/d439bddeba8f768cc9c51ea8df75cee85fe0cdb6";
  };

  outputs = { self, nvim, nixpkgs, home-manager, nur, ... }@attrs: {
    nixosConfigurations.server =
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
          ./serverlapi
        ];
      };

    nixosConfigurations.loki = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        ./loki
        ./user
        home-manager.nixosModules.home-manager
        {
          nixpkgs.overlays = [
            nur.overlay
            (final: prev: { neovim = nvim.outputs.packages.x86_64-linux.default; })
          ];
        }
      ];
    };

    nixosConfigurations.ullr = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        ./ullr
        ./user
        home-manager.nixosModules.home-manager
        {
          nixpkgs.overlays = [
            nur.overlay
            (final: prev: { neovim = nvim.outputs.packages.x86_64-linux.default; })
          ];
        }
      ];
    };
  };
}
