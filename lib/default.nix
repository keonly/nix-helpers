{lib, ...}: {
  attrsets = import ./utils/attrsets.nix {inherit lib;};
  filesystem = import ./utils/filesystem.nix {inherit lib;};

  homeManagerBlock = import ./systems/home-manager-block.nix;
  darwinSystem = import ./systems/darwin-system.nix;
  nixosSystem = import ./systems/nixos-system.nix;
}
