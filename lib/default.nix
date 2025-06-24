{lib, ...}: {
  attrsets = import ./attrsets.nix {inherit lib;};
  filesystem = import ./filesystem.nix {inherit lib;};
}
