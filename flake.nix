{
  description = "A stash of reusable Nix helpers";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
    flake-utils.url = "github:numtide/flake-utils";
    haumea = {
      url = "github:nix-community/haumea";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-lib,
    flake-utils,
    haumea,
  } @ inputs:
    {
      lib = import ./lib {
        inherit (nixpkgs-lib) lib;
        inherit haumea;
      };
    }
    // flake-utils.lib.eachDefaultSystem (system: {formatter = nixpkgs.legacyPackages.${system}.alejandra;});
}
