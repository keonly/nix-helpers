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
    defaultSystems = [
      "aarch64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      flake.lib = import ./lib {
        inherit (nixpkgs-lib) lib;
      };

      systems = defaultSystems;
      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;
      };
    };
}
