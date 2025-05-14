{
  lib,
  haumea,
  ...
}: let
  callLibs = file: import file {inherit lib haumea;};
in {
  attrsets = callLibs ./attrsets.nix;
  filesystem = callLibs ./filesystem.nix;
  path = callLibs ./path.nix;
}
