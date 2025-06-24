{
  lib,
  inputs,
  nixosModules,
  homeModules ? [],
  vars,
  system,
  specialArgs,
  ...
}: let
  inherit (inputs) nixpkgs home-manager;
  hmBlock = lib.homeManagerBlock {
    homeManagerBaseModule = home-manager.nixosModules.home-manager;
    homeModules = homeModules;
    specialArgs = specialArgs;
    vars = vars;
  };
in
  nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    overlays = [(import ../lib)];
    modules =
      nixosModules
      ++ (
        lib.optionals (homeModules != []) [hmBlock]
      );
  }
