{
  lib,
  haumea,
  ...
}: let
  filesystem = import ./filesystem.nix {inherit lib;};
in {
  collectImportsList = path:
    path
    |> filesystem.listFilesNonRecursive
    |> lib.lists.filter (p: builtins.baseNameOf p != "default.nix");

  loadImportsList = args:
    haumea.lib.load {
      inherit (args) src inputs;
    }
    |> builtins.attrValues;
}
