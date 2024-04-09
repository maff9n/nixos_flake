{ pkgs, ... }:
let
  lib = import <nixpkgs/lib>;
in
with lib; {
  programs.rofi = {
    enable = true;
  };
}
