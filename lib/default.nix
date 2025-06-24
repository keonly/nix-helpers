{
  lib,
  haumea,
  ...
}: {
  attrsets = import ./attrsets.nix {inherit lib;};
  filesystem = import ./filesystem.nix {inherit lib;};
  path = import ./path.nix {inherit lib haumea;};
}
