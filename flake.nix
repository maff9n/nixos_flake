{
  description = "Collection of nixOS configurations";

  inputs = rec {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
    nur.url = github:nix-community/NUR;
    kickstart-neovim = {
      url = "github:nvim-lua/kickstart.nvim/master";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, nur, ... }@attrs: {};
}
