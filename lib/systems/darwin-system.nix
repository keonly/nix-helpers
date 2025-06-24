{
  lib,
  inputs,
  darwinModules,
  homeModules ? [],
  vars,
  system,
  specialArgs,
  ...
}: let
  inherit (inputs) nixpkgs-darwin home-manager nix-darwin;
  hmBlock = lib.homeManagerBlock {
    homeManagerBaseModule = home-manager.darwinModules.home-manager;
    homeModules = homeModules;
    specialArgs = specialArgs;
    vars = vars;
  };
in
  nix-darwin.lib.darwinSystem {
    inherit system specialArgs;
    modules =
      darwinModules
      ++ [
        ({lib, ...}: {
          nixpkgs.pkgs = import nixpkgs-darwin {
            inherit system;
            overlays = [(import ../lib)];
            config = {
              allowUnfree = true;
            };
          };
        })
      ]
      ++ (
        lib.optionals (homeModules != []) [hmBlock]
      );
  }
