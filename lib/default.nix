{lib, ...}: let
  callLibs = file: import file {inherit lib;};
in {
  attrsets = callLibs ./attrsets.nix;
  filesystem = callLibs ./filesystem.nix;
  path = callLibs ./path.nix;
  versions = callLibs ./versions.nix;
}
