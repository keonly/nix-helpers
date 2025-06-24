{
  description = "A stash of reusable Nix helpers";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-lib,
    flake-parts,
  } @ inputs: let
    systems = nixpkgs-lib.systems.flakeExposed;
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      inherit systems;

      flake.lib = import ./lib {
        inherit (nixpkgs-lib) lib;
      };

      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;
      };
    };
}
