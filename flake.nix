{
  description = "A stash of reusable Nix helpers";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-lib,
    flake-utils,
  } @ inputs:
    {
      lib = import ./lib {inherit (nixpkgs-lib) lib;};
    }
    // flake-utils.lib.eachDefaultSystem (system: {formatter = nixpkgs.legacyPackages.${system}.alejandra;});
}
